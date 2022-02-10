import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import 'helloworld.dart' as HelloWorld;
import 'RandomWords.dart' as RandomWords;
import 'InfiniteList.dart' as InfiniteList;

void main1() {
  // debugPaintSizeEnabled = true;
  // runApp(MyApp());

  // runApp(const MaterialApp(
  //   title: 'My APP',
  //   home: SafeArea(child:MyScaffold())
  // ));

  // runApp(
  //   const MaterialApp(
  //     title: 'Flutter Tutorial',
  //     home: TutorialHome()
  //   )
  // );

  // runApp(
  //   const MaterialApp(
  //     home: Scaffold(
  //       body: Center(
  //         child: MyButton()
  //       )
  //     )
  //   )
  // );

  // runApp(const MyApp1());
  // runApp(const MyApp2());

  // runApp(const MyApp3());

  // runApp(const MyApp4());


}

class MyApp4 extends StatelessWidget {
  const MyApp4({Key key}) : super(key: key);

  static const showCard = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo')
        ),
        body: Center(child: showCard ? _buildCard() : _buildStack())
      )
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
           ListTile(
             title: const Text('1625 Main Street',
               style: TextStyle(fontWeight: FontWeight.w500),),
             subtitle: const Text('My City, CA 99984'),
             leading: Icon(
               Icons.restaurant_menu,
               color: Colors.blue[500]
             )
           ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500)
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500]
              )
            ),
            ListTile(
              title: const Text('costa@example.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500]
              )
            )
          ]
        )
      )
    );

  }

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/pic1.jpg'),
          radius: 100
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45
          ),
          child: const Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )
          )
        )
      ]
    );
  }
}

class MyApp3 extends StatelessWidget {
  const MyApp3({Key key}) : super(key: key);
  static const showGrid = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo')
        ),
        body: Center(child: showGrid ? _buildGrid() : _buildList())
      )
    );
  }

  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileList(30)
  );

  List<Container> _buildGridTileList(int count) => List.generate(count, (i) => Container(child: Image.asset('images/pic$i.jpg')));

  Widget _buildList() {
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile(
            'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}


class MyApp2 extends StatelessWidget {
  const MyApp2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo')
        ),
        body: Center(child: _buildImageColumn())
      )
    );
  }

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26
      ),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ]
      )
    );
  }

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(width: 10, color: Colors.black38),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      margin: const EdgeInsets.all(4),
      child: Image.asset('images/pic$imageIndex.jpg'),
    ),
  );

  Widget _buildImageRow(int imageIndex) => Row(
    children: [
      _buildDecoratedImage(imageIndex),
      _buildDecoratedImage(imageIndex + 1),
    ],
  );
}



class MyApp1 extends StatelessWidget {
  const MyApp1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(child: buildRow()),
      ),
    );
  }

  Widget buildRow() =>
  Row(
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    // children: [
    //   Expanded(child: Image.asset('images/pic1.jpg'),),
    //   Expanded(
    //     child: Image.asset('images/pic2.jpg'),
    //     flex: 2,
    //   ),
    //   Expanded(child: Image.asset('images/pic3.jpg'),)
    // ],
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );
}

class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500]
        ),
        child: const Center(
          child: Text('Engage')
        )
      )
    );
  }
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(icon: Icon(Icons.menu),tooltip: 'Navigation menu', onPressed: null),
        title: const Text('Example title'),
        actions: const [
          IconButton(icon: Icon(Icons.search), tooltip: 'Search', onPressed: null)
        ]
      ),
      body: const Center(
        child: Text('Hello, world!')
      ),
      floatingActionButton: const FloatingActionButton(tooltip: 'Add', child: Icon(Icons.add), onPressed: null),
    );
  }
}







class MyScaffold extends StatelessWidget {
  const MyScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
             title: Text('Example title', style: Theme.of(context).primaryTextTheme.headline6)
          ),
          const Expanded(child: Center(
              child: Text('Hello, world!')
          ))
        ]
      )
    );
  }
}

class MyAppBar extends StatelessWidget{
  final Widget title;
  const MyAppBar({@required this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(icon: Icon(Icons.menu), tooltip: 'Navigation menu',onPressed: null),
          Expanded(child: title)
        ],
      )
    );
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: InfiniteList.RandomWords()
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
