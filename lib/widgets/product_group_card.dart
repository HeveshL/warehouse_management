import 'package:flutter/material.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class ProductGroupCard extends StatelessWidget {
  final String name;

  const ProductGroupCard({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 6,
              color: const Color(0xff000000).withOpacity(0.16),
            ),
          ],
        ),
        child: Text(
          name,
          style: TextStyle(
            fontFamily: "Nunito",
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}