
const songList = [
    {
        name: "Dau nho",
        singer: "Den Vau",
        duration: 3,
        dateAdded: "6p",
        album: "Lon xon"
    },
 
]



const songIdList = document.getElementById("song-list")

// window.addEventListener("DOMContentLoaded", async() => {
    
//     const songListId = songList.map(song => `
//     <div class="list-item">
//     <!-- list item -->
//     <div class="list__id ">
//     <p>1</p>
//         <i class="fa-solid fa-play list-play-music"></i>
//         <i class="fa-solid fa-pause list-pause-music"></i>
//     </div>

//     <div class="list__title">
//         <img src="../image/den1.jpg" alt="" class="list__title-avatar">
//         <div class="list__title-name-song">
//         <div class="list__title-song">
//             <a href="" class="list__title-link-song"><span>${song.name}</span> </a>
//         </div>
//         <div class="list__title-singer">
//             <a href="" class="list__title-link-singer"><span>${song.singer}</span></a>
//         </div>
//         </div>
//     </div>
//     <div class="list__album">
//         <a href="" class="list__album-name"><span>${song.album}</span></a>
//     </div>
//     <div class="list__dateAdd">
//         <p class="list__dateAdd-date">${song.dateAdded}</p>
//     </div>
//     <div class="list__time">
//         <p class="list__time-time-song">${song.duration}</p>
//     </div>
// </div>
//     `).join('')

//     songElementList.innerHTML = songListId
// })

const footer = document.querySelector('.footer')
const songName = footer.querySelector('.info-form__name h5')
const songSinger = footer.querySelector('.info-form__name p')
const songImage = footer.querySelector('.info-form img')

const songLastDuration = footer.querySelector('.final-time span')
const songElementList = songIdList.querySelectorAll('.list-item')


songElementList.forEach(song => {
    song.addEventListener('click', (e) => {
        resetClassSongItem()
        
        const listItem = e.currentTarget
        const songNameItem = listItem.querySelector('.list__title-link-song span')
        const songSingerItem = listItem.querySelector('.list__title-link-singer span')
        const songImageItem = listItem.querySelector('.list__title-avatar')
        const songDurationItem = listItem.querySelector('.list__time-time-song')
        songName.innerHTML = songNameItem.textContent
        songSinger.innerHTML = songSingerItem.textContent
        songImage.src = songImageItem.src


        songLastDuration.innerHTML = songDurationItem.textContent

        
        listItem.classList.add('active')
    })
})

function resetClassSongItem(){
    songElementList.forEach( function(song) {
        song.classList.remove('active')
    })
}

