rails-static
=============================

A set of Rake tasks for generating static pages with Rails.


## Usage

Add to your Gemfile:

`gem 'rails-static'`

Add to an initializer:

```ruby
if defined?(RailsStatic)
  RailsStatic.configure do |config|

    config.index = 'index'
    config.routes = ['/']
    config.extension = '.html'

  end
end
```

And run:

`rake static`


## Config options

### index

Name of generated file for urls ending in `/`. Default is `index`

### routes

Array of app urls to request. Request the root route by default.

### extension

Extension of generated files. Default is no extension.
