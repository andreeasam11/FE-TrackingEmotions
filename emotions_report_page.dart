import 'package:flutter/material.dart';
import 'emotion_card.dart';
import 'congratulations_page.dart';

class EmotionsReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var navigationResult = await Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) => CongratulationsPage()));

          if (navigationResult == 'from_back') {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Navigation from back'),
                    ));
          } else if (navigationResult == 'from_button') {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text('Congratulations!'),
                    ));
          }
        },
      ),
      body: Container(
        child: Center(
          child: Text(
            'Your tracked emotions',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade100),
          ),
        ),
      ),
    );
  }
}

//class EmotionsReportPage extends StatelessWidget {
//const EmotionsReportPage({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  Navigator.push(context,
      new MaterialPageRoute(builder: (context) => CongratulationsPage()));
  return MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.light,
      primaryColor: Colors.pink.shade100,
      fontFamily: 'Georgia',
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 29.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: const MyHomePage(title: 'Your tracked emotions'),
  );
}

class MyHomePage extends StatefulWidget {
  final String title;

  // ignore: use_key_in_widget_constructors
  const MyHomePage({this.title = 'Demo'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var i = 0;
  static const emotions = [
    ["Wonderful", "Family", "At home", "time"],
    ["Sadness", "Job", "At office", "time"],
    ["Excitement", "Colleagues", "At home", "time"],
    ["test", "test", "test", "time"]
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Text(widget.title),
      ),
      body: Container(
          padding: const EdgeInsets.all(18.0),
          child: ListView.builder(
              itemCount: emotions.length,
              itemBuilder: (BuildContext context, int index) {
                return EmotionCard(
                    heading: emotions[index][0],
                    subheading: emotions[index][1],
                    supportingText: emotions[index][2]);
              })),
      // )
    );
  }
}
