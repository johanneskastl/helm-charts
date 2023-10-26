# hedgedoc

![Version: 2.1.9](https://img.shields.io/badge/Version-2.1.9-informational?style=flat-square) ![AppVersion: 1.9.9-ls105](https://img.shields.io/badge/AppVersion-1.9.9--ls105-informational?style=flat-square)

HedgeDoc lets you create real-time collaborative markdown notes.

This chart was forked from Nicholas Wilde's [helm-charts](https://github.com/nicholaswilde/helm-charts) repository, after it seemed to be abandoned.

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/hedgedoc/hedgedoc>
* <https://hub.docker.com/r/linuxserver/hedgedoc>

## Requirements

Kubernetes: `>=1.19.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |
| https://nicholaswilde.github.io/helm-charts/ | mariadb | ~1.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install hedgedoc johanneskastl-helm-charts/hedgedoc
```

## Installing the Chart

To install the chart with the release name `hedgedoc`

```console
helm install hedgedoc johanneskastl-helm-charts/hedgedoc
```

## Uninstalling the Chart

To uninstall the `hedgedoc` deployment

```console
helm uninstall hedgedoc
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install hedgedoc \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/hedgedoc
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install hedgedoc johanneskastl-helm-charts/hedgedoc -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.strategy | string | `"RollingUpdate"` |  |
| env | object | `{"CMD_ALLOW_ORIGIN":null,"CMD_DOMAIN":null}` |  https://github.com/linuxserver/docker-hedgedoc#parameters |
| image | object | `{"pullPolicy":"IfNotPresent","repository":"ghcr.io/linuxserver/hedgedoc","tag":""}` |  IMPORTANT NOTE This chart inherits from the common library chart. You can check the default values/options here: https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml |
| ingress.main.enabled | bool | `false` |  |
| mariadb | object | `{"enabled":false,"env":{"MYSQL_DATABASE":"hedgedoc","MYSQL_USER":"hedgedoc"},"fullnameOverride":"template-mariadb","secret":{"MYSQL_PASSWORD":"hedgedoc-pass","MYSQL_ROOT_PASSWORD":"hedgedoc-pass"}}` |  https://github.com/nicholaswilde/helm-charts/blob/main/charts/mariadb/values.yaml |
| persistence.config.emptyDir | bool | `false` |  |
| persistence.config.enabled | bool | `false` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| probes.liveness.spec.failureThreshold | int | `5` |  |
| probes.liveness.spec.initialDelaySeconds | int | `30` |  |
| probes.liveness.spec.timeoutSeconds | int | `10` |  |
| probes.readiness.spec.failureThreshold | int | `5` |  |
| probes.readiness.spec.initialDelaySeconds | int | `30` |  |
| probes.readiness.spec.timeoutSeconds | int | `10` |  |
| probes.startup.spec.failureThreshold | int | `5` |  |
| probes.startup.spec.initialDelaySeconds | int | `30` |  |
| probes.startup.spec.timeoutSeconds | int | `10` |  |
| secret | object | `{}` |  |
| service.main.enabled | bool | `true` |  |
| service.main.ports.http.enabled | bool | `true` |  |
| service.main.ports.http.port | int | `3000` |  |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### 2.1.9

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls105

#### Fixed

N/A

### 2.1.8

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls104

#### Fixed

N/A

### 2.1.7

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls103

#### Fixed

N/A

### 2.1.6

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls102

#### Fixed

N/A

### 2.1.5

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls101

#### Fixed

N/A

### 2.1.4

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls100

#### Fixed

N/A

### 2.1.3

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls99

#### Fixed

N/A

### 2.1.2

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls98

#### Fixed

N/A

### 2.1.1

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls97

#### Fixed

N/A

### 2.1.0

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls96

#### Fixed

N/A

### 2.0.11

#### Added

N/A

#### Changed

- update appVersion to 1.9.8-ls95

#### Fixed

N/A

### 2.0.10

#### Added

N/A

#### Changed

- update appVersion to 1.9.8

#### Fixed

N/A

### 2.0.9

#### Added

N/A

#### Changed

- set required Kubernetes version (to 1.19, so pretty old...)

#### Fixed

N/A

### 2.0.8

#### Added

N/A

#### Changed

- update appVersion to 1.9.7

#### Fixed

N/A

### 2.0.7

#### Added

N/A

#### Changed

- update appVersion to 1.9.6

#### Fixed

N/A

### 2.0.6

#### Added

N/A

#### Changed

- update appVersion to 1.9.5

#### Fixed

N/A

### 2.0.5

#### Added

N/A

#### Changed

- update appVersion to 1.9.4

#### Fixed

N/A

### 2.0.4

#### Added

N/A

#### Changed

- update appVersion to 1.9.3

#### Fixed

N/A

### 2.0.3

#### Added

N/A

#### Changed

- update appVersion to 1.9.2

#### Fixed

N/A

### 2.0.2

#### Added

N/A

#### Changed

- update appVersion to 1.9.1

#### Fixed

N/A

### 2.0.1

#### Added

N/A

#### Changed

- whitespace fixes in values.schema.json

#### Fixed

N/A

### 2.0.0

#### Added

N/A

#### Changed

- Forked the chart from Nicholas Wilde at version 1.1.0

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
