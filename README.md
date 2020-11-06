# fluent-plugin-append_kubernetes_labels_to_tag

**Note: Redbubble no longer use or maintain this gem**

A Fluent plugin to add kubernetes container labels to the log tag

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

<match **>
  @type append_kubernetes_labels_to_tag

  labels label1,label2
</match>
```

## Contributions

Contributions are welcome! Please feel free to open issues or pull requests to get help or discuss ideas or implementations. Note that opening pull requests with work in progress is not only welcome, but encouraged! Talk early, talk often, and we will all learn in the way :)

Finally, please note that this project is released with a [Contributor Code of Conduct][coc]. By participating in this project you agree to abide by its terms.

  [coc]: ./CODE_OF_CONDUCT.md

## Credits

[![](doc/redbubble.png)][redbubble]

`fluent-plugin-append_kubernetes_labels_to_tag` is maintained and funded by [Redbubble][redbubble].

  [redbubble]: https://www.redbubble.com

## License

    fluent-plugin-append_kubernetes_labels_to_tag

    Copyright (C) 2017 Redbubble

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
    EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

