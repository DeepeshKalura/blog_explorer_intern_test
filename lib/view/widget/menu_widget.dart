import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key, this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFF593B15)),
      child: Stack(
        children: [
          Positioned(
            left: 25,
            top: 50,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xFFC6BDBD),
              child: Center(
                child: SvgPicture.asset(
                  'assets/picture/Man.svg',
                ),
              ),
            ),
          ),
          Positioned(
            left: 112,
            top: 81,
            child: Text(
              'Deepesh  Kalura',
              style: GoogleFonts.faustina(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
          ),
          const Positioned(
            left: 112,
            top: 66,
            child: SizedBox(
              child: Text(
                'Hello There!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Faustina',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 153,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7 - 32,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 384,
            child: Container(
              width: 36.40,
              height: 39,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Positioned(
                    left: 0.14,
                    top: 9.37,
                    child: SizedBox(
                      width: 36.26,
                      height: 29.55,
                      child: Stack(
                        children: [
                          SvgPicture.asset('assets/icons/Mail.svg'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 328,
            child: Container(
              width: 39,
              height: 39,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/icons/Calender.svg'),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 275,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 36,
                height: 36,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: Stack(
                  children: [
                    SvgPicture.asset('assets/icons/Favorite.svg'),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 217,
            child: Container(
              width: 32,
              height: 32,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  SvgPicture.asset('assets/icons/Dashboard.svg'),
                ],
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.7 * 0.3,
            bottom: 50,
            child: SizedBox(
              width: 106,
              height: 26,
              child: Text(
                'version: 0.0.1',
                style: GoogleFonts.faustina(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 89,
            top: 217,
            child: SizedBox(
              width: 127,
              height: 26,
              child: Text(
                'Dashboard',
                style: GoogleFonts.faustina(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 89,
            top: 275,
            child: InkWell(
              onTap: onPressed,
              child: SizedBox(
                width: 127,
                height: 26,
                child: Text(
                  'Favorites',
                  style: GoogleFonts.faustina(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 89,
            top: 335,
            child: SizedBox(
              width: 127,
              height: 26,
              child: Text(
                'Calendar\n',
                style: GoogleFonts.faustina(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 89,
            top: 394,
            child: SizedBox(
              width: 127,
              height: 26,
              child: Text(
                'Mail',
                style: GoogleFonts.faustina(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
