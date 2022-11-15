import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(Bin2Dec());
}

class Bin2Dec extends StatefulWidget {
  const Bin2Dec({super.key});

  @override
  State<Bin2Dec> createState() => _Bin2DecState();
}

class _Bin2DecState extends State<Bin2Dec> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController decInputController = TextEditingController();
  final TextEditingController binInputController = TextEditingController();
  int number = 0;
  int bin = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bin2Dec Converter",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              child: const Text('Num to Bin'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: decInputController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLines: 1,
              ),
            ),
            TextButton(
              child: const Text(
                'Submit',
              ),
              onPressed: () {
                setState(() {
                  number = int.parse(decInputController.text);
                });
              },
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(number.toRadixString(2)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 235, 235),
              ),
              child: const Text('Bin to Num'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: binInputController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                maxLines: 1,
              ),
            ),
            TextButton(
              child: const Text(
                'Submit',
              ),
              onPressed: () {
                setState(() {
                  bin = int.parse(binInputController.text, radix: 2);
                });
              },
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(bin.toRadixString(10)),
            ),
          ],
        ),
      ),
    );
  }
}
