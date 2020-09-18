require 'yaml'

dir = 'definitionen'
out = []

def find_title(file)
  File.read(file).match('title: ([^\n]+)\n')[1]
end

Dir["#{dir}/*.html"].each do |file|
  out.push('title' => find_title(file), 'url' => "/#{file}")
end

r = {
  'title' => find_title("#{dir}.html"),
  'url' => "/#{dir}.html",
  'subnav' => out
}
puts r.to_yaml
