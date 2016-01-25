require 'soundcloud'
require 'awesome_print'
require "soundcloud-downloader"
require_relative './soundcloudmodel.rb'

puts "Bienvenue sur SoundCloud Download"

puts "Quel est le nom de l'artiste ?"
search = gets.chomp 
#p search



artists = CLIENT.get('/users', q: search)
artists.first["full_name"] # Nom complet du premier artiste trouvé
artists.first["id"] # ID du premier artiste trouvé
#puts artists

artist_id = artists.first["id"]

# renvoie un tableau de tracks sous form de hash
tracks = CLIENT.get("/users/#{artist_id}/tracks")

# p tracks[1] # => Un hash contenant toutes les informations sur la track
# puts tracks[2]["title"] # => Nom de la deuxième track
# puts tracks[2]["stream_url"] # => Lien à suivre pour écouter la deuxième track
# puts tracks[3]["title"] # => Nom de la troisieme track
# puts tracks[3]["stream_url"] # => Lien à suivre pour écouter la troisième track
# puts tracks[4]["title"] # => Nom de la troisième track
# puts tracks[4]["stream_url"] # => Lien à suivre pour écouter la quatrieme track
# puts tracks[5]["title"] # => Nom de la quatrieme track
# puts tracks[5]["stream_url"] # => Lien à suivre pour écouter la cinquieme track

# => On va créer une boucle pour récupérer la liste.


puts "Les Tracks:\n"

id = artist_id
tracks = get_artists_tracks(id)
tracks.each_with_index do |track, index|
  puts "#{index} - #{track["title"]}"
end

puts "Choisir un titre"
track_index = gets()
track_index = track_index.to_i

puts "Téléchargement de #{tracks[track_index]["title"]}..."
download_track(tracks[track_index]["stream_url"], tracks[track_index]["title"])

puts "\nTéléchargement terminé "