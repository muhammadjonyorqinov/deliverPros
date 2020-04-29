import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 4,
          itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25),
                topLeft: Radius.circular(25),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(25),
              ),
              child: Container(
                color: Colors.grey,
              )),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 263,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
        ),
        baseColor: Colors.grey[350],
        highlightColor: Colors.white);
  }
}
