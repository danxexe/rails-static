require 'rails-static/config'
require 'rails-static/railtie' if defined?(Rails)

module RailsStatic
  class << self

    def config=(data)
      @config = data
    end

    def config
      @config ||= Config.new
      @config
    end

    def configure(&proc)
      @config ||= Config.new
      yield @config
    end

  end
end