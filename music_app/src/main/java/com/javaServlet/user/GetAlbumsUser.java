package com.javaServlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Base64;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.javaDTO.Album;

import com.javaDao.AlbumDAO;
import com.javaDao.MyUtils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/getAlbumUser")
public class GetAlbumsUser extends HttpServlet {

    public GetAlbumsUser() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(req);
        String id_album = req.getParameter("id_album");
        //String id_album = "01";
        Album album = null;

        try {
            album = AlbumDAO.findAlbumByIdUser(conn, id_album);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

//        byte[] bytes = Files.readAllBytes(Paths.get(path5));
      
            
      //  System.out.println("Get album user");
        
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
               
        if (album != null) {
            //System.out.println("album " + album.getId() + " " + album.getName() + " " + album.getImage_base64());;
           
            // System.out.println("Json: " +  new Gson().toJson("hello"));
            
            String albumJsonString = album.toString();// new Gson().toJson("hello");
            
//            ObjectMapper mapper = new ObjectMapper();  
//            System.out.println("Json: " + mapper.writeValueAsString(album)); 
            
           // System.out.println("Convert json");
            
            out.print(""+ albumJsonString + "");
        }

        else {
            out.print("null");
            
        }
       
    }
}
