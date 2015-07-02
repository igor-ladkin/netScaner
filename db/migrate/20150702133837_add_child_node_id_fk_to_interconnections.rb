class AddChildNodeIdFkToInterconnections < ActiveRecord::Migration
  def change
    add_foreign_key :interconnections, :nodes, column: :child_node_id
  end
end
