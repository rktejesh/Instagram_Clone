import 'package:flutter/material.dart';
import 'package:dashed_circle/dashed_circle.dart';
import 'package:instagram/widgets/stories_screen.dart';

import '../data.dart';

class ProfileStories extends StatefulWidget {
  const ProfileStories({Key? key}) : super(key: key);

  @override
  _ProfileStoriesState createState() => _ProfileStoriesState();
}

class _ProfileStoriesState extends State<ProfileStories> with TickerProviderStateMixin{
  late AnimationController controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
  late Animation<double> base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
  late Animation<double> gap = Tween<double>(begin: 0.0, end: 3.0).animate(base)
    ..addListener(() {
      setState(() {});
    });
  late Animation<double> reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: RotationTransition(
          turns: base,
          child: DashedCircle(
            child: RotationTransition(
              turns: reverse,
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  child: Text("data"),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            gapSize: gap.value,
            strokeWidth: 2,
            dashes: 20,
            color: Colors.pink,
          ),
        ),
      ),
      onTap: () {
        controller.forward();
        Navigator.of(context)
            .push(
            MaterialPageRoute(
              builder: (context) => StoryScreen(stories: stories),
            ));
      },
    );
  }
}
