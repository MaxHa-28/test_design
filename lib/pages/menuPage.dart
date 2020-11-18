import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Destination {
  const Destination(this.index, this.title, this.icon, this.color);
  final int index;
  final String title;
  final IconData icon;
  final Color color;
}

const List<Destination> allDestinations = <Destination>[
  Destination(0, 'Start', Icons.home, Color(0xFF3594DD)),
  Destination(1, 'Mein Thermoy', Icons.device_hub, Color(0xFF4563DB)),
  Destination(2, 'Service', Icons.construction, Color(0xFF5036D5)),
  Destination(3, 'Einstellungen', Icons.settings, Color(0xFF5B16D0))
];

class Homepage extends StatelessWidget {
  Homepage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  final TextStyle titleHome =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.white);

  final TextStyle bodyHome = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: destination.color,
      body: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Willkommen",
            style: titleHome,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Maecenas a justo semper, fermentum neque vitae, auctor augue.
Etiam in justo nisi. Nunc malesuada rhoncus dui eget viverra.
tate dolor eu auctor efficitur.""",
            style: bodyHome,
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 200,
            width: double.maxFinite,
            child: Center(
              child: Text(
                "Text in pinker Box",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                colors: [Colors.pink[300], Colors.pink[800]],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          SizedBox(
            height: 59,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarms),
                label: Text("Zeit"),
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.alternate_email),
                label: Text("Email"),
              ),
              RaisedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.cached),
                label: Text("Test"),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    switch (destination.index) {
      case 0:
        return Homepage(destination: destination);

      case 1:
        return Scaffold(
          appBar: AppBar(
            title: Text(destination.title),
            backgroundColor: destination.color,
          ),
          backgroundColor: destination.color,
          body: SizedBox.expand(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/list");
              },
              child: Center(
                child: Text('Tap für Liste'),
              ),
            ),
          ),
        );
      case 2:
        return Scaffold(
          appBar: AppBar(
            title: Text(destination.title),
            backgroundColor: destination.color,
          ),
          backgroundColor: destination.color,
          body: SizedBox.expand(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/list");
              },
              child: Center(
                child: Text('Tap für Liste'),
              ),
            ),
          ),
        );
      case 3:
        return Scaffold(
          appBar: AppBar(
            title: Text(destination.title),
            backgroundColor: destination.color,
          ),
          backgroundColor: destination.color,
          body: SizedBox.expand(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/list");
              },
              child: Center(
                child: Text('Tap für Liste'),
              ),
            ),
          ),
        );
    }
    return Text("Not Found");
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const List<int> shades = <int>[
      50,
      100,
      200,
      300,
      400,
      500,
      600,
      700,
      800,
      900
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
        backgroundColor: destination.color,
      ),
      backgroundColor: destination.color,
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: shades.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 128,
              child: Card(
                color: Colors.blueGrey[shades[index]].withOpacity(0.25),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/text");
                  },
                  child: Center(
                    child: Text('Item $index',
                        style: Theme.of(context).primaryTextTheme.headline4),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TextPage extends StatefulWidget {
  const TextPage({Key key, this.destination}) : super(key: key);

  final Destination destination;

  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(
      text: 'sample text: ${widget.destination.title}',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.title),
        backgroundColor: widget.destination.color,
      ),
      backgroundColor: widget.destination.color,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
        child: TextField(controller: _textController),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }

  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}

class DestinationView extends StatefulWidget {
  const DestinationView({Key key, this.destination, this.onNavigation})
      : super(key: key);

  final Destination destination;
  final VoidCallback onNavigation;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      observers: <NavigatorObserver>[
        ViewNavigatorObserver(widget.onNavigation),
      ],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch (settings.name) {
              case '/':
                return RootPage(destination: widget.destination);
              case '/list':
                return ListPage(destination: widget.destination);
              case '/text':
                return TextPage(destination: widget.destination);
            }
            return Text("Not Found");
          },
        );
      },
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  List<Key> _destinationKeys;
  List<AnimationController> _faders;
  AnimationController _hide;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _faders =
        allDestinations.map<AnimationController>((Destination destination) {
      return AnimationController(
          vsync: this, duration: Duration(milliseconds: 200));
    }).toList();
    _faders[_currentIndex].value = 1.0;
    _destinationKeys =
        List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
            .toList();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    for (AnimationController controller in _faders) controller.dispose();
    _hide.dispose();
    super.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        body: SafeArea(
          top: false,
          child: Stack(
            fit: StackFit.expand,
            children: allDestinations.map((Destination destination) {
              final Widget view = FadeTransition(
                opacity: _faders[destination.index]
                    .drive(CurveTween(curve: Curves.fastOutSlowIn)),
                child: KeyedSubtree(
                  key: _destinationKeys[destination.index],
                  child: DestinationView(
                    destination: destination,
                    onNavigation: () {
                      _hide.forward();
                    },
                  ),
                ),
              );
              if (destination.index == _currentIndex) {
                _faders[destination.index].forward();
                return view;
              } else {
                _faders[destination.index].reverse();
                if (_faders[destination.index].isAnimating) {
                  return IgnorePointer(child: view);
                }
                return Offstage(child: view);
              }
            }).toList(),
          ),
        ),
        bottomNavigationBar: ClipRect(
          child: SizeTransition(
            sizeFactor: _hide,
            axisAlignment: -1.0,
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: allDestinations.map((Destination destination) {
                return BottomNavigationBarItem(
                    icon: Icon(destination.icon),
                    backgroundColor: destination.color,
                    label: destination.title);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
