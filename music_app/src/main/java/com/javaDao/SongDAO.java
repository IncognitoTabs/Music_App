package com.javaDao;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.google.gson.Gson;

import com.javaDTO.Song;

public class SongDAO {
    public static List<Song> querySong(Connection conn) throws SQLException {
        String sql = "Select a.id_song, a.name_song,a.id_singer,a.id_album,a.id_genre from song a";

        PreparedStatement pstm = conn.prepareStatement(sql);

        ResultSet rs = pstm.executeQuery();
        List<Song> list = new ArrayList<Song>();
        while (rs.next()) {
            String id = rs.getString("id_song");
            String name = rs.getString("name_song");
            String idSinger = rs.getString("id_singer");
            String idAlbum = rs.getString("id_album");
            String idGenre = rs.getString("id_genre");
            Song song = new Song();
            song.setId(id);
            song.setName(name);
            song.setIdSinger(idSinger);
            song.setIdAlbum(idAlbum);
            song.setIdGenre(idGenre);
            list.add(song);
        }
        return list;
    }

    public static void addSong(Connection conn, Song song, InputStream is, InputStream is1) throws SQLException {
        String sql = "Insert into song(name_song,picture_song,id_singer,id_album,id_genre,data_song) values (?,?,?,?,?,?)";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, song.getName());
        pstm.setBlob(2, is);
        pstm.setString(3, song.getIdSinger());
        pstm.setString(4, song.getIdAlbum());
        pstm.setString(5, song.getIdGenre());
        pstm.setBlob(6, is1);
        pstm.executeUpdate();
    }

    public static void updateSong(Connection conn, Song song, InputStream is, InputStream is1) throws SQLException {
        String sql = "Update song set name_song=?, picture_song=?,id_singer=?,id_album=?,id_genre=?,data_song=? where id_song=? ";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, song.getName());
        pstm.setBlob(2, is);
        pstm.setString(3, song.getIdSinger());
        pstm.setString(4, song.getIdAlbum());
        pstm.setString(5, song.getIdGenre());
        pstm.setBlob(6, is1);
        pstm.setString(7, song.getId());
        pstm.executeUpdate();
    }

    public static Song findSong(Connection conn, String id) throws SQLException {
        String sql = "Select a.id_song, a.name_song,a.id_singer,a.id_album,a.id_genre from song a where a.id_song=?";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name_song");
            String idSinger = rs.getString("id_singer");
            String idAlbum = rs.getString("id_album");
            String idGenre = rs.getString("id_genre");
            Song song = new Song();
            song.setId(id);
            song.setName(name);
            song.setIdSinger(idSinger);
            song.setIdAlbum(idAlbum);
            song.setIdGenre(idGenre);
            return song;
        }
        return null;
    }

    // lấy dư lieu lên từ csdl: ? chuyển thành base64 file mp3 và img cho nó hiện
    // lên dc
    public static List<Song> findSongByIdAlbum(Connection conn, String id) throws SQLException {
        String sql = "Select a.id_song, a.name_song, a.picture_song, b.name_albums, c.name_singer from song a\r\n"
                + "                inner join singer c ON a.id_singer = c.id_singer\r\n"
                + "                inner join album b on a.id_album = b.id_album\r\n"
                + "                where b.id_album = ?";

        // System.out.println("find son by id");
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();
        // System.out.println("find son by id");
        List<Song> list = new ArrayList<Song>();
        // System.out.println("find son by id");
        while (rs.next()) {

            String id_song = rs.getString("id_song");

            String name = rs.getString("name_song");

            String name_singer = rs.getString("name_singer");

            String name_album = rs.getString("name_albums");

            // picture, song_data,
            // get picture and convert it
            Blob blob = rs.getBlob("picture_song");
            byte[] picture_data = null;
            String image_base64 = "";
            if (blob != null) {

                int blobLength = (int) blob.length();
                picture_data = blob.getBytes(1, blobLength);
                image_base64 = Base64.getMimeEncoder().encodeToString(picture_data);
                // release the blob and free up memory. (since JDBC 4.0)
                blob.free();
            }

            Song song = new Song();
            song.setId(id_song);
            song.setName(name);
            song.setImage_base64(image_base64);
            song.setName_singer(name_singer);
            list.add(song);
        }
//      
//        JSONArray jsonArray = new JSONArray(list);
//        System.out.println(jsonArray);
        System.out.println("Song Dao JSon");
        try {
             String json = new Gson().toJson(list);
        
//        String songJsonstring = (list);
        System.out.println("Song Dao JSon");
        System.out.println(json);
        }
        catch(Exception e) {
            System.out.println(e);
        }
       
//        if (list != null) {
//            System.out.println("find son by id");
//        }

        return list;
    }

    // lay du lieu bai hat
    public static Song getDataSong(Connection conn, String id) throws SQLException {
        String sql = "select data_song from song where id_song = '?'";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();

        // get song_data and convert it
        Blob data_song_blob = rs.getBlob("a.data_song");
        // (assuming you have a ResultSet named RS)

        int blobLength_song = (int) data_song_blob.length();
        byte[] data_song = data_song_blob.getBytes(1, blobLength_song);

        // release the blob and free up memory. (since JDBC 4.0)
        data_song_blob.free();

        Song song = new Song();
        song.setData_song(data_song);
        return song;

    }

    public static List<Song> findSongAlbum(Connection conn, String id) throws SQLException {
        String sql = "Select a.id_song, a.name_song,a.id_singer,a.id_album,a.id_genre from song  where a.id_album=?";
        List<Song> list = new ArrayList<Song>();
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, id);
        ResultSet rs = pstm.executeQuery();

        while (rs.next()) {
            String name = rs.getString("name_song");
            String idSinger = rs.getString("id_singer");
            String idAlbum = rs.getString("id_album");
            String idGenre = rs.getString("id_genre");
            Song song = new Song();
            song.setId(id);
            song.setName(name);
            song.setIdSinger(idSinger);
            song.setIdAlbum(idAlbum);
            song.setIdGenre(idGenre);
            list.add(song);
        }
        return list;
    }

//    public static Song findsongId(Connection conn, String name) throws SQLException {
//        String sql = "Select a.id_song, a.name_song, a.picture_song from song a where a.name_song=?";
//
//        PreparedStatement pstm = conn.prepareStatement(sql);
//        pstm.setString(1, name);
//        ResultSet rs = pstm.executeQuery();
//
//        while (rs.next()) {
//            String  id= rs.getString("id_song");
//            Song song = new Song(id,name);
//            return song;
//        }
//        return null;
//    }
    public static void deleteSong(Connection conn, String id) throws SQLException {
        String sql = "Delete From song where id_song= ?";

        PreparedStatement pstm = conn.prepareStatement(sql);

        pstm.setString(1, id);

        pstm.executeUpdate();
    }
}
