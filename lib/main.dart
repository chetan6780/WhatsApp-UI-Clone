import 'package:flutter/material.dart';
import 'package:whatsapp_ui_clone/widgets/ChatTabs.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'WhatsApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const MyTabController(),
      debugShowCheckedModeBanner: false,
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
      length: 4,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            // To get index of current tab use tabController.index
            // ignore: avoid_print
            print('Current tab is ${tabController.index}');
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'WhatsApp',
              textDirection: TextDirection.ltr,
            ),
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
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text("CHATS"),
                ),
                Tab(
                    child: Text(
                  "STATUS",
                )),
                Tab(
                    child: Text(
                  "CALLS",
                )),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: const ChatsTab(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.message),
            backgroundColor: Colors.teal,
          ),
        );
      }),
    );
  }
}
