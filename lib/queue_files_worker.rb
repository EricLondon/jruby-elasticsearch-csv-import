require 'sidekiq'

class QueueFilesWorker
  include Sidekiq::Worker

  def perform
    Dir['./import/*part'].each do |file_path|
      ImportFileWorker.perform_async(file_path)
    end
  end
end
