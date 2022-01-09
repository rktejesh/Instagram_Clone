import 'package:flutter/material.dart';

class PostGrid extends StatefulWidget {
  const PostGrid({Key? key}) : super(key: key);

  @override
  _PostGridState createState() => _PostGridState();
}

class _PostGridState extends State<PostGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 2, crossAxisSpacing: 2),
      itemCount: 100,
      itemBuilder: (BuildContext ctx, index) {
        return Ink.image(
          image: const NetworkImage(
              "https://i.pinimg.com/564x/02/78/1e/02781ec819912e8e5a5d1f4794e7d375.jpg"),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () {},
            highlightColor: Colors.black26,
          ),
        );
      },
    );
  }
}
