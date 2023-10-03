import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogContainerWidget extends StatelessWidget {
  const BlogContainerWidget(
      {super.key, required this.netWorkImage, required this.title});
  final String netWorkImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive dimensions based on screen width
    double containerWidth = screenWidth * 0.9; // 90% of the screen width
    double containerHeight =
        containerWidth * 1.065; // Maintain the aspect ratio

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 36.0,
      ),
      child: SizedBox(
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
            Positioned(
              left: containerHeight * 0.12,
              top: containerHeight * 0.78,
              child: SizedBox(
                width: containerWidth * 0.8,
                height: containerHeight * 0.3,
                child: Text(
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  title,
                  style: GoogleFonts.faustina(
                    color: const Color(0xFF593B15),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
