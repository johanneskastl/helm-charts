# tailscale

![Version: 0.18.1](https://img.shields.io/badge/Version-0.18.1-informational?style=flat-square) ![AppVersion: v1.68.1](https://img.shields.io/badge/AppVersion-v1.68.1-informational?style=flat-square)

Run a tailscale subnet router in Kubernetes

**This chart is not maintained by the upstream project and any issues with the chart should be raised [here](https://github.com/johanneskastl/helm-charts/issues/)**

Inspired by a video that Adrian Goins made in 2021. Unfortunately, he deleted the videos from his Youtube Channel. The setup he described consists of tailscale as a sidecar to Traefik in the `edge` cluster, that can forward traffic to services in a `local` cluster. This chart is intended for this `local` cluster, where traffic is to be forwarded **to**.

This chart allows you to route traffic from another host via the tailscale network to your cluster's services. After the installation, please check in the tailscale admin interface that the host appears. Then disable the key expiration and activate the route for your cluster's `service_cidr`.

This chart generates a `serviceAccount` and the necessary `Role` and `RoleBinding`, so the `serviceAccount` is allowed to read **and** write the secret that contains the API key.

You need to have a tailscale account. And you need a **reusable** tailscale API key.

Store the API-key in a secret in the namespace. By default, this chart requires a secret called `tailscale-auth`, which should look like this:

```yaml
apiVersion: v1
stringData:
  TS_AUTH_KEY: tskey-auth-...
kind: Secret
metadata:
  name: tailscale-auth
```

Replace `tskey-auth-...` with your actual API key.

## Source Code

* <https://github.com/tailscale/tailscale>

## Requirements

Kubernetes: `>=1.19.0-0`

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.5 |

## TL;DR

```console
helm repo add johanneskastl-helm-charts https://johanneskastl.github.io/helm-charts/
helm repo update
helm install tailscale johanneskastl-helm-charts/tailscale
```

## Installing the Chart

To install the chart with the release name `tailscale`

```console
helm install tailscale johanneskastl-helm-charts/tailscale
```

## Uninstalling the Chart

To uninstall the `tailscale` deployment

```console
helm uninstall tailscale
```

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml) from the [common library](https://github.com/johanneskastl/helm-charts/tree/main/charts/common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install tailscale \
  --set env.TZ="America/New York" \
    johanneskastl-helm-charts/tailscale
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.

```console
helm install tailscale johanneskastl-helm-charts/tailscale -f values.yaml
```

## Custom configuration

This chart uses the [common library chart](https://github.com/johanneskastl/helm-charts/tree/main/charts/common). So you **could** used other parameters from the [values.yaml](https://github.com/johanneskastl/helm-charts/tree/main/charts/common/values.yaml).

However, this chart does not need other parameters than these ones:

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| `env.TS_KUBE_SECRET` | string | `"tailscale-auth"` | Name of the secret containing the tailscale API key for this machine |
| `env.TS_USERSPACE` | string | `true` |  |
| `env.TS_ROUTES` | string | none, setting this is **mandatory** | Routes this tailscale router should publish |

`env.TS_ROUTES` should contain your cluster's `service_cidr`, which allows you to forward traffic from the tailscale network to services running inside your cluster.

If you wish, you can tweak the image tag and specify which image to use:

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"tailscale/tailscale"` | image repository |
| image.tag | string | chart.appVersion | image tag |

Read through the [values.yaml](./values.yaml) file to see the complete list of parameters used. Tweaking other parameters than the ones above is **not supported**, you are on your own in that case...

## Values

**Important**: When deploying an application Helm chart you can add more values from the common library chart [here](https://github.com/johanneskastl/helm-charts/tree/main/charts/common)

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env | object | See below | environment variables |
| image.pullPolicy | string | `"Always"` | image pull policy |
| image.repository | string | `"ghcr.io/tailscale/tailscale"` | image repository |
| image.tag | string | chart.appVersion | image tag |
| podSecurityContext | object | `{"runAsGroup":1000,"runAsUser":1000}` | Configure the Security Context for the Pod |
| probes.liveness.enabled | bool | `false` |  |
| probes.readiness.enabled | bool | `false` |  |
| probes.startup.enabled | bool | `false` |  |
| service.main.enabled | bool | `false` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `"tailscale"` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version 0.18.1

#### Added

N/A

#### Changed

* update appVersion to 1.68.1

### Version 0.18.0

#### Added

N/A

#### Changed

* update appVersion to 1.68.0

### Version 0.16.4

#### Added

N/A

#### Changed

* update appVersion to 1.66.4

### Version 0.16.3

#### Added

N/A

#### Changed

* update appVersion to 1.66.3

### Version 0.16.2

#### Added

N/A

#### Changed

* update appVersion to 1.66.2

### Version 0.16.1

#### Added

N/A

#### Changed

* update appVersion to 1.66.1
* use image from ghcr.io registry

### Version 0.16.0

#### Added

N/A

#### Changed

* update appVersion to 1.66.0

### Version 0.14.2

#### Added

N/A

#### Changed

* update appVersion to 1.64.2

### Version 0.14.1

#### Added

N/A

#### Changed

* update appVersion to 1.64.1

### Version 0.14.0

#### Added

N/A

#### Changed

* update appVersion to 1.64.0

### Version 0.12.1

#### Added

N/A

#### Changed

* update appVersion to 1.62.1

### Version 0.12.0

#### Added

N/A

#### Changed

* update appVersion to 1.62.0

### Version 0.11.1

#### Added

N/A

#### Changed

* update appVersion to 1.60.1

### Version 0.11.0

#### Added

N/A

#### Changed

* update appVersion to 1.60.0

#### Fixed

N/A

### Version 0.10.2

#### Added

N/A

#### Changed

* update appVersion to 1.58.2

#### Fixed

N/A

### Version 0.10.1

#### Added

N/A

#### Changed

* update appVersion to 1.58.1

#### Fixed

N/A

### Version 0.10.0

#### Added

N/A

#### Changed

* update appVersion to 1.58.0

#### Fixed

N/A

### Version 0.9.1

#### Added

N/A

#### Changed

* update appVersion to 1.56.1

#### Fixed

N/A

### Version 0.9.0

#### Added

N/A

#### Changed

* update appVersion to 1.56.0

#### Fixed

N/A

### Version 0.8.1

#### Added

N/A

#### Changed

* update appVersion to 1.54.1

#### Fixed

N/A

### Version 0.8.0

#### Added

N/A

#### Changed

* update appVersion to 1.54.0

#### Fixed

N/A

### Version 0.7.1

#### Added

N/A

#### Changed

* update appVersion to 1.52.1

#### Fixed

N/A

### Version 0.7.0

#### Added

N/A

#### Changed

* update appVersion to 1.52.0

#### Fixed

N/A

### Version 0.6.1

#### Added

N/A

#### Changed

* update appVersion to 1.50.1

#### Fixed

N/A

### Version 0.6.0

#### Added

N/A

#### Changed

* update appVersion to 1.50.0

#### Fixed

N/A

### Version 0.5.2

#### Added

N/A

#### Changed

* update appVersion to 1.48.2

#### Fixed

N/A

### Version 0.5.1

#### Added

N/A

#### Changed

* update appVersion to 1.48.1

#### Fixed

N/A

### Version 0.5.0

#### Added

N/A

#### Changed

* update appVersion to 1.48.0

#### Fixed

N/A

### Version 0.4.1

#### Added

N/A

#### Changed

* update appVersion to 1.46.1

#### Fixed

N/A

### Version 0.4.0

#### Added

N/A

#### Changed

* update appVersion to 1.46.0

#### Fixed

N/A

### Version 0.3.2

#### Added

N/A

#### Changed

* update appVersion to 1.44.2

#### Fixed

N/A

### Version 0.3.0

#### Added

N/A

#### Changed

* update appVersion to 1.44.0

#### Fixed

N/A

### Version 0.2.1

#### Added

N/A

#### Changed

* update appVersion to 1.42.1

#### Fixed

N/A

### Version 0.2.0

#### Added

N/A

#### Changed

* update appVersion to 1.42.0

#### Fixed

N/A

### Version 0.1.1

#### Added

N/A

#### Changed

* update appVersion to 1.40.1

#### Fixed

N/A

### Version 0.1.0

#### Added

N/A

#### Changed

* update appVersion to 1.40.0

#### Fixed

N/A

### Version 0.0.5

#### Added

N/A

#### Changed

* update appVersion to 1.38.4

#### Fixed

N/A

### Version 0.0.4

#### Added

N/A

#### Changed

* update appVersion to 1.38.3

#### Fixed

N/A

### Version 0.0.3

#### Added

N/A

#### Changed

* generate README with helm-docs

#### Fixed

N/A

### Version 0.0.2

#### Added

* README.md added

#### Changed

* the `envFrom` section is no longer set in the values.yaml to avoid duplicate settings. Instead it is using the secret name from the `env.TS_KUBE_SECRET`

#### Fixed

N/A

### Version 0.0.1

First version of the chart, with appVersion v1.38.2

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).
