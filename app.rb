require 'sinatra/base'
require 'sinatra/custom_logger'
require 'timber'

module Rack
  class CommonLogger
    def call(env)
      # do nothing
      @app.call(env)
    end
  end
end

class App < Sinatra::Base
  helpers Sinatra::CustomLogger

  configure :development, :production do
    logger = Timber::Logger.new(STDOUT)
    logger.level = Logger::DEBUG if development?
    set :logger, logger

    Timber::Integrations::Rack.middlewares.each do |middleware|
      use middleware
    end
  end
end