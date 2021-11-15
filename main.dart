import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFF8BBD0)),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatelessWidget(),
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Track your emotions today!'),
          content: const Text('Can you identify your emotions?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'I can not!'),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.brown)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'I can not!',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.brown)),
                onPressed: () => Navigator.pop(context, 'I can!'),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "I can!",
                    textAlign: TextAlign.center,
                  ),
                )),
          ],
        ),
      ),
      child: const Text('Press this to continue!',
          style: TextStyle(color: Colors.black)),
    );
  }
}
