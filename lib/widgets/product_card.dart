import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:warehouse_management/models/product.dart';
import 'package:warehouse_management/screens/product_details_page.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class ProductCard extends StatelessWidget {
  final Product? product;
  final String? docID;
  const ProductCard({Key? key, this.product, this.docID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              docID: docID,
              product: product,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: 147,
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
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SizedBox(
              height: 87,
              width: 87,
              child: (product!.image == null)
                  ? Center(
                      child: Icon(
                        Icons.image,
                        color: ColorPalette.nileBlue.withOpacity(0.5),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: product!.image!,
                        errorWidget: (context, s, a) {
                          return Icon(
                            Icons.image,
                            color: ColorPalette.nileBlue.withOpacity(0.5),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      color: ColorPalette.timberGreen,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: ColorPalette.timberGreen.withOpacity(0.44),
                      ),
                      Text(
                        product!.location ?? '-',
                        maxLines: 1,
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        product!.group ?? '-',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                          top: 2,
                          right: 5,
                        ),
                        child: Icon(
                          Icons.circle,
                          size: 5,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                      Text(
                        product!.company ?? '-',
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.timberGreen.withOpacity(0.44),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    // width: 100,
                    child: Text(
                      product!.description ?? '-',
                      maxLines: 3,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 11,
                        color: ColorPalette.timberGreen.withOpacity(0.35),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "₹${product!.cost ?? '-'}",
                    style: const TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 14,
                      color: ColorPalette.nileBlue,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${product!.quantity ?? '-'}\nAvailable",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 12,
                          color: ColorPalette.nileBlue,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
