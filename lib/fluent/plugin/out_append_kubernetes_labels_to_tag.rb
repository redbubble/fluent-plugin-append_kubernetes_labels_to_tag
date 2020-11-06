require 'fluent/output'
require_relative '../../kubernetes_labels_tag_appender.rb'

module Fluent
  class Fluent::AppendKubernetesLabelsToTag < Fluent::Output
    Fluent::Plugin.register_output('append_kubernetes_labels_to_tag', self)

    config_param :labels, :string

    def configure(conf)
      super

      @labels = conf['labels'].split(',')
    end

    def emit(tag, es, chain)
      es.each do |time, record|
        kubernetes_labels_tag_appender.events(tag, time, record).each do |(tag, time, record)|
          router.emit(tag, time, record)
        end
      end

      chain.next
    rescue
      log.error "Failed to re-format docker record #{record}"
      # this seems to be a way to safely swallow records we don't know how to format
      ""
    end

    private

    def kubernetes_labels_tag_appender
      @kubernetes_labels_tag_appender ||= KubernetesLabelsTagAppender.new(@labels)
    end
  end
end
