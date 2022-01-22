SELECT 
    COUNT(songs.songs_id) AS 'cancoes',
    COUNT(DISTINCT albums.albums_id) AS 'albuns',
    COUNT(DISTINCT artists.artists_id) AS 'artistas'
FROM
    SpotifyClone.songs AS songs
    INNER JOIN
    SpotifyClone.albums AS albums ON songs.id_album = albums.albums_id
    INNER JOIN
    SpotifyClone.artists AS artists ON albums.id_author = artists.artists_id;
