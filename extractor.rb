# frozen_string_literaL: true

# Run this script in Moitzi's archvie of the smartpart documetnation to
# extrct jekyll html files.

require 'nokogiri'
require 'fileutils'

def extract_from(path)
  return if path.include?('system') || path.include?('home')

  doc = File.open(path) { |f| Nokogiri::HTML(f) }
  content = doc.at_css('#sites-canvas')

  if content.nil?
    puts "Nothing in #{path}"
    return
  end

  %w[goog-ws-editor-toolbar-container title-crumbs sites-canvas-bottom-panel]
    .each do |id|
    content.at_css("##{id}")&.remove
  end

  content.css('.sites-layout-empty-tile').each(&:remove)
  content.css('a > img').each { |img| normalize_img img }

  remove_attrs content
  generate_html_file path, content
end

def remove_attrs(content)
  %w[xmlns align dir].each do |attr|
    content.css("[#{attr}]").each { |n| n.remove_attribute(attr) }
  end
end

def generate_html_file(path, content)
  title_tag = content.at_css('h3')
  title_tag.name = 'h1'
  title = title_tag.inner_text.strip

  out = %(---
layout: default
title: #{title}
---
#{content}
)

  rpath = path.gsub('smartparts.tzb-moitzi.at', 'output')
  FileUtils.mkdir_p(rpath.gsub(/\/[^\/]+$/, ''))
  File.write(rpath, out)
end

def normalize_img(img)
  a = img.parent
  url = a['href'].gsub('../../7918e6c3-a-706b9da4-s-sites.googlegroups.com/a/tzb-moitzi.at/smartparts/', '/assets/').gsub(/\?.*$/, '')
  a['href'] = url
  img['src'] = url
end

Dir['smartparts.tzb-moitzi.at/**/*.html'].each { |p| extract_from p }
