# tailscale

![Version: 0.0.2](https://img.shields.io/badge/Version-0.0.2-informational?style=flat-square) ![AppVersion: v1.38.2](https://img.shields.io/badge/AppVersion-v1.38.2-informational?style=flat-square)

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
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |

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

The best way is to use a YAML file that specifies the values for the above parameters. This YAML file can be provided while installing the chart:

```console
helm install tailscale johanneskastl-helm-charts/tailscale -f values.yaml
```

Alternatively, specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

```console
helm install tailscale \
  --set env.TS_ROUTES="..." \
    johanneskastl-helm-charts/tailscale
```

## Custom configuration

N/A

## Changelog

All notable changes to this Helm chart will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v0.1.1](https://github.com/k8s-at-home/helm-docs/releases/v0.1.1)
