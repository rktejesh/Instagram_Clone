import 'package:flutter/material.dart';
import 'package:instagram/widgets/postgrid.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  late bool _isExpanded;
  late AnimationController _controller;
  late Animation<double> _myAnimation;
  late TabController _profileTabController;

  @override
  void initState() {
    super.initState();
    _profileTabController = TabController(length: 2, vsync: this);
    _isExpanded = true;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _myAnimation = CurvedAnimation(curve: Curves.linear, parent: _controller);
  }

  @override
  void dispose() {
    _profileTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("tejesh__reddy_"), elevation: 0, actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add_box_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        )
      ]),
      body: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.brown.shade800,
                              child: const Text('AH'),
                              radius: 50,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "3 \n",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 25,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Posts',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      )
                                    ])),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "369 \n",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 25,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Followers',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      )
                                    ])),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    text: "426 \n",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 25,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Following',
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      )
                                    ])),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Tejesh Reddy \n A Lucknow"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: const Text("Edit Profile"),
                                    style: ButtonStyle(
                                        side: MaterialStateProperty.all(
                                            const BorderSide(
                                                color: Colors.black,
                                                width: 1))),
                                  ),
                                ),
                                ExpandIcon(
                                  padding: const EdgeInsets.all(0),
                                  isExpanded: _isExpanded,
                                  color: Colors.black,
                                  onPressed: (bool isExpanded) {
                                    setState(() {
                                      _isExpanded = !isExpanded;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            child: const Padding(
                              padding: EdgeInsets.all(0),
                              //TODO suggested profiles
                              child: Text("Suggested profiles"),
                            ),
                            visible: _isExpanded,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverAppBar(
                pinned: true,
                snap: true,
                floating: true,
                toolbarHeight: 0,
                bottom: TabBar(
                    indicatorColor: Colors.black,
                    controller: _profileTabController,
                    labelColor: Colors.black,
                    labelPadding: const EdgeInsets.all(10),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Icon(Icons.grid_on_rounded),
                      Icon(Icons.person_pin_outlined)
                    ]),
              )
            ];
          },
          body: TabBarView(
            controller: _profileTabController,
            children: const [
              PostGrid(),
              PostGrid(),
            ],
          )),
    );
  }
}
