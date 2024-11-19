import 'package:flutter/material.dart';

class ListBrand extends StatelessWidget {
  const ListBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        brandItem("assets/images/brand/audi.png"),
        brandItem("assets/images/brand/bmw.png"),
        brandItem("assets/images/brand/daihatsu.png"),
        brandItem("assets/images/brand/honda.png"),
        brandItem("assets/images/brand/mercedes.png"),
        brandItem("assets/images/brand/mitsubishi.png"),
        brandItem("assets/images/brand/porsche.png"),
        brandItem("assets/images/brand/toyota.png"),
      ],
    );
  }

  Widget brandItem(String imagePath) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
