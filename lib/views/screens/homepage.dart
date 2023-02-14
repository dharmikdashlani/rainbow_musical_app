import 'package:flutter/material.dart';

import '../../modals/globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player',style: TextStyle(fontSize: 27),),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          padding: const EdgeInsets.all(10),
          physics: const BouncingScrollPhysics(),
          itemCount: Globals.musicList.length,
          itemBuilder: (context, i) {
            return Card(
              color: Globals.musicList[i]['color'],
              child: Container(
                height: 100,
                alignment: Alignment.center,
                child:
                ListTile(
                  onTap: () {
                    setState(() {
                      Globals.index = i;
                      Globals.playsong = Globals.musicList[i];
                    });
                    Navigator.of(context).pushNamed("playing_page");
                  },
                  title: Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: Globals.musicList[i]['images'],
                                fit: BoxFit.fill)),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 70,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Globals.musicList[i]["song_name"]}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${Globals.musicList[i]["created_by"]}",
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
