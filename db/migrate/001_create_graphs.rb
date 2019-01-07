class CreateGraphs < ActiveRecord::Migration[4.2]
  def self.up
    create_table :graphs do |t|
      t.column :title, :string
      t.column :author_id, :integer
      t.column :language, :string
      t.column :source, :text
      t.column :rendering, :text
    end
  end

  def self.down
    drop_table :graphs
  end
end
