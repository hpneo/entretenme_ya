class Content < ActiveRecord::Base
	has_many :comments
	has_many :reviews

  ratyrate_rateable "score"

  TYPES = [ 'movie', 'tv_show', 'videogame' ]

  def self.search(term, content_type = :movie)
    case content_type
      when :movie
        Tmdb::Movie.find(term).map do |movie|
          Content.new({
            name: movie.original_title,
            year: movie.release_date.to_s.split('-').first,
            description: movie.overview,
            poster: [TMDB_CONFIGURATION[:base_url], TMDB_CONFIGURATION[:poster_sizes].last, movie.poster_path].join,
            content_type: 'movie',
            remote_id: movie.id
          })
        end
      when :tv_show
        Tmdb::TV.find(term).map do |tv_show|
          Content.new({
            name: tv_show.original_name,
            year: tv_show.first_air_date.to_s.split('-').first,
            description: tv_show.overview,
            poster: [TMDB_CONFIGURATION[:base_url], TMDB_CONFIGURATION[:poster_sizes].last, tv_show.poster_path].join,
            country: tv_show.origin_country.first,
            content_type: 'tv_show',
            remote_id: tv_show.id
          })
        end
      when :videogame
        GiantBomb::Game.find(term).map do |videogame|
          Content.new({
            name: videogame.name,
            year: videogame.original_release_date.to_s.split('-').first,
            description: videogame.description,
            poster: videogame.image['super_url'] || videogame.image['medium_url'],
            content_type: 'videogame',
            remote_id: videogame.id
          })
        end
    end
  end
end