require 'redmine'

require 'reports_plugin/hooks/view_layouts_base_html_head'

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'reports_plugin/macros'
end

Redmine::Plugin.register :redmine_reports do
  name 'Redmine Reports plugin'
  description 'Add ability to display some graph/reports on wiki formatted areas'
  url 'https://github.com/jbbarth/redmine_reports'
  author 'Jean-Baptiste BARTH'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  version '0.2'
  requires_redmine :version_or_higher => '2.1.0'
  settings :default => {
    'graph_size_x' => "450",
    'graph_size_y' => "300",
  }, :partial => 'settings/reports_settings'
end

Redmine::MenuManager.map :admin_menu do |menu|
  menu.push :graphs, {:controller => :graphs}, :caption => :label_graph_plural
end
