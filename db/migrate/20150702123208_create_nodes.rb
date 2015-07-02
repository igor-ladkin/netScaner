class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :ip_address
      t.string :mac_address
      t.string :type

      t.timestamps null: false
    end
  end
end
