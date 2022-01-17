import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'WhatsApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyStatelessWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

const List<Tab> tabs = <Tab>[
  Tab(
    text: "cam",
    icon: Icon(Icons.camera_alt),
  ),
  Tab(text: 'CHATS'),
  Tab(text: 'STATUS'),
  Tab(text: 'CALLS'),
];

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: "Search",
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'More options',
            onPressed: () {},
          ),
        ],
      ),
      body: const MyTabController(),
    );
  }
}

class MyTabController extends StatelessWidget {
  const MyTabController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // Your code goes here.
            // To get index of current tab use tabController.index
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text('WhatsApp'),
            backgroundColor: Colors.teal,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: "Search",
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'More options',
                onPressed: () {},
              ),
            ],
            bottom: const TabBar(
              tabs: tabs,
            ),
          ),
          body: TabBarView(
            children: tabs.map((Tab tab) {
              return Center(
                child: Text(
                  '${tab.text!} Tab',
                  style: Theme.of(context).textTheme.headline5,
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
