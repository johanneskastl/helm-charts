# 389ds

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![AppVersion: 2.2](https://img.shields.io/badge/AppVersion-2.2-informational?style=flat-square)

389ds LDAP server

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://github.com/389ds/389-ds-base/>

## Requirements

Kubernetes: `>=1.19.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.4 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install 389ds johanneskastl-helm-charts/389ds
```

## Installing the Chart

To install the chart with the release name `389ds`

```console
helm install 389ds johanneskastl-helm-charts/389ds
```

## Uninstalling the Chart

To uninstall the `389ds` deployment

```console
helm uninstall 389ds
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install 389ds \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/389ds
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install 389ds johanneskastl-helm-charts/389ds -f values.yaml
```

## Custom configuration

N/A

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| configmap.letsencrypt-ca.data | object | `{"ca.crt":"-----BEGIN CERTIFICATE-----\nMIIFazCCA1OgAwIBAgIRAIIQz7DSQONZRGPgu2OCiwAwDQYJKoZIhvcNAQELBQAw\nTzELMAkGA1UEBhMCVVMxKTAnBgNVBAoTIEludGVybmV0IFNlY3VyaXR5IFJlc2Vh\ncmNoIEdyb3VwMRUwEwYDVQQDEwxJU1JHIFJvb3QgWDEwHhcNMTUwNjA0MTEwNDM4\nWhcNMzUwNjA0MTEwNDM4WjBPMQswCQYDVQQGEwJVUzEpMCcGA1UEChMgSW50ZXJu\nZXQgU2VjdXJpdHkgUmVzZWFyY2ggR3JvdXAxFTATBgNVBAMTDElTUkcgUm9vdCBY\nMTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAK3oJHP0FDfzm54rVygc\nh77ct984kIxuPOZXoHj3dcKi/vVqbvYATyjb3miGbESTtrFj/RQSa78f0uoxmyF+\n0TM8ukj13Xnfs7j/EvEhmkvBioZxaUpmZmyPfjxwv60pIgbz5MDmgK7iS4+3mX6U\nA5/TR5d8mUgjU+g4rk8Kb4Mu0UlXjIB0ttov0DiNewNwIRt18jA8+o+u3dpjq+sW\nT8KOEUt+zwvo/7V3LvSye0rgTBIlDHCNAymg4VMk7BPZ7hm/ELNKjD+Jo2FR3qyH\nB5T0Y3HsLuJvW5iB4YlcNHlsdu87kGJ55tukmi8mxdAQ4Q7e2RCOFvu396j3x+UC\nB5iPNgiV5+I3lg02dZ77DnKxHZu8A/lJBdiB3QW0KtZB6awBdpUKD9jf1b0SHzUv\nKBds0pjBqAlkd25HN7rOrFleaJ1/ctaJxQZBKT5ZPt0m9STJEadao0xAH0ahmbWn\nOlFuhjuefXKnEgV4We0+UXgVCwOPjdAvBbI+e0ocS3MFEvzG6uBQE3xDk3SzynTn\njh8BCNAw1FtxNrQHusEwMFxIt4I7mKZ9YIqioymCzLq9gwQbooMDQaHWBfEbwrbw\nqHyGO0aoSCqI3Haadr8faqU9GY/rOPNk3sgrDQoo//fb4hVC1CLQJ13hef4Y53CI\nrU7m2Ys6xt0nUW7/vGT1M0NPAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNV\nHRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5tFnme7bl5AFzgAiIyBpY9umbbjANBgkq\nhkiG9w0BAQsFAAOCAgEAVR9YqbyyqFDQDLHYGmkgJykIrGF1XIpu+ILlaS/V9lZL\nubhzEFnTIZd+50xx+7LSYK05qAvqFyFWhfFQDlnrzuBZ6brJFe+GnY+EgPbk6ZGQ\n3BebYhtF8GaV0nxvwuo77x/Py9auJ/GpsMiu/X1+mvoiBOv/2X/qkSsisRcOj/KK\nNFtY2PwByVS5uCbMiogziUwthDyC3+6WVwW6LLv3xLfHTjuCvjHIInNzktHCgKQ5\nORAzI4JMPJ+GslWYHb4phowim57iaztXOoJwTdwJx4nLCgdNbOhdjsnvzqvHu7Ur\nTkXWStAmzOVyyghqpZXjFaH3pO3JLF+l+/+sKAIuvtd7u+Nxe5AW0wdeRlN8NwdC\njNPElpzVmbUq4JUagEiuTDkHzsxHpFKVK7q4+63SM1N95R1NbdWhscdCb+ZAJzVc\noyi3B43njTOQ5yOf+1CceWxG1bQVs5ZufpsMljq4Ui0/1lvh+wjChP4kqKOJ2qxq\n4RgqsahDYVvTH9w7jXbyLeiNdd8XM2w9U/t7y0Ff/9yi0GE44Za4rF2LN9d11TPA\nmRGunUHBcnWEvgJBQl9nJEiU0Zsnvgc/ubhPgXRR4Xq37Z0j4r7g1SgEEzwxA57d\nemyPxgcYxn/eR44/KJ4EBs+lVDR3veyJm+kXQ99b21/+jh5Xos1AnX5iItreGCc=\n-----END CERTIFICATE-----\n"}` | configMap data content. Helm template enabled. |
| configmap.letsencrypt-ca.enabled | bool | `true` |  |
| env | object | `{}` |  |
| envFrom[0].secretRef.name | string | `"389ds-environment"` |  |
| image.pullPolicy | string | `"IfNotPresent"` | image pull policy |
| image.repository | string | `"389ds/dirsrv"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| persistence.389ds-ca.enabled | bool | `true` |  |
| persistence.389ds-ca.mountPath | string | `"/data/tls/ca/"` | Where to mount the volume in the main container. |
| persistence.389ds-ca.name | string | `"389ds-letsencrypt-ca"` |  |
| persistence.389ds-ca.readOnly | bool | `true` | Specify if the volume should be mounted read-only. |
| persistence.389ds-ca.type | string | `"configMap"` | Sets the persistence type |
| persistence.389ds-certs.enabled | bool | `true` |  |
| persistence.389ds-certs.items[0].key | string | `"tls.key"` |  |
| persistence.389ds-certs.items[0].path | string | `"server.key"` |  |
| persistence.389ds-certs.items[1].key | string | `"tls.crt"` |  |
| persistence.389ds-certs.items[1].path | string | `"server.crt"` |  |
| persistence.389ds-certs.mountPath | string | `"/data/tls/"` | Where to mount the volume in the main container. |
| persistence.389ds-certs.name | string | `nil` |  |
| persistence.389ds-certs.readOnly | bool | `true` | Specify if the volume should be mounted read-only. |
| persistence.389ds-certs.type | string | `"secret"` | Sets the persistence type |
| persistence.data.accessMode | string | `"ReadWriteOnce"` | AccessMode for the persistent volume. |
| persistence.data.enabled | bool | `true` |  |
| persistence.data.mountPath | string | `"/data/"` | Where to mount the volume in the main container. |
| persistence.data.retain | bool | `true` | Set to true to retain the PVC upon `helm uninstall` |
| persistence.data.size | string | `"1Gi"` | The amount of storage that is requested for the persistent volume. |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.exec.command[0] | string | `"/usr/lib/dirsrv/dscontainer"` |  |
| probes.liveness.spec.exec.command[1] | string | `"-H"` |  |
| probes.liveness.spec.failureThreshold | int | `3` |  |
| probes.liveness.spec.initialDelaySeconds | int | `0` |  |
| probes.liveness.spec.periodSeconds | int | `15` |  |
| probes.liveness.spec.timeoutSeconds | int | `1` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.exec.command[0] | string | `"/usr/lib/dirsrv/dscontainer"` |  |
| probes.readiness.spec.exec.command[1] | string | `"-H"` |  |
| probes.readiness.spec.failureThreshold | int | `3` |  |
| probes.readiness.spec.initialDelaySeconds | int | `0` |  |
| probes.readiness.spec.periodSeconds | int | `15` |  |
| probes.readiness.spec.timeoutSeconds | int | `1` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.exec.command[0] | string | `"/usr/lib/dirsrv/dscontainer"` |  |
| probes.startup.spec.exec.command[1] | string | `"-H"` |  |
| probes.startup.spec.failureThreshold | int | `3` |  |
| probes.startup.spec.initialDelaySeconds | int | `30` |  |
| probes.startup.spec.periodSeconds | int | `15` |  |
| probes.startup.spec.timeoutSeconds | int | `1` |  |
| service.main.annotations | object | `{}` |  |
| service.main.enabled | bool | `true` |  |
| service.main.namePrefix | string | `"service"` |  |
| service.main.ports.http.enabled | bool | `false` |  |
| service.main.ports.ldap-tcp.enabled | bool | `true` |  |
| service.main.ports.ldap-tcp.port | int | `389` |  |
| service.main.ports.ldap-tcp.protocol | string | `"TCP"` |  |
| service.main.ports.ldap-tcp.targetPort | int | `3389` |  |
| service.main.ports.ldap-udp.enabled | bool | `false` |  |
| service.main.ports.ldap-udp.port | int | `389` |  |
| service.main.ports.ldap-udp.protocol | string | `"UDP"` |  |
| service.main.ports.ldap-udp.targetPort | int | `3389` |  |
| service.main.ports.ldaps-tcp.enabled | bool | `true` |  |
| service.main.ports.ldaps-tcp.port | int | `636` |  |
| service.main.ports.ldaps-tcp.protocol | string | `"TCP"` |  |
| service.main.ports.ldaps-tcp.targetPort | int | `3636` |  |
| service.main.ports.ldaps-udp.enabled | bool | `false` |  |
| service.main.ports.ldaps-udp.port | int | `636` |  |
| service.main.ports.ldaps-udp.protocol | string | `"UDP"` |  |
| service.main.ports.ldaps-udp.targetPort | int | `3636` |  |
| service.main.type | string | `"LoadBalancer"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 0.0.1

#### Added

N/A

#### Changed

* first version of the chart, with appVersion 2.2

#### Fixed

N/A

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
