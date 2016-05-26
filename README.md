# JRuby Elasticsearch CSV Import

```
# Usage:

# put pipe delimited files in ./import/

# start sidekiq
sidekiq -r ./lib/bootstrapper.rb

# monitor sidekiq: http://localhost:9494/
./main.rb --monitor-queue

# queue and import files:
./main.rb --queue-files

```