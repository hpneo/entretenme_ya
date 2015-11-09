class Content < ActiveRecord::Base
	has_many :comments
	has_many :reviews

  ratyrate_rateable "score"

  TYPES = [ 'movie', 'tv_show', 'videogame' ]

  def self.search(term, content_type = :movie)
    content_type = content_type.to_s.to_sym

    case content_type
      when :movie
        Tmdb::Movie.find(term).map { |movie|
          if movie.poster_path.present?
            Content.where(remote_id: movie.id, content_type: 'movie').first_or_create do |content|
              content.name = movie.original_title
              content.year = movie.release_date.to_s.split('-').first
              content.description = movie.overview
              content.poster = [TMDB_CONFIGURATION[:base_url], TMDB_CONFIGURATION[:poster_sizes].last, movie.poster_path].join
              content.content_type = 'movie'
              content.remote_id = movie.id
            end
          end
        }.compact
      when :tv_show
        Tmdb::TV.find(term).map { |tv_show|
          if tv_show.poster_path.present?
            Content.where(remote_id: tv_show.id, content_type: 'tv_show').first_or_create do |content|
              content.name = tv_show.original_name
              content.year = tv_show.first_air_date.to_s.split('-').first
              content.description = tv_show.overview
              content.poster = [TMDB_CONFIGURATION[:base_url], TMDB_CONFIGURATION[:poster_sizes].last, tv_show.poster_path].join
              content.country = tv_show.origin_country.first
              content.content_type = 'tv_show'
              content.remote_id = tv_show.id
            end
          end
        }.compact
      when :videogame
        search = GiantBomb::Search.new
        search.limit(16)
        search.resources('game')
        search.query(term)
        search.fetch.map { |videogame|
          videogame = GiantBomb::Game.new(videogame)

          if videogame.image && (videogame.image['super_url'] || videogame.image['medium_url'])
            Content.where(remote_id: videogame.id, content_type: 'videogame').first_or_create do |content|
              content.name = videogame.name
              content.year = videogame.original_release_date.to_s.split('-').first
              content.description = videogame.description
              content.poster = videogame.image['super_url'] || videogame.image['medium_url']
              content.content_type = 'videogame'
              content.remote_id = videogame.id
            end
          end
        }.compact
    end
  end
end