# fluent-plugin-append_kubernetes_labels_to_tag

## A Fluent plugin to add kubernetes container labels to the log tag

## Prerequisites

This plugin is intended for use with the [kuberenetes_metadata_filter](https://github.com/fabric8io/fluent-plugin-kubernetes_metadata_filter) plugin. You will need to filter with `kubernetes_metadata_filter` so that your log records have the `kubernetes` attribute loaded with the required data.

## Usage

In your Gemfile:

```ruby
gem 'fluent-plugin-append-kubernetes-labels-to-tag'
```

In your Fluent config:

```
<filter **>
  @type kubernetes_metadata_filter # See 'Prerequisites' above
  
  ...
  
</filter>

<filter **>
  @type append_kubernetes_labels_to_tag
  
  labels ['log_destination']
</filter>
```


## Contributing

If you would like to contribute a fix or feature, here's what you should do:

1. Raise an issue so we can discuss your change, and be sure you're not wasting your time
1. Fork this repo (optional if you are a Redbubble engineer)
2. Make your changes
3. Submit a pull request

## Maintainers

delivery-engineers@redbubble.com


    Copyright (c) Redbubble 2017. All rights reserved.
