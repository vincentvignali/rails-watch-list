# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
# db/seeds.rb


# require 'faker'
# puts 'Creating 100 fake restaurants...'
# 100.times do
#   movie = Movie.new(
#     title: Faker::Movie.title.to_s,
#     overview: Faker::Movie.quote.to_s
#   )
#   movie.save!
#   puts 'Finished!'
# end
# puts 'Seed Finished!'

require 'json'
require 'open-uri'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
data_serialized = URI.open(url).read
movies = JSON.parse(data_serialized)

movies['results'].each do |movie|
  new_movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
  puts new_movie
end
