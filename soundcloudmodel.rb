require 'soundcloud'
require 'soundcloud-downloader'

# Ici on utilise une constante (en majuscule) car les constantes sont globales
# ce qui nous permettra d'appeler notre variable CLIENT depuis n'importe quelle méthode
CLIENT = SoundCloud.new({
  client_id: "24394cc66887d9fc3176d3de48d0bf41",
  client_secret: "3e66e99d970541afaf11a3d7d09b216b"
})


def get_artists_tracks(artist_id)
  tracks = CLIENT.get("/users/#{artist_id}/tracks")
  return tracks
end


DOWNLOADER = SoundCloud::Downloader::Client.new({
  client_id: "24394cc66887d9fc3176d3de48d0bf41",
  # Le dossier où télécharger les tracks (ex: downloads)
  path: "downloads"
})

def download_track(track_stream_url, name)
  DOWNLOADER.download(track_stream_url, { file_name: name, display_progress: true })
end