import 'package:flutter/material.dart';

enum IndicatorType { start, middle, end }

const double borderRadius = 24;
const double bigBorderRadius = 50;

class CustomRectangle extends StatelessWidget {
  Color backgroundColor;
  Color foregroundColor;
  IndicatorType indicatorType;
  EdgeInsetsGeometry margin;
  Widget child;

  CustomRectangle(
    this.backgroundColor,
    this.foregroundColor,
    this.indicatorType,
    this.margin,
    this.child,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: 120,
        height: 200,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          color: backgroundColor,
          margin: margin,
          child: CustomPaint(
            painter: _CustomRectanglePainter(
              borderRadius: borderRadius,
              bigCornerBorder:
                  indicatorType != IndicatorType.middle ? bigBorderRadius : 0,
              backgroundColor: foregroundColor,
              isOnTop: indicatorType != IndicatorType.start,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class _CustomRectanglePainter extends CustomPainter {
  final double borderRadius;
  final double bigCornerBorder;
  final Color backgroundColor;
  final bool isOnTop;

  const _CustomRectanglePainter({
    required this.borderRadius,
    required this.backgroundColor,
    required this.bigCornerBorder,
    this.isOnTop = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Radius _bigCornerBorderRadius = Radius.circular(bigCornerBorder);
    final Radius _borderRadius = Radius.circular(borderRadius);

    final Paint _paint = Paint();
    _paint.color = backgroundColor;
    _paint.style = PaintingStyle.fill;

    final _halfHeight = size.height / 2;
    RRect _rRect;

    _rRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(0, _halfHeight, size.width, _halfHeight),
      bottomLeft: _borderRadius,
      bottomRight: _borderRadius,
      topLeft: _bigCornerBorderRadius,
    );

    canvas.drawRRect(_rRect, _paint);
  }

  @override
  bool shouldRepaint(_CustomRectanglePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_CustomRectanglePainter oldDelegate) => false;
}
