import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/utils/colors.dart';

class ProductText extends StatelessWidget {
  final Color? color;
  final String text;
  double size, height;
  final FontWeight? weight;
  bool wrap;

  ProductText({
    Key? key,
    this.color = const Color(0xFF000000),
    required this.text,
    this.size = 14,
    this.height = 1,
    this.weight = FontWeight.w400,
    this.wrap = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: wrap,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
        fontSize: size,
        fontWeight: weight,
        color: color,
        height: height,
      ),
    );
  }
}