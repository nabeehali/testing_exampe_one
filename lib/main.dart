import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apply unit ,widget and integration Testing in Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const UnitTestExample1(),
    );
  }
}

class UnitTestExample1 extends StatefulWidget {
  const UnitTestExample1({Key? key}) : super(key: key);

  @override
  State<UnitTestExample1> createState() => _UnitTestExample1State();
}

class _UnitTestExample1State extends State<UnitTestExample1> {
  TextEditingController? _controller;
  String? _result;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Testing Demo"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              key: const Key("keyTest"),
              controller: _controller,
              decoration:
                  const InputDecoration(labelText: "Please Enter Your String:"),
            ),
            const SizedBox(height: 20),
            if (_result != null) ...[
              Text(
                _result!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
            ],
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                  onPressed: () {
                    if (_controller!.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      _result = validateEmailString(_controller!.text);
                    });
                  },
                  child: const Text("Validate Email")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                  onPressed: () {
                    if (_controller!.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      _result = reverseString(_controller!.text);
                    });
                  },
                  child: const Text("Reverse")),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                  onPressed: () {
                    if (_controller!.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      _result = lowerString(_controller!.text);
                    });
                  },
                  child: const Text("Lower Case")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.4,
                        MediaQuery.of(context).size.height * 0.05,
                      )),
                  onPressed: () {
                    if (_controller!.text.isEmpty) {
                      return;
                    }
                    setState(() {
                      _result = upperString(_controller!.text);
                    });
                  },
                  child: const Text("Upper case")),
            ])
          ],
        ),
      ),
    );
  }
}

/// This function for reverse Input Text

String reverseString(String initial) {
  return initial.split('').reversed.join();
}

/// This function for Upper  Input Text

String upperString(String initial) {
  return initial.toUpperCase();
}

/// This function for Lower  Input Text

String lowerString(String initial) {
  return initial.toLowerCase();
}

/// This function for Validate Email Input Text

String validateEmailString(String initial) {
  final bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(initial);
  return emailValid.toString();
}
