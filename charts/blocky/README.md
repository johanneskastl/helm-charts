# blocky

![Version: 11.1.1](https://img.shields.io/badge/Version-11.1.1-informational?style=flat-square) ![AppVersion: v0.21](https://img.shields.io/badge/AppVersion-v0.21-informational?style=flat-square)

DNS proxy as ad-blocker for local network

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/0xERR0R/blocky>

## Requirements

Kubernetes: `>=1.19.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | redis | 16.13.1 |
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install blocky johanneskastl-helm-charts/blocky
```

## Installing the Chart

To install the chart with the release name `blocky`

```console
helm install blocky johanneskastl-helm-charts/blocky
```

## Uninstalling the Chart

To uninstall the `blocky` deployment

```console
helm uninstall blocky
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install blocky \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/blocky
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install blocky johanneskastl-helm-charts/blocky -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| config | string | see URL to default config | Full list of options https://github.com/0xERR0R/blocky/blob/v0.18/docs/config.yml |
| controller.replicas | int | `1` | (int) Number of pods to load balance between |
| controller.strategy | string | `"RollingUpdate"` | Set the controller upgrade strategy |
| env | object | See below | environment variables. See [image docs](https://0xerr0r.github.io/blocky/installation/#run-with-docker) for more details. |
| env.TZ | string | `"UTC"` | Set the container timezone |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"ghcr.io/0xerr0r/blocky"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| metrics.enabled | bool | See values.yaml | Enable and configure a Prometheus serviceMonitor for the chart under this key. |
| metrics.prometheusRule | object | See values.yaml | Enable and configure Prometheus Rules for the chart under this key. |
| metrics.prometheusRule.rules | list | See prometheusrules.yaml | Configure additionial rules for the chart under this key. |
| metrics.serviceMonitor.interval | string | `"30s"` | Interval at which Prometheus should scrape metrics |
| metrics.serviceMonitor.jobLabel | string | `""` | The Kubernetes `Endpoints` label to use as the Prometheus job name |
| metrics.serviceMonitor.labels | object | `{}` | Additional labels for the Kubernetes `ServiceMonitor` object |
| metrics.serviceMonitor.podTargetLabels | list | `[]` | PodTargetLabels transfers labels on the Kubernetes `Pod`` onto the created metrics. |
| metrics.serviceMonitor.scrapeTimeout | string | `"10s"` | Timeout after which the scrape is ended |
| metrics.serviceMonitor.targetLabels | list | `[]` | TargetLabels transfers labels from the Kubernetes `Service`` onto the created metrics. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| redis | object | See values.yaml | Enable and configure redis subchart under this key. Useful if you're running more than one replica of blocky dns. For more options see [redis chart documentation](https://github.com/bitnami/charts/tree/master/bitnami/redis) |
| service | object | See values.yaml | Configures service settings for the chart. |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 11.1.1

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 11.1.0

#### Added

N/A

#### Changed

* update appVersion to v0.21

#### Fixed

N/A

### Version 11.0.4

#### Added

N/A

#### Changed

* README.md: cleanup

#### Fixed

N/A

### Version 11.0.3

#### Added

N/A

#### Changed

* README.md: remove another k8s-at-home

#### Fixed

N/A

### Version 11.0.2

#### Added

N/A

#### Changed

* README.md: remove leftover references to k8s-at-home in URLs
* README.md: cleanup

#### Fixed

N/A

### Version 11.0.1

#### Added

N/A

#### Changed

* update appVersion to 0.20

#### Fixed

N/A

### Version 11.0.0

#### Added

N/A

#### Changed

* Forked the chart from k8s-at-home (at version 10.5.2)

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
