require 'sidekiq/web'

class MonitorQueue
  def initialize
  end

  def run
    app = Sidekiq::Web
    app.set :environment, :production
    app.set :bind, '0.0.0.0'
    app.set :port, 9494
    app.run!
  end
end
