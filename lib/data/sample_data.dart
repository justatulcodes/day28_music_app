class SampleMusicData {
  String singer;
  String songName;
  String albumCoverAddress;
  double durationInMilliseconds;

  SampleMusicData(
      {required this.singer,
      required this.albumCoverAddress,
      required this.durationInMilliseconds,
      required this.songName});
}

final songsList = [
  SampleMusicData(
    singer: "Tyler, The Creator",
    albumCoverAddress: "assets/images/cover1.png",
    durationInMilliseconds: 180000,
    songName: "Earquake",
  ),
  SampleMusicData(
    singer: "Adele",
    albumCoverAddress: "assets/images/cover2.jpeg",
    durationInMilliseconds: 240000,
    songName: "Someone You",
  ),
  SampleMusicData(
    singer: "Ed Sheeran",
    albumCoverAddress: "assets/images/cover3.jpg",
    durationInMilliseconds: 210000,
    songName: "Shape of You",
  ),
  SampleMusicData(
    singer: "Beyoncé",
    albumCoverAddress: "assets/images/cover4.jpg",
    durationInMilliseconds: 260000,
    songName: "Halo",
  ),
  SampleMusicData(
    singer: "Billie Eilish",
    albumCoverAddress: "assets/images/cover5.jpg",
    durationInMilliseconds: 200000,
    songName: "Bad Guy",
  ),
  SampleMusicData(
    singer: "Post Malone",
    albumCoverAddress: "assets/images/cover6.jpg",
    durationInMilliseconds: 190000,
    songName: "Circles",
  ),
  SampleMusicData(
    singer: "Rihanna",
    albumCoverAddress: "assets/images/cover7.jpeg",
    durationInMilliseconds: 230000,
    songName: "Diamonds",
  ),
  SampleMusicData(
    singer: "Drake",
    albumCoverAddress: "assets/images/cover8.jpg",
    durationInMilliseconds: 210000,
    songName: "God's Plan",
  ),
  SampleMusicData(
    singer: "Lady Gaga",
    albumCoverAddress: "assets/images/cover9.jpg",
    durationInMilliseconds: 180000,
    songName: "Bad Romance",
  ),
  SampleMusicData(
    singer: "Imagine Dragons",
    albumCoverAddress: "assets/images/cover10.jpg",
    durationInMilliseconds: 240000,
    songName: "Radioactive",
  ),
];
