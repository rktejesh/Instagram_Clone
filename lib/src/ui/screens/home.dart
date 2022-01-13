import 'package:flutter/material.dart';
import 'package:instagram/src/ui/widgets/stories_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Center(
            child: Text(
              "Instagram",
            ),
          ),
          leading: const Icon(Icons.add_box_outlined),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.messenger_outline_outlined),
            )
          ],
        ),
        body: const PostFeed()
        );
  }
}

class PostFeed extends StatefulWidget {
  const PostFeed({Key? key}) : super(key: key);

  @override
  _PostFeedState createState() => _PostFeedState();
}

class _PostFeedState extends State<PostFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Row(
                children: <Widget>[
                  const ProfileStories(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [Text("IamGroot"), Text("Milano")],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              Image.network(
                  "https://i.pinimg.com/564x/02/78/1e/02781ec819912e8e5a5d1f4794e7d375.jpg"),
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_outline),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.mode_comment_outlined),
                        onPressed: () {},
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.near_me_outlined)),
                      const Spacer(),
                      IconButton(onPressed: (){},
                          icon: const Icon(Icons.bookmark_border_rounded)
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left:15.0),
                        child: Text(
                          "WeAreGroot",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Text("You are Groot!!!!"),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_outline))
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }
}

class StoriesFeed extends StatefulWidget {
  const StoriesFeed({Key? key}) : super(key: key);

  @override
  _StoriesFeedState createState() => _StoriesFeedState();
}

class _StoriesFeedState extends State<StoriesFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return CircleAvatar(
            backgroundColor: Colors.brown.shade800,
            child: const Text('AH'),
          );
        }
    );
  }
}
