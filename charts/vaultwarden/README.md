# vaultwarden

![Version: 6.0.1](https://img.shields.io/badge/Version-6.0.1-informational?style=flat-square) ![AppVersion: 1.25.2](https://img.shields.io/badge/AppVersion-1.25.2-informational?style=flat-square)

Vaultwarden is a Bitwarden compatible server in Rust

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 5.3.2.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/dani-garcia/vaultwarden>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 11.0.14 |
| https://charts.bitnami.com/bitnami | postgresql | 11.6.12 |
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install vaultwarden johanneskastl-helm-charts/vaultwarden
```

## Installing the Chart

To install the chart with the release name `vaultwarden`

```console
helm install vaultwarden johanneskastl-helm-charts/vaultwarden
```

## Uninstalling the Chart

To uninstall the `vaultwarden` deployment

```console
helm uninstall vaultwarden
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install vaultwarden \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/vaultwarden
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install vaultwarden johanneskastl-helm-charts/vaultwarden -f values.yaml
```

## Custom configuration

The Vaultwarden chart requires the `/config` folder to exist. In order to provide this, some type of storage needs to be implemented.
For testing purposes, the following config snippet will work:

````yaml
persistence:
  config:
    enabled: true
    type: emptyDir
````

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://github.com/dani-garcia/vaultwarden/blob/main/.env.template) for more details. |
| env.DATA_FOLDER | string | `"config"` | Config dir |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"vaultwarden/server"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mariadb.enabled | bool | `false` |  |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| postgresql.enabled | bool | `false` |  |
| service | object | See values.yaml | Configures service settings for the chart. Normally this does not need to be modified. |
| strategy.type | string | `"Recreate"` |  |

## Changelog

### Version 6.0.1

#### Added

N/A

#### Changed

* README.md: added support link

#### Fixed

N/A

### Version 6.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 5.3.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
