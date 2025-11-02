#!/usr/bin/bash
set -eu

# Generate helm-docs for the common library chart
# Usage ./common_README_with_helm-docs.sh

if [ $# -gt 0 ]
then
    echo "Please use this script without arguments"
    echo "Usage: ./common_README_with_helm-docs.sh"
    exit 1
fi

# require helm-docs
command -v helm-docs >/dev/null 2>&1 || {
    echo >&2 "helm-docs (https://github.com/k8s-at-home/helm-docs) is not installed. Aborting."
    exit 1
}

# Templates to use for README generation
readme_template="README.md.gotmpl"
readme_config_template="README_CONFIG.md.gotmpl"
readme_changelog_template="README_CHANGELOG.md.gotmpl"

root="charts/common/"

# Run helm-docs for charts
# 20230405 use binary from k8s-at-home fork
helm-docs-k8s-at-home \
    --ignore-file="/dev/null" \
    --template-files="${readme_template}" \
    --template-files="${readme_config_template}" \
    --template-files="${readme_changelog_template}" \
    --chart-search-root="${root}"
