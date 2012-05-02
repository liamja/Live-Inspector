class Main < Sinatra::Base

	helpers Sinatra::Partials

	# Caching

  $cache = Memcached.new

  use Rack::Deflater

  use Rack::Cache,
    :verbose => true,
    :metastore => $cache,
    :entitystore => $cache

  # Setup

	configure do
		# Configure public directory
		set :public_folder, File.join(File.dirname(__FILE__), 'public')

		# Configure HAML and SASS
		set :haml, { :format => :html5 }
		set :sass, { :style => :compressed } if ENV['RACK_ENV'] == 'production'
	end

	before do
	  cache_control :public, :max_age => 60
	end

	# Routing

	get '/' do
		haml :index
	end

	post '/' do

	  gz = Zlib::GzipReader.new(params[:projectFile][:tempfile])
	  Parse gz.read
	  gz.close

	  haml :output

	end

	get "/img/*" do
		cache_control :public, :max_age => 2700
  end

	get "/css/*.css" do
    content_type 'text/css'
  end

	not_found do
		halt 404, File.read(File.join(settings.public_folder, '404.html'))
	end

end