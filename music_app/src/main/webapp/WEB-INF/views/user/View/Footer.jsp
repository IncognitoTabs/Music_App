<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
</head>
<body>


	<div class="footer">
		<!-- info song -->
		<div class="info-music">
			<div class="info-form">
				<img src="https://upload.wikimedia.org/wikipedia/commons/c/ca/CD-ROM.png" alt="">
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
			<!-- <div class="folder-music">
            <div class="now-time">00:00</div>
            <div class="play-input">
                <input type="range" min="1" max="100" value="0" class="play-change" onchange="seekTo()">
			</div>
            <div class="final-time">00:00</div>
        </div> -->

		</div>
		<!-- change volume -->
		<div class="volume-music">
			<i class="bi bi-volume-down-fill volume-music-icon"></i> <i
				class="fa-solid fa-volume-xmark none-btn"></i> <input type="range"
				min="0" max="100" value="99" class="volume_slider"
				onchange="setVolume()">
			<!-- ////// -->
			<!-- <i class="fa fa-volume-down"></i>
            <input type="range" min="1" max="100" value="99" class="volume_slider" onchange="setVolume()">
            <i class="fa fa-volume-up"></i> -->
			<span></span> <i class="fa-solid fa-download icon-download"></i>
		</div>
	</div>

</body>
</html>