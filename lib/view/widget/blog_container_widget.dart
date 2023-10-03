import 'package:flutter/material.dart';

class BlogContainerWidget extends StatelessWidget {
  const BlogContainerWidget({super.key, required this.netWorkImage});
  final String netWorkImage;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive dimensions based on screen width
    double containerWidth = screenWidth * 0.9; // 90% of the screen width
    double containerHeight =
        containerWidth * 1.065; // Maintain the aspect ratio

    return SizedBox(
      width: containerWidth,
      height: containerHeight,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: containerWidth,
              height: containerHeight,
              decoration: ShapeDecoration(
                color: const Color(0xFFD9D9D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    containerWidth * 0.1,
                  ), // Responsive border radius
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: containerWidth,
              height:
                  containerHeight * 0.76, // Adjust the height proportionally
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(netWorkImage),
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    containerWidth * 0.1,
                  ), // Responsive border radius
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
