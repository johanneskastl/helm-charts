# heimdall

![Version: 9.4.1](https://img.shields.io/badge/Version-9.4.1-informational?style=flat-square) ![AppVersion: 2.7.6](https://img.shields.io/badge/AppVersion-2.7.6-informational?style=flat-square)

An Application dashboard and launcher

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 8.4.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://hub.docker.com/r/linuxserver/heimdall/>
* <https://github.com/linuxserver/heimdall>

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
helm install heimdall johanneskastl-helm-charts/heimdall
```

## Installing the Chart

To install the chart with the release name `heimdall`

```console
helm install heimdall johanneskastl-helm-charts/heimdall
```

## Uninstalling the Chart

To uninstall the `heimdall` deployment

```console
helm uninstall heimdall
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install heimdall \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/heimdall
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install heimdall johanneskastl-helm-charts/heimdall -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See more environment variables in the [heimdall documentation](https://github.com/linuxserver/docker-heimdall#parameters). |
| env.PGID | string | `"1000"` | Set the container group id |
| env.PUID | string | `"1000"` | Set the container user id |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"linuxserver/heimdall"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 9.4.1

#### Added

N/A

#### Changed

* https prefix in renovate comment

### Version 9.4.0

#### Added

N/A

#### Changed

* update heimdall to 2.7.6

#### Fixed

N/A

### Version 9.3.0

#### Added

N/A

#### Changed

* update heimdall to 2.6.3

#### Fixed

N/A

### Version 9.2.0

#### Added

N/A

#### Changed

* update heimdall to 2.5.8

#### Fixed

N/A

### Version 9.1.0

#### Added

N/A

#### Changed

* update heimdall to 2.4.15

#### Fixed

N/A

### Version 9.0.3

#### Added

N/A

#### Changed

* remove image tag value and use appVersion instead

#### Fixed

N/A

### Version 9.0.2

#### Added

N/A

#### Changed

* update the common chart to 5.0.5

#### Fixed

N/A

### Version 9.0.1

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 9.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 8.4.2).

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
