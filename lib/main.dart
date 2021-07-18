import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/screens/createpost.dart';
import 'package:instagram/screens/home.dart';
import 'package:instagram/screens/notifications.dart';
import 'package:instagram/screens/profile.dart';
import 'package:instagram/screens/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(primaryColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const CreatePostPage(),
    const NotificationsPage(),
    const ProfilePage()
  ];
  bool isShowingMenu = false;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: Scaffold(
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: pages,
          ),
          bottomNavigationBar: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home_filled)
              ),
              Tab(
                icon: Icon(Icons.search_outlined),
              ),
              Tab(
                icon: Icon(Icons.slow_motion_video_outlined),
              ),
              Tab(
                icon: Icon(Icons.favorite_outline),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              )
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.black,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
