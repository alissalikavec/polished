class CreateOwns < ActiveRecord::Migration
  def change
    create_table :owns do |t|
      t.references :user, index: true
      t.references :polish, index: true

      t.timestamps
    end
  end
end
