require 'redmine'

require 'reports_plugin/macros'
require 'reports_plugin/layout_hook.rb'

Redmine::Plugin.register :redmine_reports do
  author 'Jean-Baptiste BARTH'
  description 'Add ability to display some graph/reports on wiki formatted areas'
  url 'http://github.com/jbbarth/redmine_reports'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  version '0.1'
  requires_redmine :version_or_higher => '1.0.0'
end

Redmine::MenuManager.map :admin_menu do |menu|
  menu.push :graphs, {:controller => :graphs}, :caption => :label_graph_plural
end
