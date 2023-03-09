# uptime-kuma

![Version: 1.4.2](https://img.shields.io/badge/Version-1.4.2-informational?style=flat-square) ![AppVersion: 1.17.1](https://img.shields.io/badge/AppVersion-1.17.1-informational?style=flat-square)

A fancy self-hosted monitoring tool for your websites and applications

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/louislam/uptime-kuma>

## Requirements

Kubernetes: `>=1.16.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |

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
| env.UPTIME_KUMA_DISABLE_FRAME_SAMEORIGIN | int | `0` | Set the custom ssl cert path (string) UPTIME_KUMA_SSL_CERT: -- Set the custom ssl key path (string) UPTIME_KUMA_SSL_KEY: -- Set the frame same-origin policy (int) |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"louislam/uptime-kuma"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

### Version 2.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 1.4.2)

#### Fixed

N/A


## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
