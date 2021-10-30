import 'package:aka/second.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_button/animated_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/95/17/5a/95175a230509390e43c2d1a6185c5312.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text('Welcome'),
            // Text('to'),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Welcome!',
                  style: GoogleFonts.rockSalt(
                    textStyle: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 50,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 350,
                width: 350,
                child: Card(
                  elevation: 9,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Image.network(
                            'https://i.pinimg.com/originals/1a/9a/26/1a9a265442128cacd31310959fd14d9f.gif',
                            height: 120,
                            width: 120),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Hello World!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.caveat(
                            textStyle: TextStyle(
                                color: Color(0xffc69acd),
                                letterSpacing: 0.7,
                                fontSize: 25),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        AnimatedButton(
                          height: 50, // Button Height, default is 64
                          width: 190,
                          color: Color(0xffadabd0),
                          child: Text(
                            'Lean more about me',
                            style: GoogleFonts.odibeeSans(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1,
                                  fontSize: 23),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Level()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // SizedBox(
            //   height: 20,
            // ),
          ],
        ),
      ),
    );
  }
}
