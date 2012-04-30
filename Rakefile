require "rubygems"
require "less"

# Source
source = {}
source['jsPlugins'] = 'public/js/plugins.js'
source['less']      = 'public/less/bootstrap.less'

# Targets
target = {}
target['css']       = 'public/css/style.css'
target['cssMin']    = 'public/css/style.min.css'
target['js']        = 'public/js/app.js'
target['jsMin']     = 'public/js/app.min.js'

desc "Build project"
task :default => :build do
end

desc "Build project"
task :build => %w{build:less build:js build:png} do
  puts "Building project"
end

namespace :build do

  desc "Compile LESS to CSS"
  task :less do
    puts 'Compiling LESS to CSS'
    parser = Less::Parser.new :paths => ['public/less'], :filename => source['less']
    tree = parser.parse File.read(source['less'])
    File.open(target['css'], "w") do |file|
      file.write tree.to_css
    end
    File.open(target['cssMin'], "w") do |file|
      file.write tree.to_css(:compress => true)
    end
  end

  desc "Minify Javascript"
  task :js do
    puts 'Minifying JS'
    directory 'js'
    sh "uglifyjs -o #{target['jsMin']} #{target['js']}"
  end

  desc "Optimise PNGs"
  task :png do
    puts 'Optimising PNGs'
    png = FileList['public/img/**/*.png']
    sh "optipng --quiet -o7 #{png}"
  end

  desc "Optimise JPGs"
  task :jpg do
    puts 'Optimising JPGs'
    jpg = FileList['public/img/**/*.jpg']
    jpg.each do |file|
      sh "jpegtran -optimize -output '#{file}' '#{file}'"
    end
  end

end