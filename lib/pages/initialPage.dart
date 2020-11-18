import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ]),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    child: ClipPath(
                      clipper: InitClipper(),
                      child: Container(
                        color: Color(0xFF4563DB),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Thermoy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 80,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "by Jordan",
                            style: TextStyle(
                                // color: Colors.white70,
                                color: Colors.cyanAccent,
                                fontSize: 23,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage("assets/images/front.png"),
                      fit: BoxFit.contain,
                      height: 600,
                      width: 300,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 600,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF5036D5).withOpacity(0.01),
                              Color(0xFF5B16D0).withOpacity(0.4),
                            ]),
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19),
                        ),
                        color: Colors.white,
                        height: 50,
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/menu');
                        },
                        child: Container(
                          width: 170,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8, bottom: 1),
                                child: Text(
                                  "Dashboard",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.cyanAccent,
                                size: 40,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InitClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.width);
    path.lineTo(size.height - 300, 0);
    path.lineTo(size.height, size.width);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
