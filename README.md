[![Build Status](https://github.com/shinesolutions/aws-scripts-mon/workflows/CI/badge.svg)](https://github.com/shinesolutions/aws-scripts-mon/actions?workflow=CI)

AWS CloudWatch Monitoring Scripts
---------------------------------

A fork of [AWS CloudWatch Monitoring Scripts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/mon-scripts.html), which customises the metric's `Filesystem` value to be the same as the `Mount` value.

We add this customisation because we would like to be able to explicitly define the value of both `Mount` and `Filesystem` within the metric, which will then allow us to filter the metrics, in our case, when using [CloudWatch Dashboard](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch_Dashboards.html).

On the original code, the `Filesystem` value is derived from `/bin/df -k -l -P $df_path` which can differ between systems. This causes a problem where we can't guarantee what `Filesystem` value to use when filtering the metrics.

Usage
-----

We use [MasterRoot24/cloudwatch](https://forge.puppet.com/MasterRoot24/cloudwatch) Puppet module to provision AWS CloudWatch Monitoring Scripts, and then customise the `zip_url` parameter value to point to this fork's released artifacts.

For example:

```
  class { '::cloudwatch':
    ...
    zip_url => 'https://github.com/shinesolutions/aws-scripts-mon/releases/download/1.3.0/shinesolutions-aws-scripts-mon-1.3.0.zip',
  }
```
