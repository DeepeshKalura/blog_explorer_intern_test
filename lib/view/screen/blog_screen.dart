import 'package:blog_explorer/model/blog_model/blog_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../controller/api/blogs_api_controller.dart';
import '../widget/blog_container_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<APIController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Screen'),
      ),
      body: controller.isLoading
          ? getLoadingWidget()
          : controller.errorMessage.isNotEmpty
              ? getErrorWidget(controller.errorMessage)
              : getBlogListWidget(controller.blogModel),
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
  return ListView.builder(
    itemBuilder: ((context, index) => BlogContainerWidget(
          netWorkImage: blogModel.blogs![index].imageUrl!,
        )),
    itemCount: blogModel.blogs!.length,
  );
}
