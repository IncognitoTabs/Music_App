package com.javaDTO;

import java.util.Arrays;

import com.google.gson.Gson;

public class Song {

    private String name;
    private String idSinger;
    private String idAlbum;
    private String idGenre;
    private byte[] image;
    private byte[] data_song;
    private String name_singer;
    private String data_song_base64;
    private String image_base64;
    private String path;

    public Song(String id, String name, String idSinger, String idAlbum, String idGenre) {
        super();
        this.id = id;
        this.name = name;
        this.idSinger = idSinger;
        this.idAlbum = idAlbum;
        this.idGenre = idGenre;
    }

    public Song() {
        super();

    }

    public Song(String name, String idSinger, String idAlbum, String idGenre) {
        super();

        this.name = name;
        this.idSinger = idSinger;
        this.idAlbum = idAlbum;
        this.idGenre = idGenre;
    }

    public Song(String id, String name, String idSinger, byte[] image, byte[] data_song) {
        super();
        this.id = id;
        this.name = name;
        this.idSinger = idSinger;
        this.image = image;
        this.data_song = data_song;
    }

    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdSinger() {
        return idSinger;
    }

    public void setIdSinger(String idSinger) {
        this.idSinger = idSinger;
    }

    public String getIdAlbum() {
        return idAlbum;
    }

    public void setIdAlbum(String idAlbum) {
        this.idAlbum = idAlbum;
    }

    public String getIdGenre() {
        return idGenre;
    }

    public void setIdGenre(String idGenre) {
        this.idGenre = idGenre;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public byte[] getData_song() {
        return data_song;
    }

    public void setData_song(byte[] data_song) {
        this.data_song = data_song;
    }

    public String getName_singer() {
        return name_singer;
    }

    public void setName_singer(String name_singer) {
        this.name_singer = name_singer;
    }

    public String getData_song_base64() {
        return data_song_base64;
    }

    public void setData_song_base64(String data_song_base64) {
        this.data_song_base64 = data_song_base64;
    }

    public String getImage_base64() {
        return image_base64;
    }

    public void setImage_base64(String image_base64) {
        this.image_base64 = image_base64;
    }

    @Override
    public String toString() {
        char add = '"';
        return "{" + add + "name" + add + ":" + add + name + add +
//                ",\"image_base64\":" + "\"" +"data:image/jpg;base64,"+ image_base64 + "\"" + 
                "," + add + "name_singer" + add + ":" + add + name_singer + add +
                "," + add + "id" + add + ":" + add + id + add + "}";
    }

    public String toJson() {
        String re = new Gson().toJson("ahdaldkha");
        return re;
    }

}
