# apacheds

![Version: 0.0.5](https://img.shields.io/badge/Version-0.0.5-informational?style=flat-square) ![AppVersion: 2.0.0-AM26-startupProbe](https://img.shields.io/badge/AppVersion-2.0.0--AM26--startupProbe-informational?style=flat-square)

ApacheDS is a LDAP server written in Java

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://directory.apache.org/apacheds/>
* <https://github.com/TremoloSecurity/apacheds>

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
helm install apacheds johanneskastl-helm-charts/apacheds
```

## Installing the Chart

To install the chart with the release name `apacheds`

```console
helm install apacheds johanneskastl-helm-charts/apacheds
```

## Uninstalling the Chart

To uninstall the `apacheds` deployment

```console
helm uninstall apacheds
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install apacheds \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/apacheds
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install apacheds johanneskastl-helm-charts/apacheds -f values.yaml
```

## Custom configuration

You need at least one Kubernetes secret for this chart, but there are three in total:

1. A secret containing your configuration (called `apacheds-configuration`)
1. (optional) A secret containing the java keystore containing the certificate
1. (optional) A secret containing a `data.ldif` key with LDIF entries you want to have imported into your LDAP server

The configuration secret should contain
- your admin account password (`APACHEDS_ROOT_PASSWORD`)
- the password for the Java keystore (`APACHEDS_TLS_KS_PWD`)
- the `DN` and `OBJECT_CLASS` for your directory

An example might look like this:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: apacheds-configuration
  namespace: apacheds
type: Opaque
stringData:
  APACHEDS_TLS_KS_PWD: verysecret
  APACHEDS_ROOT_PASSWORD: totallysecret
  DN: dc=example,dc=org
  OBJECT_CLASS: domain
```

The keystore secret might look like this:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: apacheds-keystore
  namespace: apacheds
type: Opaque
data:
  apacheds.jks: <long-base64-encoded-string-goes-here>

```

You can create this via `kubectl` as usual, and reference it in your `values.yaml` file like so:

```yaml
persistence:
  config:
    name: apacheds-keystore
[...]
```

In case you want to automatically import data into your LDAP server, create another secret like the following:

```yaml
---
apiVersion: v1
kind: Secret
metadata:
  name: apacheds-ldif
  namespace: apacheds
type: Opaque
stringData:
  data.ldif: |-
    dn: DC=example,DC=org
    objectClass: domain
    dc: domain

    [...]
```

Add the LDIF information, but make sure the key is called `data.ldif`.

Then enable the ldifimport in the `values.yaml`'s persistence section:

```yaml
persistence:
  [...]
  ldifimport:
    enabled: true
    name: apacheds-ldif
```

Make sure the `name` in the `ldifimport` block matches your Kubernetes secret's name.

The container will import the data from the `data.ldif` file, that is being mounted from the secret, on startup.

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| controller.type | string | `"statefulset"` |  |
| envFrom | list | See values.yaml | Use environment variables from the apacheds-configuration secret |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"docker.io/johanneskastl/apacheds"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.data | object | See below | Persistence for the application data |
| persistence.data.accessMode | string | `"ReadWriteOnce"` | There should only be one pod writing to the volume |
| persistence.data.enabled | bool | `true` | You normally want persistence for the LDAP data. Disable at your own peril... |
| persistence.data.mountPath | string | `"/var/apacheds/"` | ApacheDS writes the data to /var/apacheds/ |
| persistence.data.readOnly | bool | `false` | Setting this to readOnly does not make sense |
| persistence.data.retain | bool | `true` | Do not delete the volume if the helm chart is being uninstalled, to prevent data loss... |
| persistence.ldifimport | object | See below | Set this to enabled if you want to import files from a secret. Then set `persistence.ldifimport.name` to the name of your Kubernetes secret in your values.yaml file. |
| persistence.ldifimport.enabled | bool | `false` | Set this to true if you want to enable the import from a LDIF file |
| persistence.ldifimport.mountPath | string | `"/etc/apacheds-data/"` | The container image expects the LDIF file to import to be in /etc/apacheds-data/data.ldif |
| persistence.ldifimport.type | string | `"secret"` | You should store the LDIF information in a secret |
| persistence.tlskeystore | object | See below | For LDAPS you should have your JAVA keystore stored in Kubernetes in a secret and mounted into the pod. To do that set the `persistence.tlskeystore.name` key to the name of your existing secret in your values.yaml file. |
| persistence.tlskeystore.enabled | bool | `false` | Set this to true to enable parsing the keystore file |
| persistence.tlskeystore.mountPath | string | `"/etc/apacheds/"` | The keystore files needs to end up in /etc/apacheds/apacheds.jks |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.initialDelaySeconds | int | `150` |  |
| probes.liveness.spec.periodSeconds | int | `15` |  |
| probes.liveness.spec.tcpSocket.port | int | `10389` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `150` |  |
| probes.readiness.spec.periodSeconds | int | `15` |  |
| probes.readiness.spec.tcpSocket.port | int | `10389` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.exec.command[0] | string | `"sh"` |  |
| probes.startup.spec.exec.command[1] | string | `"-c"` |  |
| probes.startup.spec.exec.command[2] | string | `"test -f /tmp/apacheds_startup_finished"` |  |
| probes.startup.spec.failureThreshold | int | `30` |  |
| probes.startup.spec.initialDelaySeconds | int | `210` |  |
| probes.startup.spec.periodSeconds | int | `10` |  |
| probes.startup.spec.timeoutSeconds | int | `1` |  |
| resources | object | See below | Set the resource requests / limits for the main container. |
| resources.limits | object | See below | resource limits for the pod |
| resources.limits.cpu | string | `"250m"` | cpu limit |
| resources.limits.memory | string | `"256Mi"` | memory limit |
| resources.requests | object | See below | resource requests for the pod |
| resources.requests.cpu | string | `"125m"` | cpu request |
| resources.requests.memory | string | `"128Mi"` | memory request |
| service | object | See values.yaml | Configures service settings for the chart. |
| serviceAccount.create | bool | `true` |  |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 0.0.5

#### Added

* comment in Chart.yaml to allow updates via Renovatebot

#### Changed

N/A

#### Fixed

N/A

### Version 0.0.4

#### Added

N/A

#### Changed

* refactor startupProbe/readinessProbe/livenessProbe

#### Fixed

N/A

### Version 0.0.3

#### Added

N/A

#### Changed

* disable TLS by default, aka make the keystore secret optional
* change image to johanneskastl/apacheds

#### Fixed

N/A

### Version 0.0.2

#### Added

* add README

#### Changed

N/A

#### Fixed

N/A

### Version 0.0.1

#### Added

* created new chart

#### Changed

N/A

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
