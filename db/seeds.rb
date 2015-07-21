# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create([
  {first_name: "User 1"},
  {first_name: "User 2"},
  {first_name: "User 3"}
  ])
Item.create([
  {name: "Apple", stock_quantity: 10, marked_price: 1.5},
  {name: "Orange", stock_quantity: 20, marked_price: 2.0},
  {name: "Banana", stock_quantity: 15, marked_price: 1.0}
  ])
User.all.each do |user|

  Order.create(user_id: user.id)

end

Order.all.each do |order|
  Orderstatus.create(order_id: order.id)
    Item.all.each do |item|
      Orderitem.create(order_id: order.id, item_id: item.id)
    end
end
