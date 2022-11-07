import 'dart:ui' as ui;
import 'dart:ui' ;

import 'package:flutter/material.dart';

// //Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(0,size.height*0.3238095);
    path_0.cubicTo(0,size.height*0.2186124,size.width*0.02082398,size.height*0.1333333,size.width*0.04651163,size.height*0.1333333);
    path_0.lineTo(size.width*0.3518953,size.height*0.1333333);
    path_0.cubicTo(size.width*0.3775186,size.height*0.1333333,size.width*0.4029000,size.height*0.1129381,size.width*0.4266233,size.height*0.07328286);
    path_0.lineTo(size.width*0.4338674,size.height*0.06117381);
    path_0.cubicTo(size.width*0.4790884,size.height*-0.01441476,size.width*0.5298814,size.height*-0.01122152,size.width*0.5745140,size.height*0.07001610);
    path_0.cubicTo(size.width*0.5974512,size.height*0.1117629,size.width*0.6222721,size.height*0.1333333,size.width*0.6473721,size.height*0.1333333);
    path_0.lineTo(size.width*0.9534884,size.height*0.1333333);
    path_0.cubicTo(size.width*0.9791767,size.height*0.1333333,size.width,size.height*0.2186124,size.width,size.height*0.3238095);
    path_0.lineTo(size.width,size.height);
    path_0.lineTo(0,size.height);
    path_0.lineTo(0,size.height*0.3238095);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xff3F3CC7).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}