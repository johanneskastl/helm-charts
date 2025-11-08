# wallabag

![Version: 8.0.6](https://img.shields.io/badge/Version-8.0.6-informational?style=flat-square) ![AppVersion: 2.4.3](https://img.shields.io/badge/AppVersion-2.4.3-informational?style=flat-square)

A self hostable application for saving web pages, freely.

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 7.1.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/wallabag/docker>
* <https://hub.docker.com/wallabag/wallabag>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 11.0.14 |
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://charts.bitnami.com/bitnami | redis | 23.2.12 |
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install wallabag johanneskastl-helm-charts/wallabag
```

## Installing the Chart

To install the chart with the release name `wallabag`

```console
helm install wallabag johanneskastl-helm-charts/wallabag
```

## Uninstalling the Chart

To uninstall the `wallabag` deployment

```console
helm uninstall wallabag
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install wallabag \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/wallabag
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install wallabag johanneskastl-helm-charts/wallabag -f values.yaml
```

## Custom configuration

Default login is `wallabag:wallabag`.

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/wallabag/docker) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"wallabag/wallabag"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb | object | See values.yaml | Enable and configure mariadb database subchart under this key.    For more options see [mariadb chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/mariadb) |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| redis | object | See values.yaml | Enable and configure redis subchart under this key.    For more options see [redis chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/redis) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 8.0.5

#### Added

N/A

#### Changed

* remove image tag value and use appVersion instead

#### Fixed

N/A

### Version 8.0.4

#### Added

N/A

#### Changed

* update dependency redis to 23.2.12

#### Fixed

N/A

### Version 8.0.3

#### Added

N/A

#### Changed

* update common chart to 5.0.5

#### Fixed

N/A

### Version 8.0.2

#### Added

N/A

#### Changed

* update redis dependency to 23.2.3

#### Fixed

N/A

### Version 8.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 10.5.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
