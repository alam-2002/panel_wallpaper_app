import 'package:flutter/material.dart';
import 'package:panel_wallpaper_app/pages/account_page.dart';
import 'package:panel_wallpaper_app/pages/explore_page.dart';
import 'package:panel_wallpaper_app/pages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isVisible = true;
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(
        afterScrollResult: afterScrollResult,
      ),
      ExplorePage(),
      AccountPage(),
    ];
  }

  afterScrollResult(bool visibility) {
    setState(() {
      _isVisible = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: _isVisible ? 65 : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.black,
              unselectedItemColor: Colors.grey,
              iconSize: 32,
              currentIndex: _currentIndex,
              elevation: 0,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Explore'),
                BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: 'Account'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
