package com.javaServlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaDTO.Album;
import com.javaDTO.Genres;
import com.javaDTO.Singer;
import com.javaDTO.Song;
import com.javaDao.AlbumDAO;
import com.javaDao.GenresDAO;
import com.javaDao.MyUtils;
import com.javaDao.SingerDAO;
import com.javaDao.SongDAO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/MusicInfoUser")
public class MusicInfoUser extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = MyUtils.getStoredConnection(req);
        String id_album = req.getParameter("id_album");
        Album album = null;
        try {
            album = AlbumDAO.findAlbumByIdUser(conn, id_album);
            
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        req.setAttribute("id_album", album.getId());
        req.setAttribute("name_album", album.getName());
        req.setAttribute("image_album",  "data:image/jpg;base64," + album.getImage_base64());
        RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/WEB-INF/views/user/MusicInfo.jsp");
        dispatcher.forward(req, resp);
    
    }
}
