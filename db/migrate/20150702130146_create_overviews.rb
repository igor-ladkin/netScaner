class CreateOverviews < ActiveRecord::Migration
  def change
    create_table :overviews do |t|
      t.string :name
      t.text :description
      t.text :comment
      t.string :status
      t.time :last_time_active
      t.belongs_to :node, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
