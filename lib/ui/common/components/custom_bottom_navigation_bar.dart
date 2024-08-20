import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget customNavigationBar(
    {int selectedIndex = 0, void Function(int)? onDestinationSelected}) {
  
  return 

          

          NavigationBar(
            backgroundColor: Colors.white,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home")
                  ,
              NavigationDestination(icon: Icon(Icons.commit), label: "Coins")
                  .box
                  .margin(EdgeInsets.only(right: 30))
                  .make()
                  ,
              NavigationDestination(icon: Icon(Icons.wallet), label: "Wallet")
                  .box
                  .margin(EdgeInsets.only(left: 30))
                  .make(),
              NavigationDestination(icon: Icon(Icons.person), label: "You"),
            ],
          );
    }