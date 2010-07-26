require 'redmine'

Redmine::Plugin.register :redmine_reports do
  author 'Jean-Baptiste BARTH'
  description 'Add ability to display some graph/reports on wiki formatted areas'
  url 'http://github.com/jbbarth/redmine_reports'
  author_url 'mailto:jeanbaptiste.barth@gmail.com'
  version '0.1'
  requires_redmine :version_or_higher => '1.0.0'
end
