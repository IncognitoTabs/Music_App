<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- CSS only -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">

<script src="https://kit.fontawesome.com/8e44eaf2c8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="stylesheet" href="./assets/css/base.css">

<title>Music</title>

</head>

<body>
	<div class="header">
		<div class="col-2"></div>
		<div class="col-10">
			<nav class="navbar navbar-expand-lg">
				<div class="folder-list_header collapse navbar-collapse"
					id="navbarSupportedContent">
					<!-- back next button -->

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
						<li class="nav-item"><a class="nav-link" href="HomeGuest">
								<i class="fa-solid fa-house"></i> Home
						</a></li>
						<li class="nav-item"><a class="nav-link" href="SearchGuest">
								<i class="fa-solid fa-magnifying-glass"></i> Search
						</a></li>

					</ul>

				</div>
				<div class="container__info col-10">

					<div class="header-info ">
						<img src="../image/den2.jpg" class="header-info__img">
						<p class="header-info__name">Đen</p>

					</div>

					<div class="container__info-list">
						<div class="list">
							<!-- note -->
							<div class="note-item">
								<div class="list__id">
									<p class="text-note-list">#</p>
								</div>
								<div class="list__title">
									<p class="text-note-list">Name</p>
								</div>
								<div class="list__album">
									<p class="text-note-list">Singer</p>
								</div>
								<div class="list__dateAdd">
									<p class="text-note-list">Category</p>
								</div>
							</div>
						</div>

						<!-- list song -->
						<div id="song-list">

							<!-- 	<c:forEach items="${songList}" var="song">

								<td>${song.name}</td>
								<td>${song.idSinger}</td>
								<td>${song.idGenre}</td>
								<td><a href="PlaySongGuest?id=${song.id}"
									class="btn btn-primary btn-lg active btnUpdate" role="button"
									aria-pressed="true">Play</a>
							</c:forEach>
 -->
							<c:forEach items="${songList}" var="song">
								<div class="list-item" onclick="playMusic(${song.id})">
									<div class="list__id ">
										<i class="fa-solid fa-play list-play-music"></i> <i
											class="fa-solid fa-pause list-pause-music"></i>
									</div>
									<div class="list__title">
										<img src="#" alt="Image" class="list__title-avatar">
										<div class="list__title-name-song">
											<div class="list__title-song">
												<span class="list__title-link-song">${song.name}</span>
											</div>
											<div class="list__title-singer">
												<span class="list__title-link-singer">${song.idSinger}</span>
											</div>
										</div>
									</div>
									<div class="list__album">
										<span class="list__album-name"><span>${song.idGenre}</span></span>
									</div>
									<div class="list__dateAdd">
										<p class="list__dateAdd-date">
											<a href="PlaySongGuest?id=${song.id}"
												class="btn btn-primary btn-lg active btnUpdate"
												role="button" aria-pressed="true">Play</a>
										</p>
									</div>

								</div>
							</c:forEach>
						</div>

					</div>
				</div>

			</div>

		</div>
	</div>
	<div class="footer">
		<!-- info song -->
		<div class="info-music">
			<div class="info-form">
				<img src="" alt="">
				<div class="info-form__name">
					<h5></h5>
					<p></p>
				</div>
			</div>
		</div>

		<div class="play-music">

			<div class="play-lists">
				<!-- phat ngau nhien -->
				<div class="shuffle-music">
					<i class="fa-solid fa-shuffle shuffle-music-icon"></i>
				</div>
				<!-- quay lai bai truoc -->
				<div class="back-music">
					<i class="fa-solid fa-backward-step back-music-icon"></i>
				</div>
				<!-- dung/ phat -->
				<div class="control-music" onclick="playpauseTrack()">
					<i class="fa-solid fa-play pause-music "></i>
					<!-- <i class="fa-solid fa-play pause-music none-btn"></i>
					<i class="fa-solid fa-pause"></i> -->
				</div>
				<!-- bai tiep theo -->

				<div class="next-music">
					<i class="fa-solid fa-forward-step next-music-icon"></i>
				</div>
				<!-- lap lai : 1 bai -->
				<div class="repeat-music">
					<i class="fa-solid fa-repeat repeat-music-icon"></i>
				</div>
			</div>
			<div class="folder-music">
				<div class="now-time"> 
					<span>00:00</span>
				</div>
				<div>
					<input type="range" min="0" max="100" value="0" class="seek_slider"
						onchange="seekTo()">
				</div>
				<div class="final-time">
					<span>00:00</span>
				</div>
			</div>

		</div>
		<!-- change volume -->
		<div class="volume-music">
			<i class="bi bi-volume-down-fill volume-music-icon"></i> <i
				class="fa-solid fa-volume-xmark none-btn"></i> <input type="range"
				min="0" max="100" value="99" class="volume_slider"
				onchange="setVolume()"> <span></span> <i
				class="fa-solid fa-download icon-download"></i>
		</div>
	</div>


	<script src="./js/users.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>

</body>

</html>