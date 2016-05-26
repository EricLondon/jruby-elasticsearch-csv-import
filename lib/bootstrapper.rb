require 'pry'

lib_directory = File.dirname(__FILE__)
lib_directory << '/lib' unless lib_directory.split(File::SEPARATOR).last == 'lib'

$LOAD_PATH << lib_directory

require 'elasticsearch_api'
require 'import_file_worker'
require 'import_row_worker'
require 'monitor_queue'
require 'queue_files_worker'
