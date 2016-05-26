require 'csv'
require 'pathname'
require 'sidekiq'

class ImportFileWorker
  include Sidekiq::Worker

  def perform(file_path)
    processed_header = false
    columns = nil
    index_type = Pathname.new(file_path).basename.to_s.split(/\./).first
    CSV.foreach(file_path, col_sep: '|') do |row|
      unless processed_header
        columns = row
        processed_header = true
        next
      end
      data = Hash[columns.zip row]
      ImportRowWorker.perform_async(index_type, data)
    end
  end
end
