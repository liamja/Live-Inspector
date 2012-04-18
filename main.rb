class Main < Sinatra::Base

  helpers Sinatra::Partials

  configure do
    # Configure public directory
    set :public_folder, File.join(File.dirname(__FILE__), 'public')

    # Configure HAML and SASS
    set :haml, { :format => :html5 }
    set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
  end

  get '/' do
    haml :index
  end

  not_found do
    halt 404, File.read(File.join(settings.public_folder, '404.html'))
  end

end