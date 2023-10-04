import 'package:blog_explorer/model/blog/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../controller/api/blogs_api_controller.dart';
import '../../controller/events/blog_screen_events_eontroller.dart';
import '../../controller/routes/routes_name_controller.dart';
import '../widget/blog_container_widget.dart';
import '../widget/custom_appbar_widget.dart';
import '../widget/menu_widget.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    final controller = Provider.of<APIController>(context, listen: false);
    controller.fetchBlogs();
    super.initState();
  }

  void favoriteScreen() {
    Navigator.of(context).pushNamed(RoutesNamesController.favoriteScreen);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<APIController>(context);
    final events = Provider.of<BlogScreenEventsController>(context);
    return SafeArea(
      child: Scaffold(
        key: events.scaffoldKey,
        drawer: MenuWidget(onPressed: favoriteScreen),
        appBar: CustomAppBarWidget(
          path: 'assets/icons/Menu.svg',
          onPressed: events.openDrawer,
        ),
        body: controller.isLoading
            ? getLoadingWidget()
            : controller.errorMessage.isNotEmpty
                ? getErrorWidget(controller.errorMessage)
                : getBlogListWidget(controller.blogModel),
      ),
    );
  }
}

Widget getLoadingWidget() {
  return const Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SpinKitFadingCircle(
          color: Color(0x00593b15),
          size: 80.0,
        ),
        Text(
          "Loading....",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0x00593b15),
          ),
        ),
      ],
    ),
  );
}

Widget getErrorWidget(String errorMessage) {
  return Center(
    child: Text(
      errorMessage,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(0, 255, 0, 0),
      ),
    ),
  );
}

Widget getBlogListWidget(BlogModel blogModel) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        padding: const EdgeInsets.only(
          top: 21.0,
          left: 47.0,
          right: 16.0,
        ),
        child: const Text(
          'Blogs',
          style: TextStyle(
            color: Color(0xFF593B15),
            fontSize: 32,
            fontFamily: 'Faustina',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 21.0,
            left: 27.0,
            right: 16.0,
          ),
          child: ListView.builder(
            itemBuilder: ((context, index) => BlogContainerWidget(
                  netWorkImage: blogModel.blogs![index].imageUrl!,
                  title: blogModel.blogs![index].title!,
                  id: blogModel.blogs![index].id!,
                )),
            itemCount: blogModel.blogs!.length,
          ),
        ),
      ),
    ],
  );
}
