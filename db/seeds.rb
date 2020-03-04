# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "Marucci AP5 Albert Pujols Custom Pro Maple Bat", price: 169, image_url: "https://dks.scene7.com/is/image/GolfGalaxy/19MCCACSTMP5PRMDLWBT_Custom?wid=685&fmt=jpg", description: "Inspired by the core design used by one of the game’s greatest sluggers, the Marucci® AP5 Albert Pujols Custom Pro Maple Bat lays down the foundation for powerful performance at the plate while you personalize a number of key details for a completely unique experience. This bat is bone-rubbed to deliver a denser, more durable design, and offers an end-loaded feel to bolster the impact of your swing to send the ball sailing.")

product.save
