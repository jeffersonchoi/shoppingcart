class CreateOrderitems < ActiveRecord::Migration
  def change
    create_table :orderitems do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.integer :selling_quantity
      t.float :selling_price

      t.timestamps null: false
    end
  end
end
