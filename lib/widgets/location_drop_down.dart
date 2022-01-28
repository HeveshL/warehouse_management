import 'package:flutter/material.dart';
import 'package:warehouse_management/models/product.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class LocationDD extends StatefulWidget {
  final Product? product;

  const LocationDD({Key? key, this.product}) : super(key: key);
  @override
  _LocationDDState createState() => _LocationDDState();
}

class _LocationDDState extends State<LocationDD> {
  final List<String> locations = [
    "Godown 1, 1st Floor",
    "Godown 1, 2nd Floor",
    "Godown 2, 1st Floor",
    "Godown 2, 2nd Floor",
  ];
  @override
  Widget build(BuildContext context) {
    widget.product!.location ??= locations[0];
    return Container(
      decoration: BoxDecoration(
        color: ColorPalette.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 3),
            blurRadius: 6,
            color: ColorPalette.nileBlue.withOpacity(0.1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2.5),
      child: DropdownButton(
        iconSize: 30,
        underline: const SizedBox(),
        value: widget.product!.location,
        onChanged: (dynamic newValue) {
          setState(() {
            widget.product!.location = newValue as String?;
          });
        },
        items: locations.map((process) {
          return DropdownMenuItem(
            value: process,
            child: Text(
              process,
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 16,
                color: ColorPalette.nileBlue.withOpacity(0.58),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
