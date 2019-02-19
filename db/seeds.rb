# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(
	[
	  {:category_name => 'Photo'},
	  {:category_name => 'Style'},
	  {:category_name => 'Building'},
	  {:category_name => 'Science'},
	  {:category_name => 'Nature'},
	  {:category_name => 'Media'},
	  {:category_name => 'Food'},
	  {:category_name => 'Animal'},
	  {:category_name => 'Comics'},
	  {:category_name => 'Picture'},
	  {:category_name => 'CG'},
	]
)

Size.create(
	[
	  {:size => "A4",:price => '280'},
	  {:size => "B4",:price => '1120'},
	  {:size => "A3",:price => '1150'},
	  {:size => "B3",:price => '1390'},
	  {:size => "A2",:price => '950'},
	  {:size => "B2",:price => '1690'},
	  {:size => "A1",:price => '1990'},
	  {:size => "B1",:price => '2790'},
	  {:size => "ポストカード", :price => '820', :quantity => '9'},
	]
)