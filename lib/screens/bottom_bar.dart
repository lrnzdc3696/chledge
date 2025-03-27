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
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withAlpha(153),
        backgroundColor: Theme.of(context).colorScheme.surface,
        type: BottomNavigationBarType.fixed, // To stop icons from moving
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.event_note), label: "Logs"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Overview"),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: "Payroll"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      floatingActionButton: Padding(
        padding:
            const EdgeInsets.only(right: 30), // Adjust left padding as needed
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              // Add your logic here for adding a new item
              print("Add button pressed");
              // You can navigate to a new screen or show a dialog here
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, // Position the button
    );
  }
}
