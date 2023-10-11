import 'package:flutter/material.dart';
import 'package:flutter_basisc/bolaFix.dart';

class BolaWidget extends StatelessWidget {
  const BolaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List player = [
      'Lionel Messi',
      'Cristiano Ronaldo',
      'Neymar Jr',
      'Kylian Mbappe',
      'Mohamed Salah',
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
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Padding(padding: EdgeInsets.all(20)),
                      Text('Berita Terbaru'),
                      // Padding(padding: EdgeInsets.all(20)),
                      Text('Pertandingan Hari ini'),
                    ],
                  ),
                ),
                SizedBox(
                  width: 400,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 70,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/899807.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/899807.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/899807.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/899807.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/899807.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      )
                    ],
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
                //creta horizontal line using container widget
                Container(
                  width: 400,
                  height: 5,
                  color: Colors.grey,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListView.builder(
                      itemCount: player.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            width: 400,
                            height: 150,
                            color: Colors.grey,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/899807.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  //create text in center
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('${index+1} ${player[index]}'),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 400,
                        height: 150,
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/899807.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              //create text in center
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('1. Kylian Mbappe'),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 400,
                        height: 150,
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/899807.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              //create text in center
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('2. Lionel Messi'),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                        width: 400,
                        height: 150,
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/899807.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                              ),
                            ),
                            const SizedBox(
                              //create text in center
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('3. Cristiano Ronaldo'),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: Container(
                    //     width: 400,
                    //     height: 150,
                    //     color: Colors.grey,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 50),
                    //           child: SizedBox(
                    //             height: 100,
                    //             width: 100,
                    //             child: Container(
                    //               decoration: const BoxDecoration(
                    //                 image: DecorationImage(
                    //                   image:
                    //                       AssetImage('assets/images/899807.png'),
                    //                   fit: BoxFit.cover,
                    //                 ),
                    //                 borderRadius:
                    //                     BorderRadius.all(Radius.circular(8)),
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //         const Padding(
                    //           padding: EdgeInsets.only(left: 55),
                    //           child: SizedBox(
                    //             //create text in center
                    //             child: Column(
                    //               mainAxisAlignment: MainAxisAlignment.center,
                    //               children: [
                    //                 Text('1. Kylian Mbappe'),
                    //               ],
                    //             ),
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          )
          //create body with container widget
          ),
    );
  }
}
