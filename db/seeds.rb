require 'json'
require 'open-uri'

response = URI.open("https://tmdb.lewagon.com/movie/top_rated?page=1").read
repos = JSON.parse(response)['results']

repos.each do |repo|
  movie = Movie.new(
    title: repo['original_title'],
    overview: repo['overview'],
    rating: repo['vote_average']
  )
  movie.save!
end
