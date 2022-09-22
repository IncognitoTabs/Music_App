
const songList = [
    
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },
    {
        name: "Dau nho",
        singer: "Den Vau",
        album: "Lon xon",
        dateAdded: "6 day ago",
        duration: 3
    },

]

const songIdList = document.getElementById("song-list")



const btnSeeMore = document.querySelector('.btn-see-more')

const footer = document.querySelector('.footer')
const songName = footer.querySelector('.info-form__name h5')
const songSinger = footer.querySelector('.info-form__name p')
const songImage = footer.querySelector('.info-form img')

const songLastDuration = footer.querySelector('.final-time span')
const songElementList = document.querySelectorAll('.list-item')


// songElementList.forEach(song => {
//     song.addEventListener('click', (e) => {
//         resetClassSongItem()
        
//         const listItem = e.currentTarget
//         const songNameItem = listItem.querySelector('.list__title-link-song span')
//         const songSingerItem = listItem.querySelector('.list__title-link-singer span')
//         const songImageItem = listItem.querySelector('.list__title-avatar')
//         const songDurationItem = listItem.querySelector('.list__time-time-song')
//         songName.innerHTML = songNameItem.textContent
//         songSinger.innerHTML = songSingerItem.textContent
//         songImage.src = songImageItem.src


//         songLastDuration.innerHTML = songDurationItem.textContent

        
//         listItem.classList.add('active')
//     })
// })



function truncate(text, number){
    if(!text) return ''
    const limitText = text.split(' ').length
    console.log(limitText, number)
    
    return limitText > number ? `${text.split(' ').filter(x => !!x && x.length >= 1).slice(0, number).join(' ')}...` : text
}

window.addEventListener('DOMContentLoaded', function(){
    const songListElement = songList.slice(0, 5).map((song, index) => 
    `<div class="list-item" data-id="${index}">
    <!-- list item -->
    <div class="list__id ">
        <p>1</p>
        <i class="fa-solid fa-play list-play-music"></i>
        <i class="fa-solid fa-pause list-pause-music"></i>
    </div>

    <div class="list__title">
        <img src="../image/den1.jpg" alt="" class="list__title-avatar">
        <div class="list__title-name-song">
        <div class="list__title-song">
            <a href="" class="list__title-link-song"><span>${truncate(song.name, 7)}</span> </a>
        </div>
        <div class="list__title-singer">
            <a href="" class="list__title-link-singer"><span>${song.singer}</span></a>
        </div>
        </div>
    </div>
    <div class="list__album">
        <a href="" class="list__album-name"><span>${song.album}</span></a>
    </div>
    <div class="list__dateAdd">
        <p class="list__dateAdd-date">${song.dateAdded}</p>
    </div>
    <div class="list__time">
        <p class="list__time-time-song">${song.duration}</p>
    </div>
    </div>`).join('\n')

    // console.log(songListElement)

     songIdList.innerHTML = songListElement
})

if(btnSeeMore){
    btnSeeMore.addEventListener('click', function(e){
        const limitSong = btnSeeMore.textContent === 'SEE MORE' ? 100 : 5
        const songListElement = songList.slice(0 , limitSong).map((song, index) => 
        `<div class="list-item" data-id="${index}">
    <!-- list item -->
    <div class="list__id ">
        <p>1</p>
        <i class="fa-solid fa-play list-play-music"></i>
        <i class="fa-solid fa-pause list-pause-music"></i>
    </div>

    <div class="list__title">
        <img src="../image/den1.jpg" alt="" class="list__title-avatar">
        <div class="list__title-name-song">
        <div class="list__title-song">
            <a href="" class="list__title-link-song"><span>${truncate(song.name, 6)}</span> </a>
        </div>
        <div class="list__title-singer">
            <a href="" class="list__title-link-singer"><span>${song.singer}</span></a>
        </div>
        </div>
    </div>
    <div class="list__album">
        <a href="" class="list__album-name"><span>${song.album}</span></a>
    </div>
    <div class="list__dateAdd">
        <p class="list__dateAdd-date">${song.dateAdded}</p>
    </div>
    <div class="list__time">
        <p class="list__time-time-song">${song.duration}</p>
    </div>
    </div>`).join('\n')


     songIdList.innerHTML = songListElement

     if(btnSeeMore.textContent === 'SEE MORE'){
        btnSeeMore.innerHTML = 'SHOW LESS'
    } else{
         btnSeeMore.innerHTML = 'SEE MORE'
     }
    })
}

let songIndex = 0

songIdList.addEventListener('click', e => {
    const songElement =  songIdList.querySelectorAll('.list-item')
  
    function resetClassSongItem(){
        songElement.forEach( function(song) {
            song.classList.remove('active')
        })
    }

    songElement.forEach(song => {
        song.addEventListener('click', (e) => {
            const index = e.currentTarget.dataset.id
            songIndex = Number.parseInt(index)
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
})

const btnNext = document.querySelector('.next-music')
btnNext.addEventListener('click', () => {
    console.log(songIndex + 1)
})




