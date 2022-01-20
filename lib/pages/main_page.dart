import 'package:flutter/material.dart';
import 'package:nonton_app/pages/home_page.dart';
import 'package:nonton_app/pages/search_page.dart';

import '../theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const SearchPage(),
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightBlack,
          centerTitle: true,
          title: Text(
            "nonton",
            style: nontonTextStyle.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 0,
        ),
        // drawer: AppDrawer(),
        body: SizedBox.expand(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: lightBlack,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: "Home",
                backgroundColor: lightBlack),
            BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: "Search",
                backgroundColor: lightBlack),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: whiteColor,
          unselectedItemColor: whiteColor.withOpacity(0.3),
          showSelectedLabels: false,
          onTap: _onItemTapped,
        )
        // BottomNavyBar(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   animationDuration: const Duration(milliseconds: 300),
        //   containerHeight: 60,
        //   showElevation: false,
        //   curve: Curves.easeIn,
        //   backgroundColor: lightBlack,
        //   selectedIndex: _currentIndex,
        //   onItemSelected: (index) {
        //     setState(() => _currentIndex = index);
        //     _pageController.jumpToPage(index);
        //   },
        // items: <BottomNavyBarItem>[
        //   BottomNavyBarItem(
        //     title: const Text('Home'),
        //     icon: const Icon(Icons.home),
        //     activeColor: yellowColor,
        //     inactiveColor: whiteColor.withOpacity(0.5),
        //   ),
        //   BottomNavyBarItem(
        //     title: const Text('Search'),
        //     icon: const Icon(Icons.search),
        //     activeColor: yellowColor,
        //     inactiveColor: whiteColor.withOpacity(0.5),
        //   ),
        //   // BottomNavyBarItem(
        //   //   title: const Text('Bookmark'),
        //   //   icon: const Icon(Icons.bookmark),
        //   //   activeColor: yellowColor,
        //   //   inactiveColor: whiteColor.withOpacity(0.5),
        //   // ),
        //   // BottomNavyBarItem(
        //   //   title: const Text('Profil'),
        //   //   icon: const Icon(Icons.person),
        //   //   activeColor: yellowColor,
        //   //   inactiveColor: whiteColor.withOpacity(0.5),
        //   // ),
        // ],

        );
  }
}
