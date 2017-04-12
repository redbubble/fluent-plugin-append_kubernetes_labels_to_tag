require 'kubernetes_labels_tag_appender'

describe KubernetesLabelsTagAppender do
  describe '#event' do
    let(:labels) { ['foo', 'baz'] }
    let(:time) { Time.now }

    it 'appends the configured labels to the tags with their names' do
      data = {'foo' => 'bar', 'baz' => 'qux'}
      record = { 'kubernetes' => { 'labels' => data }}

      expect(described_class.new(labels).event('lol', time, record)[0]).to eq('lol.foo=bar.baz=qux')
    end

    it 'only appends the configured labels' do
      data = {'foo' => 'bar', 'baz' => 'qux', 'nope' => 'nope'}
      record = { 'kubernetes' => { 'labels' => data }}

      expect(described_class.new(labels).event('lol', time, record)[0]).to eq('lol.foo=bar.baz=qux')
    end

    it 'appends the configured labels even if they are empty' do
      data = {}
      record = { 'kubernetes' => { 'labels' => data }}

      expect(described_class.new(labels).event('lol', time, record)[0]).to eq('lol.foo=.baz=')
    end
  end
end
