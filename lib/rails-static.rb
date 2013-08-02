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

    def files
      config.routes.map {|r| path_from_route r }
    end

    def path_from_route(route)
      path = route.gsub %r{^/}, ''
      path = path.gsub(%r{/$}, "/#{RailsStatic.config.index}") if route =~ %r{/$}
      path += RailsStatic.config.extension
    end

  end
end