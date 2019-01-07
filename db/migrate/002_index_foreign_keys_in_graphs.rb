class IndexForeignKeysInGraphs < ActiveRecord::Migration[4.2]
  def change
    add_index :graphs, :author_id
  end
end
