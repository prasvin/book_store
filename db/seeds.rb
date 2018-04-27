# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

john = User.find_or_create_by!(email: 'john@doe.com', first_name: 'John', last_name: 'Doe')

ruby = Book.find_or_create_by!(title: 'Ruby', author: 'Matz Aki', isbn: '123-isbn-ruby', price: 119.99)
ember = Book.find_or_create_by!(title: 'Ember', author: 'Yahuda Katz', isbn: '123-isbn-embe', price: 129.99)
python = Book.find_or_create_by!(title: 'Python', author: 'Jason Sonn', isbn: '123-isbn-pyth', price: 99.99)

inactive_cart = Cart.find_or_create_by!(state: 'inactive', user: john)
active_cart = Cart.find_or_create_by!(state: 'active', user: john)

Item.find_or_create_by!(quantity: 5, book: ruby, cart: inactive_cart)
Item.find_or_create_by!(quantity: 5, book: ember, cart: inactive_cart)
Item.find_or_create_by!(quantity: 5, book: python, cart: inactive_cart)

Item.find_or_create_by!(quantity: 2, book: ruby, cart: active_cart)
Item.find_or_create_by!(quantity: 3, book: ember, cart: active_cart)

Order.create!(cart: active_cart, user: john)
