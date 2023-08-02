# openldap

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 2.6.6](https://img.shields.io/badge/AppVersion-2.6.6-informational?style=flat-square)

Helm chart for OpenLDAP based on the Bitnami image

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://git.openldap.org/openldap/openldap>
* <https://github.com/bitnami/containers/tree/main/bitnami/openldap>

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
helm install openldap johanneskastl-helm-charts/openldap
```

## Installing the Chart

To install the chart with the release name `openldap`

```console
helm install openldap johanneskastl-helm-charts/openldap
```

## Uninstalling the Chart

To uninstall the `openldap` deployment

```console
helm uninstall openldap
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install openldap \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/openldap
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install openldap johanneskastl-helm-charts/openldap -f values.yaml
```

## Custom configuration

Depending on your usecase, you need to set the following environment variables for the container.

```
LDAP_ADMIN_USERNAME: 'admin'
LDAP_ADMIN_PASSWORD: 'topsecret'
LDAP_CONFIG_ADMIN_USERNAME: 'admin'
LDAP_CONFIG_ADMIN_PASSWORD: 'topsecret'
LDAP_CONFIG_ADMIN_ENABLED: 'yes'
LDAP_ROOT: 'dc=example,dc=org'
```

Adjust these values and add them to a Kubernetes secret like so:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: openldap-secret
  namespace: openldap
stringData:
  LDAP_ADMIN_USERNAME: 'admin'
  LDAP_ADMIN_PASSWORD: 'topsecret'
  LDAP_CONFIG_ADMIN_USERNAME: 'admin'
  LDAP_CONFIG_ADMIN_PASSWORD: 'topsecret'
  LDAP_CONFIG_ADMIN_ENABLED: 'yes'
  LDAP_ROOT: 'dc=example,dc=org'
```

Then reference this secret in the `envFrom` section of your `values.yaml`:

```yaml
envFrom:
- secretRef:
    name: openldap-secret
```

For debugging you might want to also set these variables:

```
LDAP_LOGLEVEL: '1'
BITNAMI_DEBUG: 'true'
```

By default, this chart wants to mount a TLS secret into the container,
so the LDAP server supports TLS. If you do **not** want to have TLS enabled,
disable this by setting `persistence.certificate.enabled` to false:

```
persistence:
  certificate:
    enabled: false
```

If you want to have custom LDIF files mounted into the container, you can enable this by enabling the persistence setting for `ldifImport` and specifying a secret name:

```
persistence:
  ldifImport:
    enabled: true
    name: my-ldif-secret
```

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| automountServiceAccountToken | bool | `false` |  |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"bitnami/openldap"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| persistence.certificate | object | `{"enabled":true,"mountPath":"/etc/ssl/private/","type":"secret"}` |  and mounted into the pod. |
| persistence.ldifimport | object | `{"enabled":false,"mountPath":"/ldif_import/","type":"secret"}` |  This disables the autogeneration of the default tree, see https://github.com/bitnami/bitnami-docker-openldap/issues/86 and https://github.com/bitnami/bitnami-docker-openldap/issues/83 |
| podSecurityContext.fsGroup | int | `1001` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.initialDelaySeconds | int | `15` |  |
| probes.liveness.spec.periodSeconds | int | `15` |  |
| probes.liveness.spec.tcpSocket.port | int | `1389` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `15` |  |
| probes.readiness.spec.periodSeconds | int | `15` |  |
| probes.readiness.spec.tcpSocket.port | int | `1389` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.failureThreshold | int | `12` |  |
| probes.startup.spec.initialDelaySeconds | int | `0` |  |
| probes.startup.spec.periodSeconds | int | `10` |  |
| probes.startup.spec.tcpSocket.port | int | `1389` |  |
| probes.startup.spec.timeoutSeconds | int | `1` |  |
| securityContext.capabilities.add[0] | string | `"NET_BIND_SERVICE"` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1001` |  |
| service | object | See values.yaml | Configures service settings for the chart. |
| serviceAccount.create | bool | `true` |  |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 2.0.0

#### Added

N/A

#### Changed

* first version of the chart in this repository

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
