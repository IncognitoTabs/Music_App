<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <script src="https://kit.fontawesome.com/8e44eaf2c8.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./assets/css/style.css">
   

    <title>Music</title>
</head>

<body>
    <div class="header">
        <div class="col-2"></div>
        <div class="col-10">
            <nav class="navbar navbar-expand-lg">
                <div class="folder-list_header collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- back next button -->
                    <div class="navbar-nav me-auto mb-2 mb-lg-0 control-b-n">
                        <a class="back-next--button" href="#"><i class="fa-solid fa-chevron-left"></i></a>
                        <a class="back-next--button" href="#"><i class="fa-solid fa-chevron-right"></i></a>
                    </div>
                    <!-- Dropdownn -->
          
                   <div class="dropdown">
                       <button class="btn btn-secondary dropdown-toggle" type="button" 
                        id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Admin 
                        </button>
                         
                          <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                         
                            <li><a class="dropdown-item" href="AddSong">Add Music</a></li>
                            <li> <a class="dropdown-item" href="AddAlbum">Add Album</a></li>
                            <li> <a class="dropdown-item" href="AddSinger">Add Singer</a></li>
                            <li><a class="dropdown-item" href="GetSong">Song Manager</a></li>
                            <li> <a class="dropdown-item" href="GetAlbum">Album Manager</a></li>
                            <li> <a class="dropdown-item" href="#">Log Out</a></li>
                          </ul>
                        
                        </div>
                          
                    
                </div>
            </nav>
        </div>
    </div>
        <div class="container-fluid">
        <div class="main">
            <div class="row">
                <div class="menu-bar col-2">
                    <div class="navbar-nav me-auto mb-2 mb-lg-0">
                        <div class="title-app">
                            <p>Music</p>
                        </div>
                    </div>
                    <!-- nemu bar -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="HomeAdmin">
                                <i class="fa-solid fa-house"></i>
                                Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Search">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                Search
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./pages/music-category.html">
                                <i class="bi bi-music-note-list margin-top"></i>
                                My Album
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AddSong">
                                <i class="bi bi-plus-circle-fill"></i>    
                                Add Music
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AddAlbum">
                                <i class="bi bi-journal-plus"></i>    
                                Add Album
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="AddSinger">
                                <i class="bi bi-person-plus-fill"></i>    
                                Add Singer
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="GetSong">
                                <i class="bi bi-file-earmark-music-fill"></i>    
                                Song Manager
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="GetAlbum">
                                <i class="bi bi-journal-album"></i>    
                                Album Manager
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">
                                <i class="bi bi-box-arrow-left"></i>    
                                Log Out 
                            </a>
                        </li>

                    </ul>
                    
                </div>
                <div class="folder-list col-10">

                    <div class="list-items">
                        <!-- Name category vs see all music in category-->

                              <c:forEach items="${list}" var="List">
                              <div class="title-items">
                            <p>${List.nameSinger}</p>
                            <a href="#">see all</a>
                        </div>
                        <div class="row">
                            <!-- music item -->
                            <div class="col-12 col-sm-6 col-md-2 image">
                                <a href="#" class="content-items">
                                    <div class="img-size">
                                        <img src="https://t2.genius.com/unsafe/440x440/https:%2F%2Fimages.genius.com%2Fe5c77d88b77995a9aabd03caec55940c.500x500x1.jpg"
                                            alt="">
                                    </div>
                                    <h5>${List.nameAlbum}</h5>
                                    <p class="name-singer">${List.nameSinger}</p>
                                </a>
                            </div>
                         </div>
       								</c:forEach> 

                </div>
            </div>

        </div>
    </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
        crossorigin="anonymous"></script>

</body>

</html>