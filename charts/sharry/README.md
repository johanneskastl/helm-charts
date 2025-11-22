# sharry

![Version: 6.9.2](https://img.shields.io/badge/Version-6.9.2-informational?style=flat-square) ![AppVersion: v1.15.0](https://img.shields.io/badge/AppVersion-v1.15.0-informational?style=flat-square)

Sharry allows to share files with others in a simple way. It is a self-hosted web application. The basic concept is to upload files and get a url back that can then be shared.

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 5.4.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/eikek/sharry>
* <https://hub.docker.com/r/eikek0/sharry>

## Requirements

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install sharry johanneskastl-helm-charts/sharry
```

## Installing the Chart

To install the chart with the release name `sharry`

```console
helm install sharry johanneskastl-helm-charts/sharry
```

## Uninstalling the Chart

To uninstall the `sharry` deployment

```console
helm uninstall sharry
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install sharry \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/sharry
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install sharry johanneskastl-helm-charts/sharry -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| args | list | `["/opt/sharry.conf"]` | Override the command line arguments for the default container |
| config | string | See values.yaml | Sharry configuration. Supports Helm templates. See [application docs](https://eikek.github.io/sharry/doc/configure) for more details. |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"eikek0/sharry"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 6.9.2

#### Added

N/A

#### Changed

* add https prefix in renovate comment

### Version 6.9.1

#### Added

* add comment in Chart.yaml to allow updates via Renovatebot

#### Changed

N/A

### Version 6.9.0

#### Added

N/A

#### Changed

* update appVersion to 1.15.0

### Version 6.8.0

#### Added

N/A

#### Changed

* enable admin credentials by default

### Version 6.7.0

#### Added

N/A

#### Changed

* fix appVersion to have a leading v

### Version 6.6.0

#### Added

N/A

#### Changed

* update appVersion to 1.14.0

### Version 6.5.2

#### Added

N/A

#### Changed

* update appVersion to 1.13.2

### Version 6.5.1

#### Added

N/A

#### Changed

* update appVersion to 1.13.1

### Version 6.5.0

#### Added

N/A

#### Changed

* update appVersion to 1.13.0

### Version 6.4.1

#### Added

N/A

#### Changed

* update appVersion to 1.12.1

### Version 6.4.0

#### Added

N/A

#### Changed

* update appVersion to 1.12.0

### Version 6.3.0

#### Added

N/A

#### Changed

* update appVersion to 1.11.0

### Version 6.2.0

#### Added

N/A

#### Changed

* update appVersion to 1.10.0

### Version 6.1.0

#### Added

N/A

#### Changed

* update appVersion to 1.9.0

### Version 6.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 5.4.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
