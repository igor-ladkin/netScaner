class RenameChildPortColumnAtInterconnections < ActiveRecord::Migration
  def change
    rename_column :interconnections, :child_port, :child_node_port
  end
end
