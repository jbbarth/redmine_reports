class IndexForeignKeysInGraphs < ActiveRecord::Migration
  def change
    add_index :graphs, :author_id
  end
end
