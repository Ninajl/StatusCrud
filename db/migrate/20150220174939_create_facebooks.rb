class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.text :status
      t.string :user
      t.integer :likes, default: 0

      t.timestamps null: false
    end
  end
end
