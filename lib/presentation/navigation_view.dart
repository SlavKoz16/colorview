import 'package:colorview/presentation/ads/addView.dart';
import 'package:colorview/presentation/profile/list_profiles.dart';
import 'package:colorview/presentation/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:colorview/presentation/events/eventsView.dart';

List<Widget> _screens = [
  AdminView(),
  EventView(),
  ListPanel(),
  ProfileView(),
];
int _index = 0;

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeScreen,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.event,color: Colors.black), label: 'Анонсы'),
          BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp,color: Colors.black), label: 'Люди'),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black), label: 'Профиль'),
        ],
      ),
    );
  }

  void changeScreen(index) {
    _index = index;
    setState(() {});
  }
}
