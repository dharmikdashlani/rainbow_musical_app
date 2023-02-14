import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../../modals/globals.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  playAudio() async {
    await Globals.playsong['player'].open(
      Audio(Globals.playsong['song']),
      autoStart: false,
    );

    setState(() {
      Globals.playsong['total_duration'] =
          Globals.playsong['player'].current.value!.audio.duration;
    });
  }

  @override
  void initState() {
    super.initState();
    playAudio();
  }

  @override
  void dispose() async {
    super.dispose();
    playAudio();
  }

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              Text(
                "${Globals.playsong['song_name']} - ${Globals.playsong['created_by']}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              image: Globals.playsong['images'],
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black45,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Globals.playsong['color'],
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image(
                        image: Globals.playsong['images'],
                        fit: BoxFit.fill,
                      )),
                ),
                const SizedBox(height: 50),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.shade800,
                  ),
                  child: StreamBuilder(
                    stream: Globals.playsong['player'].currentPosition,
                    builder: (context, AsyncSnapshot<Duration> snapshot) {
                      Duration? currentPosition = snapshot.data;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "$currentPosition".split(".")[0],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          Slider(
                            activeColor: Globals.playsong['color'],
                            inactiveColor: Colors.white54,
                            thumbColor: Globals.playsong['color'],
                            min: 0,
                            max: Globals.playsong['total_duration'].inSeconds
                                .toDouble(),
                            value: (currentPosition != null)
                                ? currentPosition.inSeconds.toDouble()
                                : 0,
                            onChanged: (val) async {
                              await Globals.playsong['player']
                                  .seek(Duration(seconds: val.toInt()));
                            },
                          ),
                          Text(
                            "${Globals.playsong['total_duration']}"
                                .split(".")[0],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 25,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.white38,
                            builder: (context) {
                              return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.all(10),
                                itemCount: Globals.musicList.length,
                                itemBuilder: (context, i) => Card(
                                  color: Globals.musicList[i]['color'],
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          Globals.playsong["player"].pause();
                                          Globals.index = i;
                                          Globals.playsong =
                                              Globals.musicList[i];
                                        });
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                "playing_page");
                                      },
                                      leading: SizedBox(
                                          height: 100,
                                          width: 60,
                                          child: Image(
                                            image: Globals.musicList[i]
                                                ['images'],
                                          )),
                                      title: SizedBox(
                                        height: 20,
                                        child: Text(
                                          "${Globals.musicList[i]["song_name"]}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.headphones,
                          color: Globals.playsong['color'],
                        ),
                      ),
                      IconButton(
                        // padding: EdgeInsets.all(10),
                        iconSize: 55,
                        icon: Icon(
                          (isPlaying) ? Icons.pause : Icons.play_arrow,
                          color: Globals.playsong['color'],
                        ),
                        onPressed: () async {
                          setState(() {
                            isPlaying = (isPlaying) ? false : true;
                          });
                          (isPlaying)
                              ? await Globals.playsong['player'].play()
                              : await Globals.playsong['player'].pause();
                        },
                      ),
                      IconButton(
                        iconSize: 25,
                        icon: Icon(
                          Icons.stop,
                          color: Globals.playsong['color'],
                        ),
                        onPressed: () async {
                          setState(() {
                            isPlaying = false;
                          });
                          await Globals.playsong['player'].stop();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
