import 'package:circle_list/circle_list.dart';
import 'package:circle_slider/utlis.dart';
import 'package:circle_slider/widgets/custom_draw.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progressVal = 0.5;
  double value = 20;

  @override
  Widget build(BuildContext context) {
    final labels = ['0', '18', '30', '50', '+'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    Widget buildLabel({
      @required String label,
      @required double width,
      @required Color color,
    }) =>
        Container(
          width: width,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ).copyWith(color: color),
          ),
        );

    return Container(
      color: Colors.red,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.greenAccent,
          child: Stack(
            children: [

              Positioned(
                top: 40,
                left: 0,
                child: Icon(Icons.home),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: FlutterLogo(),
              ),
             ],
          ),
        ),
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     // Container(
    //     //   margin: EdgeInsets.symmetric(horizontal: 10),
    //     //   child: Row(
    //     //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //     children: Utils.modelBuilder(
    //     //       labels,
    //     //           (index, label) {
    //     //         // final selectedColor = Colors.black;
    //     //         // final unselectedColor = Colors.black.withOpacity(0.3);
    //     //         // final isSelected = index <= value;
    //     //         // final color = isSelected ? selectedColor : unselectedColor;
    //     //
    //     //         return buildLabel(label: label, color: Colors.green, width: 30);
    //     //       },
    //     //     ),
    //     //   ),
    //     // ),
    //     // Container(
    //     //   color: Colors.black.withOpacity(.5),
    //     //   child: Slider(
    //     //     value: value,
    //     //     onChanged: (newValue) {
    //     //       setState(() => value = newValue);
    //     //       print('linear slider');
    //     //     },
    //     //     divisions: 4,
    //     //     max: 50,
    //     //     min: 0,
    //     //     label: 'label',
    //     //     focusNode: FocusNode(debugLabel: 'fsdfsdfs',),
    //     //   ),
    //     // ),
    //     // SizedBox(
    //     //   height: 10,
    //     // ),
    //
    //
    //
    //
    //     // CircleList(
    //     //
    //     //   dragAngleRange: DragAngleRange(0,20),
    //     //   outerCircleColor: Colors.red[100],
    //     //   initialAngle: 50,
    //     //   innerRadius: 120,
    //     //   origin: Offset(-25, 0),
    //     //   children: List.generate(3, (index) {
    //     //     return Icon(
    //     //       Icons.home,
    //     //       color:  Colors.blue,
    //     //     );
    //     //   }),
    //     //
    //     //
    //     //
    //     //   centerWidget: ClipRRect(
    //     //       borderRadius: BorderRadius.all(Radius.circular(100)),
    //     //       child: Container(
    //     //         width: kDiameter - 30,
    //     //         height: kDiameter - 30,
    //     //         decoration: BoxDecoration(
    //     //             color: Colors.blue,
    //     //             shape: BoxShape.circle,
    //     //             border: Border.all(
    //     //               color: Colors.white,
    //     //               width: 20,
    //     //               style: BorderStyle.solid,
    //     //             ),
    //     //             boxShadow: [
    //     //               BoxShadow(
    //     //                   blurRadius: 30,
    //     //                   spreadRadius: 10,
    //     //                   color: Colors.blue.withAlpha(
    //     //                       normalize(progressVal * 20000, 100, 255)
    //     //                           .toInt()),
    //     //                   offset: Offset(1, 3))
    //     //             ]),
    //     //         child: SleekCircularSlider(
    //     //
    //     //           min: kMinDegree,
    //     //           max: kMaxDegree,
    //     //           initialValue: 22,
    //     //           appearance: CircularSliderAppearance(
    //     //             startAngle: 180,
    //     //             angleRange: 180,
    //     //             size: kDiameter - 30,
    //     //             customWidths: CustomSliderWidths(
    //     //               trackWidth: 10,
    //     //               shadowWidth: 0,
    //     //               progressBarWidth: 01,
    //     //               handlerSize: 15,
    //     //             ),
    //     //             customColors: CustomSliderColors(
    //     //               hideShadow: true,
    //     //               progressBarColor: Colors.transparent,
    //     //               trackColor: Colors.transparent,
    //     //               dotColor: Colors.red,
    //     //             ),
    //     //           ),
    //     //           onChange: (value) {
    //     //             setState(() {
    //     //               progressVal = normalize(value, kMinDegree, kMaxDegree);
    //     //             });
    //     //           },
    //     //           innerWidget: (percentage) {
    //     //             return Center(
    //     //               child: Text(
    //     //                 '${percentage?.toInt()}°c',
    //     //                 style: TextStyle(
    //     //                   fontSize: 50,
    //     //                 ),
    //     //               ),
    //     //             );
    //     //           },
    //     //         ),
    //     //       )),
    //     // ),
    //
    //     // Container(
    //     //   // color: Colors.green,
    //     //   child: Stack(
    //     //     children: [
    //     //       ShaderMask(
    //     //         shaderCallback: (rect) {
    //     //           return SweepGradient(
    //     //             startAngle: degToRad(0),
    //     //             endAngle: degToRad(180),
    //     //             colors: [Colors.red, Colors.red.withAlpha(100)],
    //     //             stops: [progressVal, progressVal],
    //     //             transform: GradientRotation(
    //     //               degToRad(178),
    //     //             ),
    //     //           ).createShader(rect);
    //     //         },
    //     //         child: Center(
    //     //           // child: Icon(Icons.call),
    //     //           child: CustomArc(),
    //     //         ),
    //     //       ),
    //     //       Center(
    //     //         child: Container(
    //     //           width: kDiameter - 30,
    //     //           height: kDiameter - 30,
    //     //           decoration: BoxDecoration(
    //     //               color: Colors.blue,
    //     //               shape: BoxShape.circle,
    //     //               border: Border.all(
    //     //                 color: Colors.white,
    //     //                 width: 20,
    //     //                 style: BorderStyle.solid,
    //     //               ),
    //     //               boxShadow: [
    //     //                 BoxShadow(
    //     //                     blurRadius: 30,
    //     //                     spreadRadius: 10,
    //     //                     color: Colors.blue.withAlpha(
    //     //                         normalize(progressVal * 20000, 100, 255)
    //     //                             .toInt()),
    //     //                     offset: Offset(1, 3))
    //     //               ]),
    //     //           child: SleekCircularSlider(
    //     //             min: kMinDegree,
    //     //             max: kMaxDegree,
    //     //             initialValue: 22,
    //     //             appearance: CircularSliderAppearance(
    //     //               startAngle: 180,
    //     //               angleRange: 180,
    //     //               size: kDiameter - 30,
    //     //               customWidths: CustomSliderWidths(
    //     //                 trackWidth: 10,
    //     //                 shadowWidth: 0,
    //     //                 progressBarWidth: 01,
    //     //                 handlerSize: 15,
    //     //               ),
    //     //               customColors: CustomSliderColors(
    //     //                 hideShadow: true,
    //     //                 progressBarColor: Colors.transparent,
    //     //                 trackColor: Colors.transparent,
    //     //                 dotColor: Colors.red,
    //     //               ),
    //     //             ),
    //     //             onChange: (value) {
    //     //               setState(() {
    //     //                 progressVal = normalize(value, kMinDegree, kMaxDegree);
    //     //               });
    //     //             },
    //     //             innerWidget: (percentage) {
    //     //               return Center(
    //     //                 child: Text(
    //     //                   '${percentage?.toInt()}°c',
    //     //                   style: TextStyle(
    //     //                     fontSize: 50,
    //     //                   ),
    //     //                 ),
    //     //               );
    //     //             },
    //     //           ),
    //     //         ),
    //     //       ),
    //     //     ],
    //     //   ),
    //     // ),
    //   ],
    // );
  }
}
