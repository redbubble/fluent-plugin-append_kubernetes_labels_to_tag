class KubernetesLabelsTagAppender
  attr_reader :labels

  def initialize(labels)
    @labels = labels
  end

  def events(tag, time, record)
    [
      event(tag, time, record)
    ]
  end

  def event(tag, time, record)
    new_tag = if record.has_key?('kubernetes') && record['kubernetes'].has_key?('labels')
                append(tag, record['kubernetes']['labels'])
              else
                tag
              end

    [
      new_tag,
      time,
      record
    ]
  end

  private

  def append(tag, data)
    @labels.reduce(tag) { |t, l| "#{t}.#{l}=#{data[l]}" }
  end
end
