require 'elasticsearch'

module ElasticsearchApi
  extend self

  ES_INDEX = 'csv_import'
  @client = Elasticsearch::Client.new log: true, host: 'localhost:9200'

  def create_document(index_type, data)
    @client.index index: ES_INDEX, type: index_type, body: data
  end
end
