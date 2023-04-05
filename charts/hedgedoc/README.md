# hedgedoc

![Version: 2.0.0](https://img.shields.io/badge/Version-2.0.0-informational?style=flat-square) ![AppVersion: 1.9.0](https://img.shields.io/badge/AppVersion-1.9.0-informational?style=flat-square)

HedgeDoc lets you create real-time collaborative markdown notes.

This chart was forked from Nicholas Wilde's [helm-charts](https://github.com/nicholaswilde/helm-charts) repository, after it seemed to be abandoned.

## Dependencies

| Repository | Name | Version |
|------------|------|---------|
| https://johanneskastl.github.io/helm-charts/ | common | 5.0.0 |
| https://nicholaswilde.github.io/helm-charts/ | mariadb | ~1.0.5 |

## TL;DR
```console
$ helm repo add johanneskastl https://johanneskastl.github.io/helm-charts/
$ helm repo update
$ helm install hedgedoc johanneskastl/hedgedoc
```

## Installing the Chart
To install the chart with the release name `hedgedoc`:
```console
helm install hedgedoc johanneskastl/hedgedoc
```

## Uninstalling the Chart
To uninstall the `hedgedoc` deployment:
```console
helm uninstall hedgedoc
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Read through the [values.yaml](./values.yaml) file. It has several commented out suggested values.
Other values may be used from the [values.yaml](../common/values.yaml) from the [common library](../common).

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,
```console
helm install hedgedoc \
  --set env.TZ="America/New York" \
    johanneskastl/hedgedoc
```

Alternatively, a YAML file that specifies the values for the above parameters can be provided while installing the chart.
For example,
```console
helm install hedgedoc johanneskastl/hedgedoc -f values.yaml
```

## Support

Open an [issue](https://github.com/johanneskastl/helm-charts/issues/).

