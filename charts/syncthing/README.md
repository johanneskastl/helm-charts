# syncthing

![Version: 4.1.0](https://img.shields.io/badge/Version-4.1.0-informational?style=flat-square) ![AppVersion: 1.19.0](https://img.shields.io/badge/AppVersion-1.19.0-informational?style=flat-square)

Open Source Continuous File Synchronization

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 3.5.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://syncthing.net/>
* <https://github.com/syncthing/syncthing>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install syncthing johanneskastl-helm-charts/syncthing
```

## Installing the Chart

To install the chart with the release name `syncthing`

```console
helm install syncthing johanneskastl-helm-charts/syncthing
```

## Uninstalling the Chart

To uninstall the `syncthing` deployment

```console
helm uninstall syncthing
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install syncthing \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/syncthing
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install syncthing johanneskastl-helm-charts/syncthing -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"syncthing/syncthing"` | image repository |
| image.tag | string | `"1.18.2"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 4.1.0

#### Added

N/A

#### Changed

* update appVersion to 1.19.0

### Version 4.0.7

#### Added

N/A

#### Changed

* update dependency for 'common' chart

### Version 4.0.6

#### Added

N/A

#### Changed

* update appVersion to 1.18.6

### Version 4.0.5

#### Added

N/A

#### Changed

* update appVersion to 1.18.5

### Version 4.0.4

#### Added

N/A

#### Changed

* update appVersion to 1.18.4

### Version 4.0.3

#### Added

N/A

#### Changed

* update appVersion to 1.18.3

### Version 4.0.2

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 4.0.1

#### Added

N/A

#### Changed

* Chart.yaml: Fix link in home URL

#### Fixed

N/A

### Version 4.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 3.5.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
