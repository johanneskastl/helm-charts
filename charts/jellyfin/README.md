# jellyfin

![Version: 10.0.2](https://img.shields.io/badge/Version-10.0.2-informational?style=flat-square) ![AppVersion: 10.8.1](https://img.shields.io/badge/AppVersion-10.8.1-informational?style=flat-square)

Jellyfin is a Free Software Media System

Forked from the chart in the [k8s-at-home repository](https://github.com/k8s-at-home/charts) at version 9.5.3.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://hub.docker.com/r/jellyfin/jellyfin>
* <https://github.com/jellyfin/jellyfin>

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
helm install jellyfin johanneskastl-helm-charts/jellyfin
```

## Installing the Chart

To install the chart with the release name `jellyfin`

```console
helm install jellyfin johanneskastl-helm-charts/jellyfin
```

## Uninstalling the Chart

To uninstall the `jellyfin` deployment

```console
helm uninstall jellyfin
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install jellyfin \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/jellyfin
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install jellyfin johanneskastl-helm-charts/jellyfin -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables. See [image docs](https://jellyfin.org/docs/general/administration/configuration.html) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"jellyfin/jellyfin"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| podSecurityContext | object | `{}` | Configure the Security Context for the Pod |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 10.0.2

#### Added

N/A

#### Changed

* update common chart to 5.0.5

#### Fixed

N/A

### Version 10.0.1

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 10.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 9.5.3)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
