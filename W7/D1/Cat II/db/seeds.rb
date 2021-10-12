# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.create(birth_date: Date.new(2014, 4, 5), color: 'orange', name: 'Orange', sex:"F")
Cat.create(birth_date: Date.new(2010, 2, 3), color: 'black', name:'Black', sex:"M")
Cat.create(birth_date: Date.new(2017, 12, 14), color: 'white', name:'Snow White',sex: "M")
Cat.create(birth_date: Date.new(2018, 6, 21), color: 'brown', name:'Fox',sex: "F")
Cat.create(birth_date: Date.new(2020, 1, 1), color:'black', name:'New Year',sex: "M")


