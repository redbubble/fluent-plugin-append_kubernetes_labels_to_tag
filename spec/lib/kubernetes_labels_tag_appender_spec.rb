require 'kubernetes_labels_tag_appender'

describe KubernetesLabelsTagAppender do
  describe '#append' do
    let (:labels) { ['foo', 'baz'] }
    
    it 'appends the configured labels to the tags with their names' do
      data = {'foo' => 'bar', 'baz' => 'qux'}

      expect(described_class.new(labels).append('lol', data)).to eq('lol.foo=bar.baz=qux')
    end

    it 'only appends the configured labels' do
      data = {'foo' => 'bar', 'baz' => 'qux', 'nope' => 'nope'}

      expect(described_class.new(labels).append('lol', data)).to eq('lol.foo=bar.baz=qux')
    end

    it 'appends the configured labels even if they are empty' do
      data = {}

      expect(described_class.new(labels).append('lol', data)).to eq('lol.foo=.baz=')
    end
  end
end
