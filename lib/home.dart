import 'package:flutter/material.dart';
import 'package:spotify/dbr.dart';
import 'package:spotify/dl.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final crossAxisCount = screenWidth > 500 ? 4 : 2;

    final List<String> imagePaths = [
      'assets/dbr.jpg',
      'assets/dl.png',
      'assets/dl.png',
      'assets/dbr.jpg',
      'assets/dbr.jpg',
      'assets/dl.png',
      'assets/dl.png',
      'assets/dbr.jpg',
    ];

    final List<String> itemTexts = [
      'Days Before Rodeo',
      'Die Lit',
      'Die Lit',
      'Days Before Rodeo',
      'Days Before Rodeo',
      'Die Lit',
      'Die Lit',
      'Days Before Rodeo',
    ];

    final List<Widget> link = [
      dbr(),
      dl(),
      dl(),
      dbr(),
      dbr(),
      dl(),
      dl(),
      dbr(),
    ];

    final List<String> JBIImage = [
      'assets/parkingLot.jpeg',
      'assets/Utopia.jpeg',
      'assets/parkingLot.jpeg',
      'assets/Utopia.jpeg',
      'assets/parkingLot.jpeg',
      'assets/Utopia.jpeg',
      'assets/parkingLot.jpeg',
      'assets/Utopia.jpeg',
    ];

    final List<String> JBIText = [
      'Parking Lot',
      'Utopia',
      'Parking Lot',
      'Utopia',
      'Parking Lot',
      'Utopia',
      'Parking Lot',
      'Utopia',
    ];

    final List<String> JBIArtist = [
      'Single•Mustard, Travis Scott',
      'Album•Travis Scott',
      'Single•Mustard, Travis Scott',
      'Album•Travis Scott',
      'Single•Mustard, Travis Scott',
      'Album•Travis Scott',
      'Single•Mustard, Travis Scott',
      'Album•Travis Scott',
    ];

    final List<Widget> gridItems = List.generate(imagePaths.length, (index) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => link[index]));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  itemTexts[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 23, 23, 23),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.pink[300],
                borderRadius: BorderRadius.circular(1000),
              ),
              height: 30,
              width: 30,
              child: const Center(
                child: Text(
                  "R",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.circular(1000),
              ),
              height: 30,
              width: 50,
              child: const Center(
                child: Text(
                  "All",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(1000),
              ),
              height: 30,
              width: 70,
              child: const Center(
                child: Text(
                  "Music",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 7),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(1000),
              ),
              height: 30,
              width: 80,
              child: const Center(
                child: Text(
                  "Podcast",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 23, 23, 23) ,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                GridView.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: gridItems,
                ),
                const SizedBox(height: 16), 
                const Center(
                  child: CardWithBackgroundImage(
                    imageAssets: 'assets/nugget.gif',
                    text: 'GEDAGEDIGEDAGEDAO',
                  ),
                ),
                const SizedBox(height: 16), 
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Jump Back In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16), 
                SizedBox(
                  height: 200, 
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(JBIImage.length, (Index) {
                        return SlideItem(imageAssets: JBIImage[Index], text: JBIText[Index], Artist: JBIArtist[Index],);
                      }
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SlideItem extends StatelessWidget {
  final String imageAssets;
  final String text;
  final String Artist;

  const SlideItem({required this.imageAssets, required this.text, required this.Artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 150,
      child: Column(
        children: [
          Image.asset(imageAssets),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                Artist,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardWithBackgroundImage extends StatelessWidget {
  final String imageAssets;
  final String text;

  const CardWithBackgroundImage({
    required this.imageAssets,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      color: Color.fromARGB(255, 72, 118, 255),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imageAssets,
                width: 300,
                height: 200,
              ),
            ),
          ),
          Container(
            width: 500,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
