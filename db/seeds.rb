# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  art = Category.create(name: 'Art', thumburl: 'http://upload.wikimedia.org/wikipedia/commons/e/eb/144-la_fuente_de_Monforte_V.jpg')
  home_and_living = Category.create(name: 'Home & Living', thumburl: 'http://ihomedecorsideas.com/wp-content/uploads/2014/04/diy_network_homemade_coat_rack_.jpg')
  jewelry = Category.create(name: 'Jewelry', thumburl: 'http://upload.wikimedia.org/wikipedia/commons/f/ff/Midyat_Silver_Jewelry_1310103_Nevit.jpg')
  women = Category.create(name: 'Women', thumburl: 'https://c1.staticflickr.com/9/8255/8660920433_57a184d9d1_z.jpg')
  men = Category.create(name: 'Men', thumburl: 'http://upload.wikimedia.org/wikipedia/commons/d/d5/Fullbrogue_(Grenson).jpg')
  kids = Category.create(name: 'Kids', thumburl: 'http://upload.wikimedia.org/wikipedia/commons/e/e0/Artist%27s_Paint_Brushes_Adapted_With_Photoshop._Surrey_UK.jpg')
  vintage = Category.create(name: 'Vintage', thumburl: 'https://c2.staticflickr.com/8/7402/9426557291_139134efaa_z.jpg')
  weddings = Category.create(name: 'Weddings', thumburl: 'http://hostingessence.com/wp-content/uploads/2012/04/green-wedding.jpg')
  craft_supplies = Category.create(name: "Craft Supplies", thumburl: "http://bit.ly/1w1uPow")

  # Men

  Product.create(product_name: 'Grenson Shoes', description: "Fullbrogue Grenson Shoes.", price: 105.00, thumburl: 'http://upload.wikimedia.org/wikipedia/commons/d/d5/Fullbrogue_(Grenson).jpg', category_id: men.id)
  Product.create(product_name: 'Color Fringed Scarf', description: "Men’s Fringed Scarf in Pumpkin Toffee Grey.", price: 19.99, thumburl: 'https://c2.staticflickr.com/4/3437/3832752067_c6c3631d44_z.jpg?zz=1', category_id: men.id)
  Product.create(product_name: 'Pork Pie Hat', description: "Classic Pork Pie Hat from the 1940s.", price: 110.00, thumburl: 'http://upload.wikimedia.org/wikipedia/commons/0/05/Brown_Porkpie_Hat.JPG', category_id: men.id)

  user = User.create(email: 'name@name.com', password: 'password1', password_confirmation: 'password1') 