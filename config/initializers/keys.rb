GiantBomb::Api.key('d3a2b40d7b0c0e29a0665cdf0d53e44f898fc348')
Tmdb::Api.key('fdf3c94669f3cc0906fddc99e5cd8208')

configuration = Tmdb::Configuration.new

TMDB_CONFIGURATION = {
  base_url: configuration.base_url,
  secure_base_url: configuration.secure_base_url,
  poster_sizes: configuration.poster_sizes
}