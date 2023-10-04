import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_box_widget.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, required this.path, this.onPressed});

  final String path;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            color: Color(0xFF33230E),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 13,
                top: 24,
                child: InkWell(
                  onTap: onPressed,
                  child: Container(
                    width: 35,
                    height: 35,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: SvgPicture.asset(
                      path,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 2,
                child: SizedBox(
                  child: Text(
                    'Blog Expolarer',
                    style: GoogleFonts.faustina(
                      color: const Color(0xFFAB9476),
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: double.infinity,
          height: 110,
        ),
        const Positioned(
          left: 60,
          bottom: 0,
          child: SearchbarWidget(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
