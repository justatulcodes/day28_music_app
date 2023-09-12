import 'package:day28_music_app/data/sample_data.dart';
import 'package:day28_music_app/data/values.dart';
import 'package:day28_music_app/widgets/image_view.dart';
import 'package:day28_music_app/widgets/text.dart';
import 'package:flutter/material.dart';

Widget songListItem(BuildContext context, SampleMusicData song) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: customImageView(song.albumCoverAddress, 10, 0, 45),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customText(song.singer, 14, midGrey),
            const SizedBox(
              height: 6,
            ),
            customText(
                song.songName.toUpperCase(), 17, primaryDark, FontWeight.bold)
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: midGrey,
              size: 25,
            ))
      ],
    ),
  );
}
