# syncthing

![Version: 4.12.0](https://img.shields.io/badge/Version-4.12.0-informational?style=flat-square) ![AppVersion: 1.30.0](https://img.shields.io/badge/AppVersion-1.30.0-informational?style=flat-square)

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
| image.repository | string | `"docker.io/syncthing/syncthing"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 4.12.0

#### Added

N/A

#### Changed

* update appVersion to 1.30.0

### Version 4.11.7

#### Added

N/A

#### Changed

* update appVersion to 1.29.7

### Version 4.11.6

#### Added

N/A

#### Changed

* update appVersion to 1.29.6

### Version 4.11.5

#### Added

N/A

#### Changed

* update appVersion to 1.29.5

### Version 4.11.4

#### Added

N/A

#### Changed

* update appVersion to 1.29.4

### Version 4.11.3

#### Added

N/A

#### Changed

* update appVersion to 1.29.3

### Version 4.11.2

#### Added

N/A

#### Changed

* update appVersion to 1.29.2

### Version 4.11.1

#### Added

N/A

#### Changed

* update appVersion to 1.29.1

### Version 4.11.0

#### Added

N/A

#### Changed

* update appVersion to 1.29.0

### Version 4.10.1

#### Added

N/A

#### Changed

* update appVersion to 1.28.1

### Version 4.10.0

#### Added

N/A

#### Changed

* update appVersion to 1.28.0

### Version 4.9.12

#### Added

N/A

#### Changed

* update appVersion to 1.27.12

### Version 4.9.11

#### Added

N/A

#### Changed

* update appVersion to 1.27.11

### Version 4.9.10

#### Added

N/A

#### Changed

* update appVersion to 1.27.10

### Version 4.9.9

#### Added

N/A

#### Changed

* update appVersion to 1.27.9

### Version 4.9.8

#### Added

N/A

#### Changed

* update appVersion to 1.27.8

### Version 4.9.7

#### Added

N/A

#### Changed

* update appVersion to 1.27.7

### Version 4.9.6

#### Added

N/A

#### Changed

* update appVersion to 1.27.6

### Version 4.9.5

#### Added

N/A

#### Changed

* update appVersion to 1.27.5

### Version 4.9.4

#### Added

N/A

#### Changed

* update appVersion to 1.27.4

### Version 4.9.3

#### Added

N/A

#### Changed

* update appVersion to 1.27.3

### Version 4.9.2

#### Added

N/A

#### Changed

* update appVersion to 1.27.2

### Version 4.9.1

#### Added

N/A

#### Changed

* update appVersion to 1.27.1

### Version 4.9.0

#### Added

N/A

#### Changed

* update appVersion to 1.27.0

### Version 4.8.1

#### Added

N/A

#### Changed

* update appVersion to 1.26.1

### Version 4.8.0

#### Added

N/A

#### Changed

* update appVersion to 1.26.0

### Version 4.7.0

#### Added

N/A

#### Changed

* update appVersion to 1.25.0

### Version 4.6.0

#### Added

N/A

#### Changed

* update appVersion to 1.24.0

### Version 4.5.7

#### Added

N/A

#### Changed

* update appVersion to 1.23.7

### Version 4.5.6

#### Added

N/A

#### Changed

* update appVersion to 1.23.6

### Version 4.5.5

#### Added

N/A

#### Changed

* update appVersion to 1.23.5

### Version 4.5.4

#### Added

N/A

#### Changed

* update appVersion to 1.23.4

### Version 4.5.3

#### Added

N/A

#### Changed

* update appVersion to 1.23.3

### Version 4.5.2

#### Added

N/A

#### Changed

* update appVersion to 1.23.2

### Version 4.5.1

#### Added

N/A

#### Changed

* update appVersion to 1.23.1

### Version 4.5.0

#### Added

N/A

#### Changed

* update appVersion to 1.23.0

### Version 4.4.2

#### Added

N/A

#### Changed

* update appVersion to 1.22.2

### Version 4.4.1

#### Added

N/A

#### Changed

* update appVersion to 1.22.1

### Version 4.4.0

#### Added

N/A

#### Changed

* update appVersion to 1.22.0

### Version 4.3.0

#### Added

N/A

#### Changed

* update appVersion to 1.21.0

### Version 4.2.4

#### Added

N/A

#### Changed

* update appVersion to 1.20.4

### Version 4.2.3

#### Added

N/A

#### Changed

* update appVersion to 1.20.3

### Version 4.2.2

#### Added

N/A

#### Changed

* update appVersion to 1.20.2

### Version 4.2.1

#### Added

N/A

#### Changed

* update appVersion to 1.20.1

### Version 4.2.0

#### Added

N/A

#### Changed

* update appVersion to 1.20.0

### Version 4.1.2

#### Added

N/A

#### Changed

* update appVersion to 1.19.2

### Version 4.1.1

#### Added

N/A

#### Changed

* update appVersion to 1.19.1

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
