require 'sidekiq'

class ImportRowWorker
  include Sidekiq::Worker

  def perform(index_type, data)
    ElasticsearchApi.create_document(index_type, data)
  end
end
