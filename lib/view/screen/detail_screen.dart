import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/custom_appbar_widget.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {super.key, required this.title, required this.netWorkImage});
  final String title;
  final String netWorkImage;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    calculateRandomString();
  }

  void calculateRandomString() {
    while (randomString.length < 10000) {
      randomString += "${widget.title} ";
    }
  }

  String randomString = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBarWidget(
          path: 'assets/icons/arrow.svg',
          onPressed: () => Navigator.of(context).pop(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 27, bottom: 16),
                child: Text(
                  widget.title,
                  style: GoogleFonts.faustina(
                    color: const Color(0xFF593B15),
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Hero(
                transitionOnUserGestures: true,
                placeholderBuilder: (context, heroSize, child) {
                  return SizedBox(
                    width: heroSize.width,
                    height: heroSize.height,
                    child: child,
                  );
                },
                tag: widget.title,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 32,
                    left: 27,
                    bottom: 16,
                    right: 27,
                  ),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.netWorkImage),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 32,
                  left: 27,
                  bottom: 16,
                  right: 7,
                ),
                child: Text(
                  randomString,
                  style: GoogleFonts.faustina(
                    color: const Color(0xFF593B15),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
