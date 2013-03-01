module RailsStatic
  class Config
    include ActiveModel::Validations

    attr_accessor :index
    attr_accessor :routes
    attr_accessor :extension

    def initialize
      self.index = 'index'
      self.routes = ['/']
      self.extension = ''
    end

  end
end