import 'dart:math';

import 'package:circle_slider/screens/home_page.dart';
import 'package:circle_slider/utlis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() {
  runApp(AppWidget());
}

double iconSize = 50;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Circular Slider',
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: ExampleWidget(),
    );
  }
}

class ExampleWidget extends StatefulWidget {
  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  double progressVal = 0.5;
  double value = 20;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    //
    // double mywid = width * .9;
    double mywid2 = 250;
    double mywid3 = 200;

    Widget bigCircle = new Container(
      width: mywid2,
      height: mywid2,
      decoration: new BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
    );

    return new Material(
      color: Colors.black54,
      child: new Center(
        child: Container(
          width: mywid3,
          height: mywid3,
          decoration: new BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
          child: new Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              // bigCircle,

              // new Positioned(
              //   child: new CircleButton(
              //       onTap: () => print("Cool"), iconData: Icons.favorite_border),
              //   top: width-(width-10),
              //   left: 50,
              // ),new Positioned(
              //   child: new CircleButton(
              //       onTap: () => print("Cool"), iconData: Icons.add_to_drive),
              //   top: width-(width-10),
              //   left: 130.0,
              // ),

              new Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      child: Container(
                        width: mywid3 ,
                        height: mywid3 ,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 20,
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                  color: Colors.blue.withAlpha(
                                      normalize(progressVal * 20000, 100, 255)
                                          .toInt()),
                                  offset: Offset(1, 3))
                            ]),
                        child: SleekCircularSlider(
                          min: kMinDegree,
                          max: kMaxDegree,
                          initialValue: 22,
                          appearance: CircularSliderAppearance(
                            startAngle: 180,
                            angleRange: 180,
                            size: kDiameter - 30,
                            customWidths: CustomSliderWidths(
                              trackWidth: 10,
                              shadowWidth: 0,
                              progressBarWidth: 01,
                              handlerSize: 15,
                            ),
                            customColors: CustomSliderColors(
                              hideShadow: true,
                              progressBarColor: Colors.transparent,
                              trackColor: Colors.transparent,
                              dotColor: Colors.red,
                            ),
                          ),
                          onChange: (value) {
                            setState(() {
                              progressVal =
                                  normalize(value, kMinDegree, kMaxDegree);
                            });
                          },
                          innerWidget: (percentage) {
                            return Center(
                              child: Text(
                                '${percentage?.toInt()} c',
                                style: TextStyle(
                                  fontSize: 50,
                                ),
                              ),
                            );
                          },
                        ),
                      )),
                ),
              ),

              new Positioned(
                child: new CircleButton(
                    onTap: () => print("Cool"), iconData: Icons.timer),
                top: (mywid3 / 2) - (iconSize / 2),
                left: -50,
              ),
              new Positioned(
                child: new CircleButton(
                    onTap: () => print("Cool"), iconData: Icons.place),
                top: (mywid3 / 2) - (iconSize / 2),
                left: mywid3,
                // right: 10.0,
              ),
              new Positioned(
                child: new CircleButton(
                    onTap: () => print("Cool " +
                        (102 % 5).toString() +
                        "    " +
                        ((mywid2 / 2) - (iconSize / 2)).toString()),
                    iconData: Icons.grid_view),
                // top: .9*(mywid2/2)-90-iconSize,
                top: -iconSize,
                left: mywid3/2-iconSize/2,
              ),
              new Positioned(
                child: new CircleButton(
                    onTap: () => print("sin " +
                        (sin(45)).toString() +
                        "   ll  " +
                        (90 * sin(45)).toString() +
                        "  cos " +
                        (90 * cos(45)).toString() +
                        "Cool " +
                        (102 % 5).toString() +
                        "    " +
                        ((mywid2 / 2) - (iconSize / 2)).toString()),
                    iconData: Icons.aspect_ratio),
                // top: .9*(mywid2/2)-90-iconSize,
                // top: 90 - 90 * sin(45) - 25,
                top: mywid3/2 - mywid3/2 * sin(45) - iconSize/2,
                left: mywid3/2+mywid3/2 * cos(45)+iconSize/2,//  mywid3/2 +
              ),
              new Positioned(
                child: new CircleButton(
                    onTap: () => print("Cool " +
                        (102 % 5).toString() +
                        "    " +
                        ((mywid2 / 2) - (iconSize / 2)).toString()),
                    iconData: Icons.save),
                // top: .9*(mywid2/2)-90-iconSize,
                top: mywid3/2 - mywid3/2 * sin(45) - iconSize/2,
                right:  mywid3/2+mywid3/2 * cos(45)+iconSize/2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    width: kDiameter - 30,
                    height: kDiameter - 30,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 20,
                          style: BorderStyle.solid,
                        ),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              spreadRadius: 10,
                              color: Colors.blue.withAlpha(
                                  normalize(progressVal * 20000, 100, 255)
                                      .toInt()),
                              offset: Offset(1, 3))
                        ]),
                    child: SleekCircularSlider(

                      min: kMinDegree,
                      max: kMaxDegree,
                      initialValue: 22,
                      appearance: CircularSliderAppearance(
                        startAngle: 180,
                        angleRange: 180,
                        size: kDiameter - 30,
                        customWidths: CustomSliderWidths(
                          trackWidth: 10,
                          shadowWidth: 0,
                          progressBarWidth: 01,
                          handlerSize: 15,
                        ),
                        customColors: CustomSliderColors(
                          hideShadow: true,
                          progressBarColor: Colors.transparent,
                          trackColor: Colors.transparent,
                          dotColor: Colors.red,
                        ),
                      ),
                      onChange: (value) {
                        setState(() {
                          progressVal = normalize(value, kMinDegree, kMaxDegree);
                        });
                      },
                      innerWidget: (percentage) {
                        return Center(
                          child: Text(
                            '${percentage?.toInt()}°c',
                            style: TextStyle(
                              fontSize: 50,
                            ),
                          ),
                        );
                      },
                    ),
                  ))
 */

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: iconSize,
        height: iconSize,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}

// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() => runApp(new MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: new HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   List<int> data = [1,2,3,4];
//
//   double radius =  125.0;
//
//   List<Widget> list(){
//     final double firstItemAngle = 0;
//     final double lastItemAngle = 2*3.14;
//     final double angleDiff = (firstItemAngle + lastItemAngle) / 2;
//     double currentAngle = firstItemAngle;
//
//
//     return data.map((int index){
//       print('$index =>    $firstItemAngle -- $lastItemAngle -- $angleDiff -- $currentAngle');
//
//       currentAngle += angleDiff;
//       return _radialListItem(currentAngle,index);
//     }).toList();
//   }
//
//   Widget _radialListItem(double angle, int index){
//
//     final x = cos(angle)  * radius;
//     final y = sin(angle) * radius;
//
//
//     return Center(
//       child: Transform(
//           transform: index == 1 ? Matrix4.translationValues(0.0, 0.0 , 0.0) : Matrix4.translationValues(x, y , 0.0),
//           child: InkWell(
//             onTap: (){
//               print(index.toString());
//             },
//             child: CircleAvatar(
//               radius: 50.0,
//               child: Text('fsfsf'),
//               // backgroundImage: AssetImage("images/c1.jpeg"),
//             ),
//           )
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text("hello World"),
//       ),
//       body: new Stack(
//           children: list()
//       ),
//     );
//   }
// }
