require('pg')
require_relative('album')
require_relative('../db/sql_runner')

class Artist
    attr_reader :id, :name

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
        return artists_array.map 
    end
    # order_hashes = SqlRunner.run(sql)
    # orders = order_hashes.map { |order| PizzaOrder.new( order ) }
  
end