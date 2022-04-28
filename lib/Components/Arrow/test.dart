import 'dart:ui';

import 'package:demo_nikita/Components/constants.dart';
import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = kgolder
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;


    Path path0 = Path();
    path0.moveTo(size.width*0.3875444,size.height*0.2031400);
    path0.lineTo(size.width*0.6106889,size.height*0.2072200);
    path0.lineTo(size.width*0.5007333,size.height*0.4911000);
    path0.lineTo(size.width*0.3866667,size.height*0.1960000);

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
