import 'package:flutter/material.dart';
import 'package:warehouse_management/models/product.dart';
import 'package:warehouse_management/utils/color_palette.dart';

class LocationDD extends StatefulWidget {
  final Product product;

  const LocationDD({Key key, this.product}) : super(key: key);
  @override
  _LocationDDState createState() => _LocationDDState();
}

class _LocationDDState extends State<LocationDD> {
  @override
  Widget build(BuildContext context) {
    widget.product.location ??= "a";
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
        value: widget.product.location,
        onChanged: (newValue) {
          setState(() {
            widget.product.location = newValue as String;
          });
        },
        items: [
          "a",
          "b",
          "c",
          "d",
        ].map((process) {
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
