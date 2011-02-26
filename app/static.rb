# encoding: utf-8

require "ace/filters/template"

class Static < Ace::Item
  # Render self.original_path as a template.
  # Original path is the second argument we pass to the rule:
  # rule Tags, "tags.html.haml"
  before Ace::TemplateFilter

  # HACK: @output_path is "" for some reason, why? -> FIX IT
  def output_path
    _, basename = File.split(@original_path)
    slug = basename.split(".").first
    "output/#{slug}.html"
  end
end
