import 'package:animated_button/animated_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Level extends StatefulWidget {
  const Level({Key? key}) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

List<String> musicimage = [
  'https://i.guim.co.uk/img/media/c8b1d78883dfbe7cd3f112495941ebc0b25d2265/256_0_3840_2304/master/3840.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=579884b0bd058f1350519d3cc586d587',
  'https://icons8.com/vue-static/landings/animated-icons/icons/sound/sound_200.gif'
];
int index = 0;

class _LevelState extends State<Level> {
  //we will need some variables
  bool playing = false; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  late AudioPlayer _player;
  late AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  //Now let's initialize our player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    _player.onDurationChanged.listen((d) {
      setState(() {
        musicLength = d;
      });
    });
    _player.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/67/55/8e/67558e04a5316799d141850187ead721.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://media.istockphoto.com/vectors/cheerful-female-enjoying-time-on-social-media-blogger-creative-people-vector-id1224664031?k=20&m=1224664031&s=612x612&w=0&h=vvhYzQhq00sMs-K5xnw0BisZJs1TJyKlf2Zpk0nG4Xo='),
                                radius: 100,
                              ),
                            ),
                            Text(
                              'Hi! I am Ava. I love coding and ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.caveat(
                                textStyle: TextStyle(
                                    color: Colors.black54,
                                    letterSpacing: 0.7,
                                    fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!playing) {
                        //now let's play the song
                        cache.play("gg.mp3");
                        setState(() {
                          index = 1;
                          playing = true;
                        });
                      } else {
                        _player.pause();
                        setState(() {
                          index = 0;
                          playing = false;
                        });
                      }
                    },
                    child: Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(musicimage[index]),
                        radius: 50,
                      ),
                    ),
                  ),
                  Container(
                    width: 500.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        slider(),
                        Text(
                          "${musicLength.inMinutes}:${musicLength.inSeconds.remainder(60)}",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
