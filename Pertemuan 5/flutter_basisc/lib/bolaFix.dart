import 'package:flutter/material.dart';

class Bola extends StatelessWidget {
  const Bola({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> player = [
      'Lionel Messi',
      'Cristiano Ronaldo',
      'Neymar Jr',
      'Kylian Mbappe',
      'Mohamed Salah',
    ];

    final List<String> image = [
      'messi.webp',
      'ronaldo.jpg',
      'neymar.webp',
      'mbappe.jpg',
      'salah.webp',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bola',
      home: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sports_soccer),
              Text('Bola'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {}, 
                        child: const Text('Berita Terbaru')),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text('Pertandingan Hari ini')),
                    // Text('Berita Terbaru'),
                    // Text('Pertandingan Hari ini'),
                  ],
                ),
              ),
              SizedBox(
                width: 400,
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      player.length,
                      (index) => Container(
                            width: 70,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/${image[index]}'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            ),
                          )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lima Pesepak Bola yang Terkenal Dermawan',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              // Create a horizontal line using the Container widget
              Container(
                width: 400,
                height: 5,
                color: Colors.grey,
              ),
              const SizedBox(height: 5),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    image.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 400,
                            height: 150,
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/${image[index]}'),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${index + 1}. ${player[index]}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
