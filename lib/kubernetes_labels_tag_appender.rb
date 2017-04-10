class KubernetesLabelsTagAppender
  attr_reader :labels

  def initialize(labels)
    @labels = labels
  end

  def append(tag, data)
    @labels.reduce(tag) { |t, l| "#{t}.#{l}=#{data[l]}" }
  end
end
