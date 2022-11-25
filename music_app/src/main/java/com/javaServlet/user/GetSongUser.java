package com.javaServlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import java.util.List;

import com.google.gson.Gson;
import com.javaDTO.Song;

import com.javaDao.MyUtils;

import com.javaDao.SongDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/getSongUser")
public class GetSongUser extends HttpServlet {
//    private Gson gson = new Gson();

    // Tra ve danh sach bai hat cho footer MusicInfo.jsp
    // Tra về hình ảnh cho UI,
    
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        Connection conn = MyUtils.getStoredConnection(req);

         String id_album = req.getParameter("id").trim();

     //   String id_album = "11";
        List<Song> listSong = null;
        
        try {
            listSong = SongDAO.findSongByIdAlbum(conn, id_album);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/text");
        resp.setCharacterEncoding("UTF-8");
         String songJsonString = "";
         int count = 0;
         int sizelist  = listSong.size();
        
     //     JSONArray jsonarr = new JSONArray();
           System.out.println("Song getting");
        for (Song song : listSong) {
            System.out.println(song.toString());
            songJsonString +=song.toString();
            count ++;
            if(count < sizelist) {
                 songJsonString +=",";
            }
           // jsonarr.put(song);
           
        }
      
        Song song = new Song();
       // Gson gson = new Gson();
        
        // String songJsonString = new Gson().toJson(listSong);
       System.out.println("Song getting");
//       System.out.println(jsonarr);
        out.print("["+songJsonString+"]");
        
        out.print(song.toJson());
//        out.print("{adadad: gfsfgsfsdf}");
//       out.print(jsonarr);
    }

}
