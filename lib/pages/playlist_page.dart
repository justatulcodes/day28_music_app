import 'package:animations/animations.dart';
import 'package:day28_music_app/custom_views/playing_music_bottom_card.dart';
import 'package:day28_music_app/custom_views/song_list_itemview.dart';
import 'package:day28_music_app/pages/music_page.dart';
import 'package:day28_music_app/data/sample_data.dart';
import 'package:day28_music_app/data/values.dart';
import 'package:day28_music_app/widgets/image_view.dart';
import 'package:day28_music_app/widgets/text.dart';
import 'package:day28_music_app/widgets/transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  bool isMusicPlaying = false;
  var currentListening = songsList[9];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    void songClicked(int index) {
      setState(() {
        currentListening = songsList[index];
      });
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0,
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
        body: Stack(children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customImageView("assets/images/artist.jpeg", 100, 20, 100),
                const SizedBox(
                  height: 30,
                ),
                customText(
                    "Tyler, The Creator", 30, primaryDark, FontWeight.bold),
                const SizedBox(
                  height: 15,
                ),
                customText("Rap, Hip-Hop", 15, midGrey, FontWeight.bold),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 12),
                          backgroundColor: primaryDark,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)))),
                      child: customText("Shuffle", 16, white, FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        onPressed: () {},
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Icon(
                                  Icons.favorite,
                                  color: primaryDark,
                                  size: 25,
                                ),
                              ),
                              customText("214", 15, midGrey, FontWeight.w500),
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ScrollConfiguration(
                          behavior: const MaterialScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                  onTap: () {
                                    songClicked(index);
                                    Navigator.push(
                                        context,
                                        UpTransition(MusicPage(
                                          index: index,
                                        )));
                                  },
                                  child:
                                      songListItem(context, songsList[index]));
                            },
                            itemCount: songsList.length,
                          ),
                        ),
                      ),
                      OpenContainer(
                        key: const Key("musicCard"),
                        closedBuilder: (_, openContainer) {
                          return PlayingMusicBottomCard(
                              openContainer: openContainer,
                              currentSong: currentListening);
                        },
                        openColor: Colors.black,
                        closedElevation: 50.0,
                        middleColor: white,
                        transitionDuration: const Duration(milliseconds: 500),
                        closedShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        closedColor: primaryDark,
                        transitionType: ContainerTransitionType.fade,
                        openBuilder: (_, closeContainer) {
                          return MusicPage(
                              index: songsList.indexOf(currentListening));
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //     alignment: Alignment.bottomCenter,
          //     child: OpenContainer(
          //       key: const Key("musicCard"),
          //       closedBuilder: (_, openContainer) {
          //         return playingMusicBottomCard(
          //             openContainer, currentListening);
          //       },
          //       openColor: Colors.black,
          //       closedElevation: 50.0,
          //       middleColor: white,
          //       transitionDuration: const Duration(milliseconds: 500),
          //       closedShape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(100),
          //       ),
          //       closedColor: primaryDark,
          //       transitionType: ContainerTransitionType.fade,
          //       openBuilder: (_, closeContainer) {
          //         return MusicPage(song: currentListening);
          //       },
          //     ))
        ]));
  }
}
