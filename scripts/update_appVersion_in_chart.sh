#!/bin/bash

set -o pipefail

[[ "${#}" == "3" ]] || {
    echo "Please give the chart name, the update type and the new appVersion as only arguments"
    exit 3
}

CHART="${1}"
UPDATE_TYPE="${2}"
APPVERSION="${3}"

version="$(awk '/^version:/ {print $2}' "charts/${CHART}/Chart.yaml")"
echo "Old version is ${version}"
major="$(echo "${version}" | cut -d. -f1)"
minor="$(echo "${version}" | cut -d. -f2)"
patch="$(echo "${version}" | cut -d. -f3)"

if [[ "${UPDATE_TYPE}" =~ (major|replacement) ]]
then
  major="$(( major + 1 ))"
  minor=0
  patch=0
elif [[ "${UPDATE_TYPE}" =~ 'minor' ]]
then
  minor="$(( minor + 1 ))"
  patch=0
else
  patch="$(( patch + 1 ))"
fi

newversion="${major}.${minor}.${patch}"
echo "New version is ${newversion}"

# change version in Chart.yaml
sed -i "s/^version:.*/version: ${newversion}/g" "charts/${CHART}/Chart.yaml"

# change artifacthub annotation in Chart.yaml
sed -i "s/- kind: .*$/- kind: changed/g" "charts/${CHART}/Chart.yaml"
sed -i "/kind/ {n; s/description:.*/description: update ${CHART} to ${APPVERSION}/g}" "charts/${CHART}/Chart.yaml"

# change versions in README.md
sed -i "/img.shields.io/ s/Version\\: ${version}/Version: ${newversion}/g" "charts/${CHART}/README.md"
sed -i "/img.shields.io/ s/Version-${version}-informational/Version-${newversion}-informational/g" "charts/${CHART}/README.md"

changelog="
### Version ${newversion}

#### Added

N/A

#### Changed

* update ${CHART} to ${APPVERSION}

#### Fixed

N/A"

if grep -q ^appVersion "charts/${CHART}/Chart.yaml"
then
    sed -i "/adheres/r /dev/stdin"<<< "${changelog}" -- "charts/${CHART}/README_CHANGELOG.md.gotmpl"
else
    # nothing to do, as this is a library chart without an appVersion
    true
fi
