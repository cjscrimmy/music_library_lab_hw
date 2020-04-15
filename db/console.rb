require('pry')
require_relative('../models/album')
require_relative('../models/artist')
require_relative('sql_runner')

artist1 = Artist.new({'name' => 'Bob Dylan'})
artist2 = Artist.new({'name' => 'Rolling Stones'})
artist1.save()
artist2.save()

album1 = Album.new({'title' => 'Desire', 'genre' => 'folk', 'artist_id' => artist1.id})
album1.save()

album2 = Album.new({'title' => 'Blonde on Blonde', 'genre' => 'folk', 'artist_id' => artist1.id})
album2.save()

album3 = Album.new({'title' => '40 Licks', 'genre' => 'rock', 'artist_id' => artist2.id})
album3.save()

binding.pry
nil