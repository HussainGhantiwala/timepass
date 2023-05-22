// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class MyHome extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHome({Key? key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  AudioPlayer audioPlayer = AudioPlayer();
  List one = [];
  List two = [];
  List three = [];
  List four = [];
  late Uint8List audiobytes;

  /*Future<void> _fetchAudioUrls() async {
    final List<Reference> audioRefs = await FirebaseStorage.instance
        .ref("audio/")
        .listAll()
        .then((result) => result.items);

    List<String> audioUrls = [];
    for (var audioRef in audioRefs) {
      if (audioRef.name.endsWith('.mp3') ||
          audioRef.name.endsWith('.wav') ||
          audioRef.name.endsWith('.aac')) {
        String audioUrl = await audioRef.getDownloadURL();
        audioUrls.add(audioUrl);
      }
    }

    setState(() {
      _audioUrls = audioUrls;
    });
  } */

  loadData() async {
    await DefaultAssetBundle.of(context).loadString("lib/files/one.json").then(
      (value) {
        setState(() {
          one = json.decode(value);
        });
      },
    );
    // ignore: use_build_context_synchronously
    await DefaultAssetBundle.of(context).loadString("lib/files/two.json").then(
      (c) {
        setState(() {
          two = json.decode(c);
        });
      },
    );
    // ignore: use_build_context_synchronously
    await DefaultAssetBundle.of(context)
        .loadString("lib/files/three.json")
        .then(
      (e) {
        setState(() {
          three = json.decode(e);
        });
      },
    );
    // ignore: use_build_context_synchronously
    await DefaultAssetBundle.of(context).loadString("lib/files/four.json").then(
      (f) {
        setState(() {
          four = json.decode(f);
        });
      },
    );
    // ignore: use_build_context_synchronously
  }

  @override
  void initState() {
    loadData();
    //_fetchAudioUrls();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                "MEME",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Iconic",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 190,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: 0.9),
                        itemCount: one.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((_, i) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Future.delayed(Duration.zero, () async {
                                    ByteData bytes = await rootBundle.load(
                                        one[i]
                                            ["sound"]); //load audio from assets
                                    audiobytes = bytes.buffer.asUint8List(
                                        bytes.offsetInBytes,
                                        bytes.lengthInBytes);
                                    audioPlayer.playBytes(audiobytes);
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    one[i]["gif"],
                                    height: 190,
                                    width: 340,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "The Office",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: 0.9),
                        itemCount: two.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((_, i) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Future.delayed(Duration.zero, () async {
                                    ByteData bytes = await rootBundle.load(
                                        two[i]
                                            ["sound"]); //load audio from assets
                                    audiobytes = bytes.buffer.asUint8List(
                                        bytes.offsetInBytes,
                                        bytes.lengthInBytes);
                                    audioPlayer.playBytes(audiobytes);
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    two[i]["gif"],
                                    height: 200,
                                    width: 340,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "F.R.I.E.N.D.S",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: 0.9),
                        itemCount: three.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((_, i) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Future.delayed(Duration.zero, () async {
                                    ByteData bytes = await rootBundle.load(
                                        three[i]
                                            ["sound"]); //load audio from assets
                                    audiobytes = bytes.buffer.asUint8List(
                                        bytes.offsetInBytes,
                                        bytes.lengthInBytes);
                                    audioPlayer.playBytes(audiobytes);
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    three[i]["gif"],
                                    height: 200,
                                    width: 340,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Brooklyn Nine-Nine",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 200,
                    child: PageView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: PageController(viewportFraction: 0.9),
                        itemCount: four.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((_, i) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Future.delayed(Duration.zero, () async {
                                    ByteData bytes = await rootBundle.load(
                                        four[i]
                                            ["sound"]); //load audio from assets
                                    audiobytes = bytes.buffer.asUint8List(
                                        bytes.offsetInBytes,
                                        bytes.lengthInBytes);
                                    audioPlayer.playBytes(audiobytes);
                                  });
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    four[i]["gif"],
                                    height: 200,
                                    width: 340,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
