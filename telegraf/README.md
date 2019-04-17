<!--nologo-->

[Telegraf](https://github.com/influxdata/telegraf) is an agent for collecting metrics and writing them into InfluxDB or other possible outputs.

In this playground, you've got Telegraf and InfluxDB already installed and configured.

## Configuration

The configuration file is located at `/etc/telegraf/telegraf.conf`. It enables several [inputs](https://github.com/influxdata/telegraf/blob/master/README.md#input-plugins) such as `cpu` and `mem` that read metrics about the system’s cpu and memory usage. It also specifies InfluxDB as the desired [output](https://github.com/influxdata/telegraf/blob/master/README.md#output-plugins).

You can view and edit the config using `nano` or `vim`:
```bash
nano /etc/telegraf/telegraf.conf
```

## How to use it

Run a single collection of metrics and print them to stdout:

```
telegraf --test
```

Collect metrics only from `cpu` and `mem` inputs and print them to stdout:

```
telegraf --input-filter cpu:mem --test
```

## Start the Telegraf service

```bash
sudo service telegraf start
```

Once Telegraf is up and running, it will start collecting metrics and writing them to the local InfluxDB every 10 seconds.

You can check Telegraf and InfluxDB logs at `/var/log/telegraf/telegraf.log` and `/var/log/influxdb/influxd.log` respectively.

## Explore metrics in InfluxDB

Enter the interactive InfluxDB shell and connect to the `telegraf` [database](https://docs.influxdata.com/influxdb/v1.7/concepts/glossary/#database):

```bash
influx -database telegraf
```

Once in the InfluxDB shell, list all [measurements](https://docs.influxdata.com/influxdb/v1.7/concepts/glossary/#measurement) in the database:

```bash
> SHOW MEASUREMENTS
name: measurements
name
----
cpu
disk
diskio
kernel
mem
processes
swap
system
```

List all [field keys](https://docs.influxdata.com/influxdb/v1.7/concepts/glossary/#field-key) by measurement:

```bash
> SHOW FIELD KEYS
name: cpu
fieldKey         fieldType
--------         ---------
usage_guest      float
usage_guest_nice float
usage_idle       float
usage_iowait     float
usage_irq        float
usage_nice       float
usage_softirq    float
usage_steal      float
usage_system     float
usage_user       float
...
```

Select a data sample in the [field](https://docs.influxdata.com/influxdb/v1.7/concepts/glossary/#field) `usage_idle` in the measurement `cpu`:

```bash
> SELECT usage_idle FROM cpu WHERE cpu = 'cpu-total' LIMIT 5
name: cpu
time                usage_idle
----                ----------
1555419650000000000 99.74840657497393
1555419660000000000 99.83283182882222
1555419670000000000 99.81608426684404
1555419680000000000 99.81602274627767
1555419690000000000 99.71576659421494
```

That’s it! You now have the foundation for using Telegraf to collect metrics and write them to your output of choice.

## What's next?

You can explore the official Telegraf [documentation](https://docs.influxdata.com/telegraf) and check available [input](https://github.com/influxdata/telegraf/blob/master/README.md#input-plugins) and [output](https://github.com/influxdata/telegraf/blob/master/README.md#output-plugins) plugins.

You can also improve this playground or create your own. Please send a PR or open an issue in [github.com/rootnroll/library](https://github.com/rootnroll/library).
