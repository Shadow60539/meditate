import 'package:flutter/material.dart';
import 'package:yoga_flutter/core/design/colors.dart';

class WhiteCirclePainter extends CustomPainter {
  final double temp;

  WhiteCirclePainter({this.temp});
  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final w = size.width;
    final Paint whitePaint = Paint()..color = kWhite;
    final rect =
        Rect.fromCircle(center: Offset(w * 0.3, -h * 0.6), radius: h * 1.45*temp);
    return canvas.drawArc(rect, -90, 180, false, whitePaint);
  }

  @override
  bool shouldRepaint(WhiteCirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(WhiteCirclePainter oldDelegate) => true;
}
