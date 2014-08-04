class CreatePolishes < ActiveRecord::Migration
  def change
    create_table :polishes do |t|
      t.string :color
      t.string :style
      t.string :brand
      t.string :name

      t.timestamps
    end
  end
end
