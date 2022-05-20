require 'open-uri'
require 'json'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Bookmark.destroy_all
List.destroy_all
Review.destroy_all
puts 'cleaning...'

puts 'creating movies...'
url = 'http://tmdb.lewagon.com/movie/top_rated'
poster_url = 'https://image.tmdb.org/t/p/w500'
doc = JSON.parse(URI.open(url).read)
doc['results'].first(20).each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "#{poster_url}#{movie['poster_path']}")
  puts "created #{movie['title']}"
end

puts 'finito'
