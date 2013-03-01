task :static do
  Rake::Task['static:generate'].invoke
end

namespace :static do

  desc "Generate static pages"
  task :generate => :environment do
    abort "No static routes specified." unless RailsStatic.config.routes.any?

    require "rails/console/app"
    require "rails/console/helpers"
    extend Rails::ConsoleMethods

    puts "Generating static files..."

    RailsStatic.config.routes.each do |route|

      path = path_from_route route

      puts "Generating #{path}"

      r = app.get(route)
      if r == 200
        fullpath = full_path path
        dir = File.dirname(fullpath)
        FileUtils.mkdir_p dir
        File.open(fullpath, "w") do |f|
          f.write(app.response.body)
        end
      else
        $stderr.puts "Error generating static file #{path} #{r.inspect}"
      end
    end
  end

  desc "Delete static pages"
  task :clean => :environment do
    RailsStatic.config.routes.each do |route|
      path = path_from_route route
      fullpath = full_path path

      next unless File.exists? fullpath

      puts "Deleting #{path}"

      File.delete(fullpath) rescue nil
    end

    rm_empty
  end

  private

  def path_from_route(route)
    path = route
    path = path.gsub(%r{/$}, "/#{RailsStatic.config.index}") if route =~ %r{/$}
    path += RailsStatic.config.extension
  end

  def full_path(path)
    File.join(Rails.public_path, path)
  end

  def rm_empty
    Dir.chdir Rails.public_path do
      Dir.glob("**/").reverse_each do |d|
        if (Dir.entries(d) - %w[ . .. ]).empty?
          puts "Deleting directory /#{d}"
          Dir.rmdir(d)
        end
      end
    end
  end

end