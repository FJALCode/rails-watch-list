require "json"
require "open-uri"
API_URL_IMAGE = "https://image.tmdb.org/t/p/original"

movies = URI.open("https://api.themoviedb.org/3/movie/top_rated?api_key=37efc34d33f3f3178b7841d931bcbe92&language=en-US&page=1").read
movies = JSON.parse(movies)
movies["results"].each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "#{API_URL_IMAGE}#{movie["poster_path"]}",
    rating: movie["vote_average"],
  )
end
