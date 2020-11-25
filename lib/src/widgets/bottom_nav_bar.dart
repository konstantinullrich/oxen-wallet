import 'package:flutter/material.dart';
import 'package:oxen_wallet/routes.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({ this.currentIndex });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: 'History'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Wallet'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile'
        )
      ],
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      currentIndex: currentIndex,
      onTap: (int index) {
        if (index != currentIndex) {
          switch(index) {
            // case 0:
            //   Navigator.of(context).pushNamed(Routes.history);
            case 1:
              Navigator.of(context).pushNamed(Routes.dashboard);
              break;
            case 2:
              Navigator.of(context).pushNamed(Routes.profile);
              break;
          }
        }
      },
    );
  }
  
}