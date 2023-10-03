import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define responsive width and height based on screen size
    final width = screenWidth * 0.8; // 70% of screen width
    const double height = 60;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: 0.02 * height, // 2% of height
        horizontal: 0.07 * width, // 7% of width
      ),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            height / 2,
          ), // Half of the height for a circle shape
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 0.06 * width, // 6% of width
            height: 0.06 * width, // 6% of width
            child: SvgPicture.asset(
              'assets/icons/SearchIcon.svg',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 0.06 * width), // 6% of width
          Text(
            'Search Blogs',
            style: GoogleFonts.robotoFlex(
              color: const Color(0xCC33230E),
              fontSize: 20,
              fontWeight: FontWeight.w200,
            ),
          ),
        ],
      ),
    );
  }
}
