require('pg')
require_relative('album')
require_relative('../db/sql_runner')

class Artist
    attr_reader :id
    attr_accessor :name

    def initialize( options )
        @id = options['id'].to_i if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO artists
        (name)
        VALUES
        ($1)
        RETURNING *"
        values = [@name]
        @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    def self.all()
        sql = "SELECT * FROM artists"
        artists_array = SqlRunner.run(sql)
        return artists_array.map { |artist| Artist.new(artist) }
    end
    
    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        album_hashes = SqlRunner.run(sql, values)
        album_objects = album_hashes.map { |album_hash| Album.new(album_hash) }
        return album_objects
      end

    def update()
        sql = "UPDATE artists SET name = $1 WHERE id = $2"
        values =[@name, @id]
        SqlRunner.run(sql, values)
    end
end