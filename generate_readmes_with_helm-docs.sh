#!/usr/bin/bash
set -eu

# Generate helm-docs for Helm charts
# Usage ./gen-helm-docs.sh [chart]

# require helm-docs
command -v helm-docs >/dev/null 2>&1 || {
    echo >&2 "helm-docs (https://github.com/k8s-at-home/helm-docs) is not installed. Aborting."
    exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Templates to copy into each chart directory
readme_template="${repository}/.helm-docs-templates//README.md.gotmpl"
readme_config_template="${repository}/.helm-docs-templates//README_CONFIG.md.gotmpl"
readme_changelog_template="README_CHANGELOG.md.gotmpl"

# Gather all charts using the common library, excluding common-test
charts=$(find "${repository}" -name "Chart.yaml")

# Allow for a specific chart to be passed in as a argument
if [ $# -gt 0 ] && [ -n "$1" ] ; then
    charts="${repository}/charts/$1/Chart.yaml"
    root="$(dirname "${charts}")"
    if [ ! -f "$charts" ]; then
        echo "File ${charts} does not exist."
        exit 1
    fi
else
    root="${repository}/charts"
fi

for chart in ${charts}
do
    chart_directory="$(dirname "${chart}")"
    echo "-] Copying templates to ${chart_directory}"
    # Copy CONFIG template to each Chart directory, do not overwrite if exists
    cp -n "${readme_config_template}" "${chart_directory}" || true
done

# Run helm-docs for charts
# 20230405 use binary from k8s-at-home fork
helm-docs-k8s-at-home \
    --ignore-file="${repository}/.helmdocsignore" \
    --template-files="${readme_template}" \
    --template-files="$(basename "${readme_config_template}")" \
    --chart-search-root="${root}"
