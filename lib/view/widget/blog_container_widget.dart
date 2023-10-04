import 'package:blog_explorer/model/blog/favorite_blog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:like_button/like_button.dart';

import '../../controller/events/blog_screen_events_eontroller.dart';
import '../../controller/routes/routes_name_controller.dart';
import '../../model/shared_preference/app_preference.dart';
// import 'animate_heart.dart';

class BlogContainerWidget extends StatelessWidget {
  const BlogContainerWidget({
    super.key,
    required this.netWorkImage,
    required this.title,
    required this.id,
  });
  final String netWorkImage;
  final String title;
  final String id;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final eventController = Provider.of<BlogScreenEventsController>(context);

    double containerWidth = screenWidth * 0.9;
    double containerHeight =
        containerWidth * 1.065; // Maintain the aspect ratio

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        RoutesNamesController.detailScreen,
        arguments: {
          'title': title,
          'netWorkImage': netWorkImage,
        },
      ),
      onDoubleTap: () {
        eventController.toggleLike();

        AppPreference.addFavoriteBlog(FavoriteBlog(blogId: id));

        Future<void>.delayed(const Duration(milliseconds: 500), () {
          eventController.toggleLike();
        });
      },
      child: Padding(
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

              // if (eventController.isLiked)
              //   Positioned(
              //     right: containerWidth * 0.1,
              //     top: containerHeight * 0.1,
              //     child: AnimatedHeart(
              //       isLiked: eventController.isLiked,
              //     ),
              //   ),
              Positioned(
                left: 0,
                top: 0,
                child: Hero(
                  transitionOnUserGestures: true,
                  placeholderBuilder: (context, heroSize, child) {
                    return SizedBox(
                      width: heroSize.width,
                      height: heroSize.height,
                      child: child,
                    );
                  },
                  tag: title,
                  child: Container(
                    width: containerWidth,
                    height: containerHeight *
                        0.76, // Adjust the height proportionally
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
              ),
              if (eventController.isLiked)
                Center(
                  child: AnimatedOpacity(
                    opacity: eventController.isLiked ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: LikeButton(
                      size: 150,
                      isLiked: eventController.isLiked,
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
      ),
    );
  }
}
