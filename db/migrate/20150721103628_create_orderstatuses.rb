class CreateOrderstatuses < ActiveRecord::Migration
  def change
    create_table :orderstatuses do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.boolean :status

      t.timestamps null: false
    end
  end
end
