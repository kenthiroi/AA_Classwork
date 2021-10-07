# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Artwork.destroy_all

User.create([
  { username: 'Kento' },
  { username: 'Abrabra' },
  { username: 'Sea Drake' } 
])

Artwork.create([
  { artist_id: 1, title: 'Ooga booga', image_url: 'fgjehhnx'},
  { artist_id: 2, title: 'Untitled', image_url: 'tdhjgdne' },
  { artist_id: 3, title: 'Gigguhs in the chat', image_url: 'et3hjg4r' }
])