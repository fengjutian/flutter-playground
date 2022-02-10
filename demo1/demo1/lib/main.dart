import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(const MyDispalyApp());
  runApp(const MaterialApp(
      title: 'Returning Data',
      home: HomeScreen()
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Returning Data Demo')
      ),
      body: const Center(
        child: SelectionButton()
      )
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({Key key}) : super(key : key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        _navigateAndDisplaySelection(context);
      },
      child: const Text('Pick an option, any option!')
    );
  }
}

void _navigateAndDisplaySelection(BuildContext context) async {
  final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectionScreen()));
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Yep!" as the result.
                  Navigator.pop(context, 'Yep!');
                },
                child: const Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  // Close the screen and return "Nope." as the result.
                  Navigator.pop(context, 'Nope.');
                },
                child: const Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyDispalyApp extends StatelessWidget {
  const MyDispalyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold))
              ),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.grey[500]))
            ],
          )),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41')
        ],
      )
    );

    Color color = Theme.of(context).primaryColor;

    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 2,
                fontWeight: FontWeight.w400,
                color: color
              )
            )
          )
        ],
      );
    }

    Widget imgSection = Container(
      child: Image.asset('images/lake.jpeg', width: 600, height: 240, fit: BoxFit.cover)
    );


    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      )
    );


    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter layout demo')),
        body: ListView(children: [
          imgSection,
          titleSection,
          buttonSection,
          textSection
        ],)
      )
    );
  }
}