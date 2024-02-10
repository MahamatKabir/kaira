import 'package:flutter/material.dart';
import 'package:kaira/screens/city/city_screen.dart';
import 'package:kaira/screens/container/container_list_screen.dart';
import 'package:kaira/screens/continertype/containertype_list_screen.dart';
import 'package:kaira/screens/depenses/expense_list_screen.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {
      'page': const CityListScreen(),
      'title': 'Ville',
    },
    {
      'page': const ContainerTypeListScreen(),
      'title': 'ContainerType',
    },
    {
      'page': const ContainerListScreen(),
      'title': 'Container',
    },
    {
      'page': const ExpenseListScreen(),
      'title': 'Depenses',
    },
  ];
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text( _pages[_selectedIndex]['title']),
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        //unselectedItemColor: isDark ? Colors.white10 : Colors.black12,
        //selectedItemColor: isDark ? Colors.lightBlue.shade200 : Colors.black87,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Icons.apartment : Icons.apartment),
            label: "city",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1
                ? FontAwesomeIcons.house
                : IconlyLight.category),
            label: "Ctype",
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3
                ? Icons.shopping_cart
                : Icons.shopping_cart),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            label: "User",
          ),
        ],
      ),
    );
  }
}
