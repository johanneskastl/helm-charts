#!/usr/bin/bash
set -eu

# Generate helm-docs for Helm charts
# Usage ./gen-helm-docs.sh [chart]

if [ $# -gt 1 ]
then
    echo "Please use this script without arguments or"
    echo "with only one single chart name as argument"
    echo "Usage: ./gen-helm-docs.sh [chart]"
    exit 1
fi

# require helm-docs
command -v helm-docs >/dev/null 2>&1 || {
    echo >&2 "helm-docs (https://github.com/k8s-at-home/helm-docs) is not installed. Aborting."
    exit 1
}

# Absolute path of repository
repository=$(git rev-parse --show-toplevel)

# Templates to use for README generation
readme_config_template="README_CONFIG.md.gotmpl"
readme_changelog_template="README_CHANGELOG.md.gotmpl"

# Gather all charts using the common library, excluding common-test
charts=$(find "${repository}" -name "Chart.yaml")

# Allow for a specific chart to be passed in as a argument
if [ $# == 1 ] ; then
    charts="${repository}/charts/$1/Chart.yaml"
    root="$(dirname "${charts}")"
    if [ ! -f "$charts" ]; then
        echo "File ${charts} does not exist."
        exit 1
    fi
else
    root="${repository}/charts"
fi

# Run helm-docs for charts
# 20230405 use binary from k8s-at-home fork
helm-docs-k8s-at-home \
    --ignore-file="${repository}/.helmdocsignore" \
    --template-files="../../.helm-docs-templates/README.md.gotmpl" \
    --template-files="${readme_config_template}" \
    --template-files="${readme_changelog_template}" \
    --chart-search-root="${root}"
