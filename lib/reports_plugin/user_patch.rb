module PluginRedmineReports
  module UserPatch
    def remove_references_before_destroy
      super
      substitute = User.anonymous
      Graph.where(['author_id = ?', id]).update_all(['author_id = ?', substitute.id])
    end
  end
end

User.prepend PluginRedmineReports::UserPatch