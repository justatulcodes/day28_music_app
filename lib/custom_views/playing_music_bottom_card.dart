import 'package:day28_music_app/data/sample_data.dart';
import 'package:day28_music_app/data/values.dart';
import 'package:day28_music_app/widgets/text.dart';
import 'package:flutter/material.dart';

class PlayingMusicBottomCard extends StatefulWidget {
  const PlayingMusicBottomCard(
      {super.key, required this.currentSong, required this.openContainer});

  final void Function() openContainer;
  final SampleMusicData currentSong;

  @override
  State<PlayingMusicBottomCard> createState() => _PlayingMusicBottomCardState();
}

class _PlayingMusicBottomCardState extends State<PlayingMusicBottomCard> {
  var isMusicPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: primaryDark,
        height: 80,
        width: double.maxFinite,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customText(widget.currentSong.singer, 14, midGrey),
                const SizedBox(
                  height: 4,
                ),
                customText(widget.currentSong.songName.toUpperCase(), 16, white,
                    FontWeight.bold)
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                splashRadius: 0.1,
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  size: 20,
                  color: white,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    isMusicPlaying = isMusicPlaying != false;
                    debugPrint(isMusicPlaying.toString());
                  });
                },
                splashRadius: 0.1,
                padding: EdgeInsets.zero,
                icon: Icon(
                  isMusicPlaying
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 35,
                  color: white,
                )),
            IconButton(
                onPressed: () {},
                splashRadius: 0.1,
                icon: const Icon(
                  Icons.skip_next_rounded,
                  size: 20,
                  color: white,
                )),
          ],
        ));
  }
}
