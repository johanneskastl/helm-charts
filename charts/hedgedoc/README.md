# hedgedoc

![Version: 2.2.47](https://img.shields.io/badge/Version-2.2.47-informational?style=flat-square) ![AppVersion: 1.10.5-ls178](https://img.shields.io/badge/AppVersion-1.10.5--ls178-informational?style=flat-square)

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
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |
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
| env.CMD_ALLOW_ORIGIN | string | `nil` |  |
| env.CMD_DOMAIN | string | `nil` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/linuxserver/hedgedoc"` |  |
| image.tag | string | `""` |  |
| ingress.main.enabled | bool | `false` |  |
| mariadb.enabled | bool | `false` |  |
| mariadb.env.MYSQL_DATABASE | string | `"hedgedoc"` |  |
| mariadb.env.MYSQL_USER | string | `"hedgedoc"` |  |
| mariadb.fullnameOverride | string | `"template-mariadb"` |  |
| mariadb.secret.MYSQL_PASSWORD | string | `"hedgedoc-pass"` |  |
| mariadb.secret.MYSQL_ROOT_PASSWORD | string | `"hedgedoc-pass"` |  |
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

### Version 2.2.46

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.5-ls178

#### Fixed

N/A

### Version 2.2.45

#### Added

N/A

#### Changed

* really update hedgedoc to 1.10.5-ls177

#### Fixed

N/A

### Version 2.2.44

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.5-ls177

#### Fixed

N/A

### Version 2.2.43

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.4-ls176

#### Fixed

N/A

### Version 2.2.42

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.3-ls175

#### Fixed

N/A

### Version 2.2.41

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.3-ls174

#### Fixed

N/A

### 2.2.40

#### Added

N/A

#### Changed

* update hedgedoc to 1.10.3-ls173

### 2.2.39

#### Added

N/A

#### Changed

* renovate comment needs to be before appVersion

### 2.2.38

#### Added

* add https prefix in renovate comment

### 2.2.37

#### Added

* really add a comment in Chart.yaml to allow updates via Renovatebot

### 2.2.36

#### Added

* comment in Chart.yaml to allow updates via Renovatebot

#### Changed

N/A

### 2.2.35

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls172

### 2.2.34

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls171

### 2.2.33

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls170

### 2.2.32

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls169

### 2.2.31

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls168

### 2.2.30

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls167

### 2.2.29

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls166

### 2.2.28

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls165

### 2.2.27

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls164

### 2.2.26

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls163

### 2.2.25

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls162

### 2.2.24

#### Added

N/A

#### Changed

- update appVersion to 1.10.3-ls161

### 2.2.23

#### Added

N/A

#### Changed

- update appVersion to 1.10.2-ls161

### 2.2.22

#### Added

N/A

#### Changed

- update appVersion to 1.10.2-ls160

### 2.2.21

#### Added

N/A

#### Changed

- update appVersion to 1.10.2-ls159

### 2.2.20

#### Added

N/A

#### Changed

- update appVersion to 1.10.2-ls158

### 2.2.19

#### Added

N/A

#### Changed

- update appVersion to 1.10.2-ls157

### 2.2.17

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls156

### 2.2.16

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls155

### 2.2.15

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls154

### 2.2.14

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls153

### 2.2.13

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls152

### 2.2.12

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls151

### 2.2.11

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls150

### 2.2.10

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls149

### 2.2.9

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls148

### 2.2.8

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls147

### 2.2.7

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls146

### 2.2.6

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls145

### 2.2.5

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls144

### 2.2.4

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls143

### 2.2.3

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls142

### 2.2.2

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls141

### 2.2.1

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls140

### 2.2.0

#### Added

N/A

#### Changed

- update appVersion to 1.10.0-ls138

### 2.1.42

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls139

### 2.1.41

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls137

### 2.1.40

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls136

### 2.1.39

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls135

### 2.1.38

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls134

### 2.1.37

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls133

### 2.1.36

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls132

### 2.1.35

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls131

### 2.1.34

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls130

### 2.1.33

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls129

### 2.1.32

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls128
- update dependency common to 5.0.5

### 2.1.31

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls127

### 2.1.30

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls126

### 2.1.29

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls125

### 2.1.28

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls124

### 2.1.27

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls123

### 2.1.26

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls122

### 2.1.25

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls121

### 2.1.24

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls120

### 2.1.23

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls119

### 2.1.22

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls118

### 2.1.21

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls117

### 2.1.20

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls116

### 2.1.19

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls115

### 2.1.18

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls114

### 2.1.17

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls113

### 2.1.16

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls112

### 2.1.15

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls111

### 2.1.14

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls110

#### Fixed

N/A

### 2.1.13

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls109

#### Fixed

N/A

### 2.1.12

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls108

#### Fixed

N/A

### 2.1.11

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls107

#### Fixed

N/A

### 2.1.10

#### Added

N/A

#### Changed

- update appVersion to 1.9.9-ls106

#### Fixed

N/A

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
