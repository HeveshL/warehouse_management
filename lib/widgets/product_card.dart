import 'package:flutter/material.dart';
import 'package:warehouse_management/models/product.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 130,
        decoration: BoxDecoration(
          color: ColorPalette.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              blurRadius: 6,
              color: const Color(0xff000000).withOpacity(0.06),
            ),
          ],
        ),
        padding: const EdgeInsets.all(11),
        child: Row(),
      ),
    );
  }
}
