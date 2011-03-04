# encoding: utf-8

require "ace/static"

# filters
rule Ace::Static, "*.html.haml"
rule Ace::Asset, "robots.txt", "assets/**/*"

# generators
# generator TagPage#, "/tags/:slug"
