# kanboard

![Version: 6.0.6](https://img.shields.io/badge/Version-6.0.6-informational?style=flat-square) ![AppVersion: v1.2.26](https://img.shields.io/badge/AppVersion-v1.2.26-informational?style=flat-square)

Kanboard is a free and open source Kanban project management software.

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 5.1.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/kanboard/kanboard>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install kanboard johanneskastl-helm-charts/kanboard
```

## Installing the Chart

To install the chart with the release name `kanboard`

```console
helm install kanboard johanneskastl-helm-charts/kanboard
```

## Uninstalling the Chart

To uninstall the `kanboard` deployment

```console
helm uninstall kanboard
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install kanboard \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/kanboard
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install kanboard johanneskastl-helm-charts/kanboard -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below (only deviations from the default settings are specified) | environment variables. See [image docs](https://docs.kanboard.org/en/latest/admin_guide/docker.html#environment-variables) and [application docs](# https://docs.kanboard.org/en/latest/admin_guide/config_file.html) for more details. |
| env.DB_DRIVER | string | `"sqlite"` | Database driver: sqlite, mysql or postgres |
| env.DB_HOSTNAME | string | `nil` | Mysql/Postgres hostname |
| env.DB_NAME | string | `nil` | Mysql/Postgres database name |
| env.DB_PASSWORD | string | `nil` | Mysql/Postgres password |
| env.DB_PORT | string | `nil` | Mysql/Postgres custom port (empty = default port) |
| env.DB_USERNAME | string | `nil` | Mysql/Postgres username |
| env.LOG_DRIVER | string | `"stdout"` | log driver: syslog, stderr, stdout or file |
| env.MAIL_CONFIGURATION | string | `"false"` | Enable/disable email configuration from the user interface |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"kanboard/kanboard"` | image repository |
| image.tag | string | `"v1.2.20"` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql | object | See values.yaml | Enable and configure postgresql database subchart under this key.    For more options see [postgresql chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/postgresql) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 6.0.6

#### Added

N/A

#### Changed

* update appVersion to 1.2.26

#### Fixed

N/A

### Version 6.0.5

#### Added

N/A

#### Changed

* update appVersion to 1.2.25

#### Fixed

N/A

### Version 6.0.4

#### Added

N/A

#### Changed

* update appVersion to 1.2.24

#### Fixed

N/A

### Version 6.0.3

#### Added

N/A

#### Changed

* update appVersion to 1.2.23

#### Fixed

N/A

### Version 6.0.2

#### Added

N/A

#### Changed

* update appVersion to 1.2.22

#### Fixed

N/A

### Version 6.0.1

#### Added

N/A

#### Changed

* update appVersion to 1.2.21

#### Fixed

N/A

### Version 6.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 5.1.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
