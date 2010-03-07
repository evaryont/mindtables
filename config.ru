
require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  #
  # See http://github.com/cloudhead/toto#readme for the configuration keys

  set :author,    "Colin Shea"
  set :title,     "Mind Tables"
  set :url,       (ENV['RACK_ENV'] == 'development') ? "http://localhost" : "http://mindtables.heroku.com"
  set :markdown,  :smart
  set :cache,      28800
  set :date, lambda {|now| now.strftime("%d %B %Y") }

  # set :author,    ENV['USER']                               # blog author
  # set :title,     Dir.pwd.split('/').last                   # site title
  # set :root,      "index"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds

end

run toto

# vim: set syn=ruby:
