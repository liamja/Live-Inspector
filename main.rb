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

	post '/' do

		@file = params['file']

		# projectFile = settings.public_folder + '/uploads/' + @file[:filename]
		projectFile = @file[:tempfile].to_s

		File.open(projectFile, "w") do |f|
		  gz = Zlib::GzipReader.new(@file[:tempfile])
			f.write(gz.read)
		  gz.close
		  @file[:size] = File.size f
		end

		Parse projectFile

		haml :output

	end

	not_found do
		halt 404, File.read(File.join(settings.public_folder, '404.html'))
	end

end