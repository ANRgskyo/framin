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
	  {:size => "150mm×150mm",:price => '400'},
	  {:size => "200mm×200mm",:price => '510'},
	  {:size => "250mm×250mm",:price => '640'},
	  {:size => "300mm×300mm",:price => '800'},
	  {:size => "350mm×350mm",:price => '970'},
	  {:size => "400mm×400mm",:price => '1100'},
	  {:size => "450mm×450mm",:price => '1300'},
	  {:size => "500mm×500mm",:price => '1500'},
	  {:size => "ポストカード", :price => '820', :quantity => '9'},
	]
)