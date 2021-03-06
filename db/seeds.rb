# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require 'open-uri'

Movie.destroy_all
Bookmark.destroy_all

puts "seeding"

Movie.create(title: 'Zach Rails', overview: 'In a world full of the baddest dudes, one man will make sure they all get railed.', poster_url: 'http://coffeeguymike.com/rails.jpg', rating: 6.9)
Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)

url = 'https://tmdb.lewagon.com/movie/top_rated'
doc = URI.parse(url).open.read
movie_stuff = JSON.parse(doc)
movies = movie_stuff['results']
movies.each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}", rating: movie['vote_average'])
end
# 10.times do
#   mov = Movie.new(title: Faker::Hipster.sentence, overview: Faker::Hipster.paragraph, rating: rand(1..10).to_f)
#   puts mov.title
#   mov.save
# end

puts "seeded bro"
