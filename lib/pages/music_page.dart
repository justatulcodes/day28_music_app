import 'package:day28_music_app/data/sample_data.dart';
import 'package:day28_music_app/data/values.dart';
import 'package:day28_music_app/widgets/image_view.dart';
import 'package:day28_music_app/widgets/text.dart';
import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key, required this.index});
  final int index;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  format(Duration d) => d.toString().split('.').first.padLeft(4, "0");

  bool isMusicPlaying = false;
  int currentIndex = -1;
  SampleMusicData song = songsList[0];

  @override
  Widget build(BuildContext context) {
    currentIndex = currentIndex == -1 ? widget.index : currentIndex;
    song = songsList[currentIndex];

    final int minutes = song.durationInMilliseconds ~/ 60000;
    final int seconds =
        (song.durationInMilliseconds - (60000 * minutes)) ~/ 1000;
    final songLength = format(Duration(seconds: seconds, minutes: minutes));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 25,
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
              color: primaryDark,
            )),
        actions: [
          IconButton(
              onPressed: () {},
              splashRadius: 25,
              icon: const Icon(
                Icons.search,
                size: 25,
                color: primaryDark,
              ))
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(8),
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              customImageView(song.albumCoverAddress, 20, 30, 280),
              const SizedBox(
                height: 50,
              ),
              customText(song.songName, 26, primaryDark, FontWeight.bold),
              const SizedBox(
                height: 15,
              ),
              customText(song.singer, 15, midGrey, FontWeight.bold),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Row(
                  children: [
                    customText("1:56", 14, lightGrey),
                    const Spacer(),
                    customText(songLength, 14, lightGrey)
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: LinearProgressIndicator(
                  backgroundColor: lightGrey,
                  color: primaryDark,
                  value: 0.3,
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        splashRadius: 0.1,
                        icon: const Icon(
                          Icons.repeat_rounded,
                          size: 22,
                          color: lightGrey,
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            currentIndex =
                                (currentIndex - 1) % songsList.length;
                            song = songsList[currentIndex];
                          });
                        },
                        padding: EdgeInsets.zero,
                        splashRadius: 0.1,
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 40,
                          color: primaryDark,
                        )),
                    TextButton(
                        style: TextButton.styleFrom(
                            elevation: 20,
                            backgroundColor: primaryDark,
                            splashFactory: NoSplash.splashFactory,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)))),
                        onPressed: () {
                          setState(() {
                            isMusicPlaying = isMusicPlaying != true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Icon(
                            isMusicPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            currentIndex =
                                (currentIndex + 1) % songsList.length;
                            song = songsList[currentIndex];
                          });
                        },
                        splashRadius: 0.1,
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 40,
                          color: primaryDark,
                        )),
                    IconButton(
                        onPressed: () {},
                        splashRadius: 0.1,
                        icon: const Icon(
                          Icons.shuffle_rounded,
                          size: 22,
                          color: lightGrey,
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
