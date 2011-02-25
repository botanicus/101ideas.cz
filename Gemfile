# encoding: utf-8

def custom_gem(name)
  if ENV["USER"] == "botanicus"
    sources = File.join(ENV["HOME"], "Projects", "sources")
    gem name, path: File.join(sources, name)
  else
    gem name, git: "git://github.com/botanicus/#{name}.git"
  end
end

source "http://gemcutter.org"

gem "nokogiri"
gem "rack"

custom_gem "ace"
custom_gem "pupu"
custom_gem "nake"
custom_gem "media-path"
custom_gem "template-inheritance"
