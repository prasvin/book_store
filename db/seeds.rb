# This is also used in rspecs by shared_contexts/load_seeds

# Books
ruby = Book.find_or_create_by!(title: 'Ruby', author: 'Matz Aki', isbn: '123-isbn-ruby', price: 119.99)
ember = Book.find_or_create_by!(title: 'Ember', author: 'Yahuda Katz', isbn: '123-isbn-embe', price: 129.99)
python = Book.find_or_create_by!(title: 'Python', author: 'Jason Sonn', isbn: '123-isbn-pyth', price: 99.99)
docker = Book.find_or_create_by!(title: 'Docker', author: 'Docker Compose', isbn: '123-isbn-dock', price: 49.99)
inner = Book.find_or_create_by!(title: 'Inner Engineering', author: 'Sadhguru', isbn: '123-isbn-isha', price: 49.99)

# User: john
john = User.find_or_create_by!(email: 'john@doe.com', first_name: 'John', last_name: 'Doe')

# inactive cart
inactive_cart = Cart.find_or_create_by!(state: 'inactive', user: john)
Item.find_or_create_by!(quantity: 5, book: ruby, cart: inactive_cart)
Item.find_or_create_by!(quantity: 5, book: ember, cart: inactive_cart)
Item.find_or_create_by!(quantity: 5, book: python, cart: inactive_cart)

# previous ordered cart 1
unless john.carts.ordered.exists?
  previous_ordered_cart_1 = Cart.find_or_create_by!(state: 'active', user: john)
  Item.find_or_create_by!(quantity: 5, book: python, cart: previous_ordered_cart_1)
  Item.find_or_create_by!(quantity: 1, book: ruby, cart: previous_ordered_cart_1)

  Order.find_or_create_by!(cart: previous_ordered_cart_1, user: john)

  # previous ordered cart 2
  previous_ordered_cart_2 = Cart.find_or_create_by!(state: 'active', user: john)
  Item.find_or_create_by!(quantity: 3, book: ruby, cart: previous_ordered_cart_2)
  Item.find_or_create_by!(quantity: 3, book: ember, cart: previous_ordered_cart_2)

  Order.find_or_create_by!(cart: previous_ordered_cart_2, user: john)
end

# python becomes unavailable and replaced by more python
python.update!(available: false)
more_python = Book.find_or_create_by!(title: 'More Python', author: 'Jason Sonn', isbn: '123-isbn-more', price: 119.99)

# current active cart
active_cart = Cart.find_or_create_by!(state: 'active', user: john)
Item.find_or_create_by!(quantity: 2, book: docker, cart: active_cart)
Item.find_or_create_by!(quantity: 2, book: inner, cart: active_cart)


# Another User: angela
angela = User.find_or_create_by!(email: 'angela@ann.com', first_name: 'Angela', last_name: 'Ann')

# inactive cart
inactive_cart = Cart.find_or_create_by!(state: 'inactive', user: angela)
Item.find_or_create_by!(quantity: 2, book: more_python, cart: inactive_cart)

# current active cart
active_cart = Cart.find_or_create_by!(state: 'active', user: angela)
Item.find_or_create_by!(quantity: 2, book: docker, cart: active_cart)
Item.find_or_create_by!(quantity: 2, book: inner, cart: active_cart)
Item.find_or_create_by!(quantity: 2, book: more_python, cart: active_cart)


# Another User: mike
mike = User.find_or_create_by!(email: 'mike@rivers.com', first_name: 'Mike', last_name: 'Rivers')
