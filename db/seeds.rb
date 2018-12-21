# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@sam = Owner.create(name: "Sam's Snacks")
@machine_1 = @sam.machines.create(location: "Don's Mixed Drinks")
@machine_2 = @sam.machines.create(location: "Turing Basement")
@machine_3 = @sam.machines.create(location: "DIA Alien Hideout")
@snack_1 = Snack.create(name: 'Snickers', price: 2, machines: [@machine_1, @machine_2])
@snack_2 = Snack.create(name: 'Mars', price: 10, machines: [@machine_1])
@snack_3 = Snack.create(name: 'Soda', price: 1, machines: [@machine_2])
@snack_4 = Snack.create(name: 'Goo', price: 7749, machines: [@machine_3])
