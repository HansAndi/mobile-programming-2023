import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KonversiSuhu extends StatefulWidget {
  const KonversiSuhu({super.key});

  @override
  State<KonversiSuhu> createState() => _KonversiSuhuState();
}

class _KonversiSuhuState extends State<KonversiSuhu> {

  double inputUser = 0;
  double kelvin = 0;
  double reamur = 0;
  final TextEditingController inputController = TextEditingController();

  void konversiSuhu() {
    setState(() {
      inputUser = double.tryParse(inputController.text) ?? 0;
      reamur = 4 / 5 * inputUser;
      kelvin = inputUser + 273.15;
    });
  }

  @override
  void initState() {
    super.initState();
    konversiSuhu();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: brightness,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Konverter Suhu'),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: inputController,
                decoration: InputDecoration(
                  hintText: 'Masukkan Suhu Dalam Celcius',
                  labelText: 'Celcius',
                  suffixIcon: IconButton(
                    onPressed: () {
                      inputController.clear();
                      setState(() {
                        konversiSuhu();
                      });
                    },
                    icon: const Icon(Icons.clear),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  // FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')
                  FilteringTextInputFormatter.allow(RegExp(r'^[1-9]\d*\.?\d*|^0\.[1-9]\d*')
                  ),
                ],
                // onChanged: (value) {
                //   konversiSuhu();
                // },
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text('Kelvin'),
                          const Divider(),
                          Text(
                            kelvin.toStringAsFixed(kelvin.truncateToDouble() == kelvin ? 0 : 2),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const Text('Reamur'),
                          const Divider(),
                          Text(
                            reamur.toStringAsFixed(reamur.truncateToDouble() == reamur ? 0 : 2),
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )
                        ),
                        onPressed: () {
                          konversiSuhu();
                        },
                        child: const Text('Konversi Suhu'),
                      )
                    ),
                  ),
                ],
              )
            ],
          )
        ),
        // floatingActionButtonLocation: 
        //   FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Container(
        //   height: 50,
        //   margin: const EdgeInsets.all(10),
        //   child: ElevatedButton(
        //     //create hover color red
        //     style: ElevatedButton.styleFrom(
        //       primary: Colors.red,
        //       onPrimary: Colors.black,
        //     ),
        //     onPressed: () {},
        //     child: const Center(
        //       child: Text('Konversi Suhu'),
        //     ),
        //   ),
        // )
      )
    );
  }
  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }
}