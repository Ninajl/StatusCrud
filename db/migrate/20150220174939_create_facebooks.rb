class CreateFacebooks < ActiveRecord::Migration
  def change
    create_table :facebooks do |t|
      t.text :status
      t.string :user
      t.integer :likes

      t.timestamps null: false
    end
  end
end
