import 'package:flutter/material.dart';
import 'package:instagram/src/ui/screens/home.dart';
import 'package:instagram/src/ui/screens/profile/profile.dart';
import 'package:instagram/src/ui/screens/search.dart';

import 'createpost.dart';
import 'notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeScreen(),
      const SearchPage(),
      const CreatePostPage(),
      const NotificationsPage(),
      const ProfilePage()
    ];
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
            children: pages
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
    );
  }
}

/*
import 'createpost.dart';
import 'notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
        vsync: this, duration: const Duration(milliseconds: 0));
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
*/

/*
mainAxisSize: MainAxisSize.min,
children: <Widget>[
Builder(
builder: (context) {
final userId = context.select(
(AuthenticationBloc bloc) => bloc.state.user.id,
);
return Text('UserID: $userId');
},
),
ElevatedButton(
child: const Text('Logout'),
onPressed: () {
context
    .read<AuthenticationBloc>()
    .add(AuthenticationLogoutRequested());
},
),
],*/
