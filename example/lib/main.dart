import 'package:edge_to_edge_resolver/edge_to_edge_resolver.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EdgeToEdgeResolver.setNavigationBarColor(color: Colors.black);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Android Full Screen Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter full screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController();
  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (value) => pageIndex.value = value,
        children: [DempPage(title: 'Dashboard'), DempPage(title: 'Settings')],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailedList()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, value, child) {
          return BottomNavigationBar(
            currentIndex: value,
            elevation: 1,
            fixedColor: Colors.black,
            onTap: (value) => animateTo(value),
            backgroundColor: Colors.purple[100],
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                activeIcon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          );
        },
      ),
    );
  }

  void animateTo(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}

class DempPage extends StatelessWidget {
  final String title;
  const DempPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(title));
  }
}

class DetailedList extends StatelessWidget {
  const DetailedList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: EdgeToEdgeResolverWidget(
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          itemBuilder:
              (context, index) => ListTile(
                tileColor: Colors.purple[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                title: Text('Detail ${index + 1}'),
              ),
          separatorBuilder: (context, index) => SizedBox(height: 12),
          itemCount: 20,
        ),
      ),
    );
  }
}
