import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' Widgets Page',
      theme: ThemeData(colorSchemeSeed: Colors.grey),
      home: HomePage(colorList: [Color(0xFF0F172A), Color(0xFF4B5563)]),
      );
  }
}
// bottomNavigationBar: NavigationBar(destinations: [
//   FilledButton(onPressed: () {}, child: Icon(Icons.home_filled,size: 10,),),
//   FilledButton(onPressed: (){}, child: Icon(Icons.ac_unit))
// ]),





class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.02;
    final fontSize = size.width * 0.02;
    // final headingSize= size.width*0.035;

    Widget tile({
      required Widget button,
      required String text,
      required int num,
    }) {
      return Padding(padding: EdgeInsets.all(padding/4),
        child: Container(
          // width: size.width*0.025,
          // height: size.width*0.025,
          color: Color(0xFF99e34b),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  color: Colors.black
              ),
              ),
              SizedBox(height: space),
              button,
            ],
          ),
        ),
      );
    }




        return Scaffold(
          appBar: AppBar(title: Text('Learn Widgets')),
      drawer: Drawer(
        child: ListView(
            // padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey
                ),
                child: Text('Header', style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize
                ),
                ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: widget.colorList)),
          child: Padding(
            padding: EdgeInsets.all(padding/2),
            child: GridView.count(crossAxisCount: 3,
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              children: [
                // TILE 1 BUTTONS
                tile(
                    button: OutlinedButton.icon(
                      icon: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: fontSize,
                      ),
                      label: Text(
                        'Know More..',
                        style: TextStyle(
                            fontSize: fontSize ,
                            fontWeight: FontWeight.w100,
                            color: Colors.black
                        ),
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ButtonsPage(colorList: widget.colorList),
                          ),
                        );
                      },
                    ),
                    text: 'BUTTONS',
                    num: 1
                ),
                // TILE 2 GRID VIEWS
                tile(
                    button: OutlinedButton.icon(
                      icon: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: fontSize,
                      ),
                      label: Text(
                        'Know More..',
                        style: TextStyle(
                            fontSize: fontSize ,
                            fontWeight: FontWeight.w100,
                            color: Colors.black
                        ),
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                GridViews(colorList: widget.colorList),
                          ),
                        );
                      },
                    ),
                    text: 'GRID VIEWS',
                    num: 2
                ),
                // TILE 3 FAB
                tile(button: OutlinedButton.icon(
                  icon: Icon(
                    Icons.arrow_right_alt_outlined,
                    size: fontSize ,
                  ),
                  label: Text(
                    'Know More..',
                    style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w100,
                        color: Colors.black
                    ),
                  ),
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FAB(colorList: widget.colorList),
                      ),
                    );
                  },
                ),
                    text: 'FAB',
                    num: 3),
                // TILE 4 COLUMNS
                tile(
                    button: OutlinedButton.icon(
                      icon: Icon(
                        Icons.arrow_right_alt_outlined,
                        size: fontSize,
                      ),
                      label: Text(
                        'Know More..',
                        style: TextStyle(
                            fontSize: fontSize,
                            fontWeight: FontWeight.w100,
                            color: Colors.black
                        ),
                      ),
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Col(colorList: widget.colorList),
                          ),
                        );
                      },
                    ),
                    text: 'COLUMNS',
                    num: 4
                ),
              ],
            ),

          )
      ),
    );
  }
}

class FAB extends StatelessWidget {
  const FAB({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('Floating Action Button ')),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Floating Action Button',
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: space),
              Text(
                '''
          A FloatingActionButton (FAB) in Flutter is 
          a circular icon button that floats above the 
          content of a screen, typically in the 
          bottom-right corner, and represents the 
          primary action a user can take on that 
          particular screen.
           ''',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

class GridViews extends StatelessWidget {
  const GridViews({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    // final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    // final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('Grid + List views')),
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: padding,
              crossAxisSpacing: padding,
            ),
            padding: EdgeInsets.all(padding),
            itemCount: 50,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text(
                    'Box no. $index ',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(padding),
                child: OutlinedButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//columns
class Col extends StatelessWidget {
  const Col({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    //     final headingSize = size.width * 0.035;

    return Scaffold(
      appBar: AppBar(title: Text('How Columns Work')),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Center(
            child: Column(
              //                 mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Colors.orange,
                    child: Center(
                      child: Text(
                        'Column 1',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        'Column 2',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Column 3',
                        style: TextStyle(
                          fontSize: fontSize * 3,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: space * 2),
                OutlinedButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//buttons
class ButtonsPage extends StatelessWidget {
  const ButtonsPage({super.key, required this.colorList});

  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final padding = size.width * 0.05;
    final space = size.height * 0.025;
    final fontSize = size.width * 0.02;
    final headingSize = size.width * 0.035;

    Widget infoColumn({
      required Widget button,
      required String text,
      required String description,
    }) {
      return Expanded(
        child: Padding(
          padding: EdgeInsets.all(padding / 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button,
              SizedBox(height: space),
              Text(
                text,
                style: TextStyle(
                  fontSize: headingSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: space),
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: space),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Different types of Buttons')),
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: colorList)),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      infoColumn(
                        button: ElevatedButton(
                          onPressed: () {},
                          child: Text('Elevated Button'),
                        ),
                        text: 'Elevated Button',
                        description:
                        'A button with elevation, providing visual depth.',
                      ),
                      infoColumn(
                        button: FilledButton(
                          onPressed: () {},
                          child: Text('Filled Button'),
                        ),
                        text: 'Filled Button',
                        description:
                        'A strongly colored button for important actions.',
                      ),
                      infoColumn(
                        button: TextButton(
                          onPressed: () {},
                          child: Text('Text Button'),
                        ),
                        text: 'Text Button',
                        description:
                        'A flat button, no elevation, used for low-emphasis actions..',
                      ),
                    ],
                  ),
                ),

                SizedBox(height: space*2),
                OutlinedButton.icon(
                  icon: Icon(Icons.arrow_back),
                  label: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
