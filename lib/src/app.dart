import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/blocs/authentication/authentication_bloc.dart';
import 'package:instagram/src/repositories/token.dart';
import 'package:instagram/src/ui/screens/login_page.dart';
import 'package:instagram/src/ui/screens/createpost.dart';
import 'package:instagram/src/ui/screens/home.dart';
import 'package:instagram/src/ui/screens/notifications.dart';
import 'package:instagram/src/ui/screens/profile.dart';
import 'package:instagram/src/ui/screens/search.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if(state is AuthenticationNotAuthenticated){
              return const SplashScreen();
            } else if (state is AuthenticationAuthenticated) {
              return const HomePage();
            } else if (state is AuthenticationLoading) {
              return const LoadingIndicator();
            }
            return const LoadingIndicator();
          }
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
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