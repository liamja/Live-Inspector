require "rubygems"
require "less"

# Source
source = {}
source['jsPlugins'] = 'js/plugins.js'
source['less']      = 'less/bootstrap.less'

# Targets
target = {}
target['css']       = 'style.css'
target['cssMin']    = 'style.min.css'
target['js']        = 'js/app.js'
target['jsMin']     = 'js/app.min.js'

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
    parser = Less::Parser.new :paths => ['less'], :filename => source['less']
    tree = parser.parse File.read(less)
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
    png = FileList['img/**/*.png']
    sh "optipng --quiet -o7 #{png}"
  end

  desc "Optimise JPGs"
  task :jpg do
    puts 'Optimising JPGs'
    jpg = FileList['img/**/*.jpg']
    jpg.each do |file|
      sh "jpegtran -optimize -output '#{file}' '#{file}'"
    end
  end

end