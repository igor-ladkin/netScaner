class CreateInterconnections < ActiveRecord::Migration
  def change
    create_table :interconnections do |t|
      t.string :node_port
      t.string :child_port
      t.string :status
      t.time :last_time_active
      t.belongs_to :node, index: true, foreign_key: true
      t.belongs_to :child_node, index: true

      t.timestamps null: false
    end
  end
end
