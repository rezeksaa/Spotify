import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spotify/home.dart';

class dbr extends StatelessWidget {
  const dbr({super.key});

  @override
  Widget build(BuildContext context) {
    const String albumCover = "assets/dbr.jpg";
    const String albumName = "DAYS BEFORE RODEO";
    const String artistPhoto = "assets/ts.jpg";
    const String albumRectangle = "assets/dbr.jpg";
    const String artistName = "Travis Scott";
    const String albumYear = "Album•2014";

    List<String> trackTitles = [
      'Days Before Rodeo: The Prayer',
      'Mamacita (feat. Rich Homie Quan & Young Thug)',
      'Quintana Pt.2',
      'Drugs You Should Try It',
      'Don\'t Play (feat. The 1975 & Big Sean)',
      'Skyfall (feat. Young Thug)',
      'Zombies',
      'Sloppy Toppy (feat. Migos & Peewee Longway)',
      'Basement Freestyle',
      'Backyard',
      'Grey',
      'BACC(Bonus)',
    ];

    List<String> trackArtist = [
      'Travis Scott',
      'Travis Scott, Rich Homie Quan, Young Thug',
      'Travis Scott',
      'Travis Scott',
      'Travis Scott, The 1975, Big Sean',
      'Travis Scott, Young Thug',
      'Travis Scott',
      'Travis Scott, Migos, Peewee Longway',
      'Travis Scott',
      'Travis Scott',
      'Travis Scott',
      'Travis Scott',
    ];

    List<bool> explicit = [
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFF090909),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Color(0xFF526782),
                        Color(0xFF090909),
                      ],
                      stops: [0.0, 0.999],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 30),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            albumCover,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          albumName,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Row(
                          children: [
                            const CircleAvatar(
                              radius: 10,
                              backgroundImage: AssetImage(artistPhoto),
                            ),
                            const SizedBox(width: 15),
                            Text(
                              artistName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          albumYear,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                height: 25,
                                width: 15,
                                child: Image.asset(
                                  albumRectangle,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.add_circle_outline_sharp,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.arrow_circle_down_rounded,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                            const Spacer(),
                            Image.asset(
                              'assets/shuffle.png',
                              height: 25,
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.play_circle,
                              color: Color(0xff62d56e),
                              size: 50,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ...List.generate(trackTitles.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              children: [
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth: screenWidth * 0.8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        trackTitles[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          if (explicit[index])
                                            const Icon(
                                              Icons.explicit,
                                              color: Colors.grey,
                                              size: 16,
                                            ),
                                          if (explicit[index])
                                            const SizedBox(width: 5),
                                          Flexible(
                                            child: Text(
                                              trackArtist[index],
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Icon(
                                  Icons.more_vert,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 15,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
