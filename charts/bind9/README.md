# bind9

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![AppVersion: 9.19](https://img.shields.io/badge/AppVersion-9.19-informational?style=flat-square)

A Helm chart for Bind9 using the official ISC docker image

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

## Source Code

* <https://gitlab.isc.org/isc-projects/bind9>

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
helm install bind9 johanneskastl-helm-charts/bind9
```

## Installing the Chart

To install the chart with the release name `bind9`

```console
helm install bind9 johanneskastl-helm-charts/bind9
```

## Uninstalling the Chart

To uninstall the `bind9` deployment

```console
helm uninstall bind9
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install bind9 \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/bind9
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install bind9 johanneskastl-helm-charts/bind9 -f values.yaml
```

## Custom configuration

This chart can be used to install either a validating resolver or an
authoritative nameserver.

This is controlled by setting the `chartMode` variable to either `resolver` or
`authoritative`.

### Setting up bind9 as a resolver

By default, this chart will setup Bind9 as a resolver.

In case you want to forward a zone to your internal nameservers, you can create a secret containing valid named configuration that might look something like this:

```
apiVersion: v1
kind: Secret
metadata:
  name: my-named-configuration-secret
stringData:
  named.conf.local: |
    zone "my.corporate-domain.example.org" {
        type static-stub;
        server-addresses {
                192.168.1.1;
                192.168.1.2;
        };
    };
```

Please pay attention that this can ONLY contain zone settings or similar, no `options` blocks are allowed (as they are already set in the configuration generated by the chart).

You need to provide the name of this secret in the `values.yaml` file like so:

```
[...]
persistence:
  bind9userconfiguration:
    enabled: true
    name: my-named-configuration-secret
[...]
```

After that, install the helm chart like described in the 'Installing the Chart' section.

### Setting up bind as an authoritative nameserver

You can use this chart to set up an authoritative nameserver by setting the `chartMode` value to `authoritative`. This will generate a basic named.conf with recursion disabled. However, you need to create a secret containing the actual nameserver configuration (i.e. zones) and let the chart mount this secret into the pod.

First, create a secret like this:

```
apiVersion: v1
kind: Secret
metadata:
  name: my-named-nameserver-configuration-secret
stringData:
  named.conf.local: |
    zone "example.org" in {
         type master;
         file "/named_config/example.org.zone";
         notify no;
    };
  example.org.zone: |
    $TTL 2h                             ; default TTL
    @ IN SOA dns.example.org.     dnsmaster.example.org. (
                        2022032900      ; serial
                        24h             ; refresh
                        2h              ; retry
                        1000h           ; expire
                        2d )            ; minimum
[...]
```

Please pay attention that this can ONLY contain zone settings or similar, no `options` blocks are allowed (as they are already set in the configuration generated by the chart).

Notice that there are two keys in that secret, one for the `named.conf.local` and one for the zone file (`example.org.zone` in the example). Both of these keys are being mounted as files to `/named_config/`.
The zone file is referenced in the named configuration contained in the `named.conf.local` part. The `named.conf.local` is being loaded by bind automatically due to the configuration that the helm chart sets up.

To use your secret you need to provide the name of this secret in the `values.yaml` file like so:

```
[...]
persistence:
  bind9userconfiguration:
    enabled: true
    name: my-named-nameserver-configuration-secret
[...]
```

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| authoritative.dnssec_validation | bool | `true` |  |
| authoritative.ipv6_enabled | bool | `true` |  |
| authoritative.querylog | bool | `false` |  |
| automountServiceAccountToken | bool | `false` |  |
| chartMode | string | `"resolver"` |  Possible values: 'resolver': set up a resolver 'authoritative': set up an authoritative nameserver |
| command[0] | string | `"/usr/sbin/named"` |  |
| command[1] | string | `"-g"` |  |
| command[2] | string | `"-c"` |  |
| command[3] | string | `"/etc/named/named.conf"` |  |
| command[4] | string | `"-u"` |  |
| command[5] | string | `"bind"` |  |
| global.labels | object | `{}` |  |
| global.selectorLables | object | `{}` |  |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"internetsystemsconsortium/bind9"` | image repository |
| image.tag | string | `nil` | image tag |
| ingress.main | object | See values.yaml | Enable and configure ingress settings for the chart under this key. |
| mount_configuration_from_secret | object | `{"enabled":false,"secretName":"my-secret"}` |  To enhance the basic configuration of this chart, you can create a secret containing one key called 'named.conf.local' containing your bind9 resolver or nameserver configuration ATTENTION: This must not contain an `options` block, only zone settings            or similar are allowed Example: ``` apiVersion: v1 kind: Secret metadata:   name: my-secret stringData:   named.conf.local: |     zone "my.corporate-domain.example.org" {         type static-stub;         server-addresses {                 192.168.1.1;                 192.168.1.2;         };     }; ``` |
| persistence | object | See values.yaml | Configure persistence settings for the chart under this key. |
| podSecurityContext.fsGroup | int | `106` |  |
| probes.liveness.custom | bool | `true` |  |
| probes.liveness.enabled | bool | `true` |  |
| probes.liveness.spec.tcpSocket.port | int | `5053` |  |
| probes.readiness.custom | bool | `true` |  |
| probes.readiness.enabled | bool | `true` |  |
| probes.readiness.spec.tcpSocket.port | int | `5053` |  |
| probes.startup.custom | bool | `true` |  |
| probes.startup.enabled | bool | `true` |  |
| probes.startup.spec.initialDelaySeconds | int | `10` |  |
| probes.startup.spec.tcpSocket.port | int | `5053` |  |
| resolver | object | `{"dnssec_validation":true,"forwarders":["80.241.218.68","159.69.114.157","176.9.93.198"],"ipv6_enabled":true,"querylog":false}` |  and add forwarders and options as you see fit |
| service.dns-tcp.annotations | object | `{}` |  |
| service.dns-tcp.enabled | bool | `true` |  |
| service.dns-tcp.labels | object | `{}` |  |
| service.dns-tcp.nameOverride | string | `"dns-tcp"` |  |
| service.dns-tcp.ports.dns-tcp.enabled | bool | `true` |  |
| service.dns-tcp.ports.dns-tcp.port | int | `53` |  |
| service.dns-tcp.ports.dns-tcp.protocol | string | `"TCP"` |  |
| service.dns-tcp.ports.dns-tcp.targetPort | int | `5053` |  |
| service.dns-tcp.type | string | `"ClusterIP"` |  |
| service.dns-udp.annotations | object | `{}` |  |
| service.dns-udp.enabled | bool | `true` |  |
| service.dns-udp.labels | object | `{}` |  |
| service.dns-udp.ports.dns-udp.enabled | bool | `true` |  |
| service.dns-udp.ports.dns-udp.port | int | `53` |  |
| service.dns-udp.ports.dns-udp.protocol | string | `"UDP"` |  |
| service.dns-udp.ports.dns-udp.targetPort | int | `5053` |  |
| service.dns-udp.type | string | `"ClusterIP"` |  |
| service.main.enabled | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 0.5.0

#### Added

N/A

#### Changed

* update appVersion to 9.19

#### Fixed

N/A

### Version 0.4.2

#### Added

N/A

#### Changed

N/A

#### Fixed

* set image pullPolicy to Always, as the upstream tag is updated in-place

### Version 0.4.1

#### Added

N/A

#### Changed

N/A

#### Fixed

* fix IPv6 syntax in named.conf secrets

### Version 0.4.0

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
