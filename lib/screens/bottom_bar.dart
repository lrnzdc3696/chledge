import 'package:chledge/screens/logs.dart';
import 'package:chledge/screens/overview.dart';
import 'package:chledge/screens/payroll.dart';
import 'package:chledge/screens/settings.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Logs(),
    Overview(),
    Payroll(),
    Settings(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Colors.white,
          title: const Center(child: Text("OwO"))),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // type: BottomNavigationBarType.fixed,  // To stop icons from moving
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "Logs"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Overview"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Payroll"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
