# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# require 'uri'
# OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
# OpenURI::Buffer.const_set 'StringMax', 0

# User.destroy_all
# Item.destroy_all

# puts 'Start kickflip seeding'

# # ---Users for Demo------------------------------------------

# dion = User.create!(email: 'dion@gmail.com', password: '123456')
# marcel = User.create!(email: 'marcel@gmail.com', password: '123456')
# nikos = User.create!(email: 'nikos@gmail.com', password: '123456')




# # ---Obstacles for Demo-----------------------------------------
# small_ramp = Item.create!(size: '8.25', condition: 'new', brand: 'real', category: 'Board', price: 10, user: dion, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend this obstacle.', location: 'Berlin')


# curb_kings = Item.create!(size: '8.1', condition: 'used', brand: 'girl', category: 'Trucks', price: 102, user: dion, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend this obstacle.', location: 'Vienna')

# kinked_handrail = Item.create!(size: '55mm', condition: 'new', brand: 'baker', category: 'Wheels', price: 10, user: marcel, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend this obstacle.', location: 'Paris')

# two_way_skate_ramp = Item.create!(size: 'normal', condition: 'new', brand: 'diamond', category: 'Hardware', price: 24, user: marcel, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend this obstacle.', location: 'Paris')

# flat_spot_rail =  Item.create!(size: '7.5', condition: 'new', brand: 'baker', category: 'Board', price: 130, user: nikos, description: 'This is my go-to obstacle when trying out new tricks. Can highly recommend this obstacle.', location: 'London')


# url_small_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/c_fit,h_2696/v1614261681/shawn-D2CXn1266-E-unsplash_osbapv.jpg'
# filename = File.basename(URI.parse(url_small_ramp).path)
# file = URI.open(url_small_ramp)
# small_ramp.photo.attach(io: file, filename: filename)
# small_ramp.save!

# url_curb_kings = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614184258/1tucroxmjup81rp2vpadxp724kt2.jpg'
# filename = File.basename(URI.parse(url_curb_kings).path)
# file = URI.open(url_curb_kings)
# curb_kings.photo.attach(io: file, filename: filename)
# curb_kings.save!

# url_kinked_handrail = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/handrail_lpymo4.jpg'
# filename = File.basename(URI.parse(url_kinked_handrail).path)
# file = URI.open(url_kinked_handrail)
# kinked_handrail.photo.attach(io: file, filename: filename)
# kinked_handrail.save!

# url_two_way_skate_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/2-way_Skate_Ramp_cggiim.jpg'
# filename = File.basename(URI.parse(url_two_way_skate_ramp).path)
# file = URI.open(url_two_way_skate_ramp)
# two_way_skate_ramp.photo.attach(io: file, filename: filename)
# two_way_skate_ramp.save!

# url_four_way_skate_ramp = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/4-way_skate_ramp_zzibj3.jpg'
# filename = File.basename(URI.parse(url_four_way_skate_ramp).path)
# file = URI.open(url_four_way_skate_ramp)
# four_way_skate_ramp.photo.attach(io: file, filename: filename)
# four_way_skate_ramp.save!

# url_flat_spot_rail = 'https://res.cloudinary.com/diopgwo4d/image/upload/v1614260045/flat_spot_rail_bbo3ul.jpg'
# filename = File.basename(URI.parse(url_flat_spot_rail).path)
# file = URI.open(url_flat_spot_rail)
# flat_spot_rail.photo.attach(io: file, filename: filename)
# flat_spot_rail.save!




# puts 'All done, enjoyy'
