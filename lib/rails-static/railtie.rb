module RailsStatic
  class Railtie < Rails::Railtie

    rake_tasks do
      load "tasks/static.rake"
    end

  end
end