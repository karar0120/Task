import 'package:flutter/material.dart';
import 'package:noon/Business_logic/Provider/AppProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: Consumer<AppProvider>(
        builder: (context, Modal, child) {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text(
                Modal.text[Modal.CurrentIndex],
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              backgroundColor: Colors.grey[300],
              elevation: 0.0,
            ),
            body: Modal.Pages[Modal.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,
              fixedColor: Colors.red,
              onTap: (index) {
                Modal.ChangeBottomNavigationBar(index);
              },
              currentIndex: Modal.CurrentIndex,
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                  label: "Cateogries",
                  icon: Icon(Icons.apps),
                ),
                BottomNavigationBarItem(
                  label: "Profile",
                  icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label: "Cart",
                  icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
