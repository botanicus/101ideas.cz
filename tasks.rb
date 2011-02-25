#!/usr/bin/env nake
# encoding: utf-8

Encoding.default_internal = "utf-8"
Encoding.default_external = "utf-8"

# Setup $LOAD_PATH.
require "bundler"
Bundler.setup

# Task.tasks.default_proc = lambda { |*| Task[:generate] }

Task.new(:generate) do |task|
  task.description = "Generate static HTML."

  task.define do
    sh "bundle exec ./boot.rb"
  end
end

Task.new(:rsync) do |task|
  task.description = "Rsync the output to server."

  # dependencies
  task.dependencies << :generate

  # config
  task.config[:user]   = "static"
  task.config[:server] = "tagadab"
  task.config[:path]   = "/webs/static/101ideas.cz/site"

  task.define do
    config = task.config
    sh "rsync -av --delete output/ #{config[:user]}@#{config[:server]}:#{config[:path]}"
  end
end
