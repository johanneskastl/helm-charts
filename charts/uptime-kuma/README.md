# uptime-kuma

![Version: 2.6.14](https://img.shields.io/badge/Version-2.6.14-informational?style=flat-square) ![AppVersion: 1.23.14](https://img.shields.io/badge/AppVersion-1.23.14-informational?style=flat-square)

A fancy self-hosted monitoring tool for your websites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/louislam/uptime-kuma>

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
helm install uptime-kuma johanneskastl-helm-charts/uptime-kuma
```

## Installing the Chart

To install the chart with the release name `uptime-kuma`

```console
helm install uptime-kuma johanneskastl-helm-charts/uptime-kuma
```

## Uninstalling the Chart

To uninstall the `uptime-kuma` deployment

```console
helm uninstall uptime-kuma
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install uptime-kuma \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/uptime-kuma
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install uptime-kuma johanneskastl-helm-charts/uptime-kuma -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.TZ | string | `"UTC"` | Set the container timezone |
| env.UPTIME_KUMA_DISABLE_FRAME_SAMEORIGIN | int | `0` | Set the frame same-origin policy (int) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"louislam/uptime-kuma"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 2.6.14

#### Added

N/A

#### Changed

* update appVersion to 1.23.14

### Version 2.6.13

#### Added

N/A

#### Changed

* update appVersion to 1.23.13

### Version 2.6.12

#### Added

N/A

#### Changed

* update appVersion to 1.23.12

#### Fixed

N/A

### Version 2.6.11

#### Added

N/A

#### Changed

* update appVersion to 1.23.11

#### Fixed

N/A

### Version 2.6.10

#### Added

N/A

#### Changed

* update appVersion to 1.23.10

#### Fixed

N/A

### Version 2.6.9

#### Added

N/A

#### Changed

* update appVersion to 1.23.9

#### Fixed

N/A

### Version 2.6.8

#### Added

N/A

#### Changed

* update appVersion to 1.23.8

#### Fixed

N/A

### Version 2.6.7

#### Added

N/A

#### Changed

* update appVersion to 1.23.7

#### Fixed

N/A

### Version 2.6.6

#### Added

N/A

#### Changed

* update appVersion to 1.23.6

#### Fixed

N/A

### Version 2.6.5

#### Added

N/A

#### Changed

* update appVersion to 1.23.5

#### Fixed

N/A

### Version 2.6.4

#### Added

N/A

#### Changed

* update appVersion to 1.23.4

#### Fixed

N/A

### Version 2.6.3

#### Added

N/A

#### Changed

* update appVersion to 1.23.3

#### Fixed

N/A

### Version 2.6.2

#### Added

N/A

#### Changed

* update appVersion to 1.23.2

#### Fixed

N/A

### Version 2.6.1

#### Added

N/A

#### Changed

* update appVersion to 1.23.1

#### Fixed

N/A

### Version 2.6.0

#### Added

N/A

#### Changed

* update appVersion to 1.23.0

#### Fixed

N/A

### Version 2.5.1

#### Added

N/A

#### Changed

* update appVersion to 1.22.1

#### Fixed

N/A

### Version 2.5.0

#### Added

N/A

#### Changed

* update appVersion to 1.22.0

#### Fixed

N/A

### Version 2.4.4

#### Added

N/A

#### Changed

* update appVersion to 1.21.3

#### Fixed

N/A

### Version 2.4.3

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 2.4.2

#### Added

N/A

#### Changed

* update appVersion to 1.21.2

#### Fixed

N/A

### Version 2.4.1

#### Added

N/A

#### Changed

* update appVersion to 1.21.1

#### Fixed

N/A

### Version 2.4.0

#### Added

N/A

#### Changed

* update appVersion to 1.21.0

#### Fixed

N/A

### Version 2.3.2

#### Added

N/A

#### Changed

* update appVersion to 1.20.2

#### Fixed

N/A

### Version 2.3.1

#### Added

N/A

#### Changed

* update appVersion to 1.20.1

#### Fixed

N/A

### Version 2.3.0

#### Added

N/A

#### Changed

* update appVersion to 1.20.0

#### Fixed

N/A

### Version 2.2.6

#### Added

N/A

#### Changed

* update appVersion to 1.19.6

#### Fixed

N/A

### Version 2.2.5

#### Added

N/A

#### Changed

* update appVersion to 1.19.5

#### Fixed

N/A

### Version 2.2.4

#### Added

N/A

#### Changed

* update appVersion to 1.19.4

#### Fixed

N/A

### Version 2.2.3

#### Added

N/A

#### Changed

* update appVersion to 1.19.3

#### Fixed

N/A

### Version 2.2.2

#### Added

N/A

#### Changed

* update appVersion to 1.19.2

#### Fixed

N/A

### Version 2.2.1

#### Added

N/A

#### Changed

* update appVersion to 1.19.1

#### Fixed

N/A

### Version 2.2.0

#### Added

N/A

#### Changed

* update appVersion to 1.19.0

#### Fixed

N/A

### Version 2.1.5

#### Added

N/A

#### Changed

* update appVersion to 1.18.5

#### Fixed

N/A

### Version 2.1.4

#### Added

N/A

#### Changed

* update appVersion to 1.18.4

#### Fixed

N/A

### Version 2.1.3

#### Added

N/A

#### Changed

* update appVersion to 1.18.3

#### Fixed

N/A

### Version 2.1.2

#### Added

N/A

#### Changed

* update appVersion to 1.18.2

#### Fixed

N/A

### Version 2.1.1

#### Added

N/A

#### Changed

* update appVersion to 1.18.1

#### Fixed

N/A

### Version 2.1.0

#### Added

N/A

#### Changed

* update appVersion to 1.18.0

#### Fixed

N/A

### Version 2.0.1

#### Added

N/A

#### Changed

* README.md cleanup

#### Fixed

N/A

### Version 2.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 1.4.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
