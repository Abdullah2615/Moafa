import 'package:doctor/model/used_styles.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;
  final VoidCallback onFloatingActionButtonPressed;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTabSelected,
    required this.onFloatingActionButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Mystyles.whiteColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home,
                color: currentIndex == 0 ? Mystyles.blueColor : Mystyles.grey),
            onPressed: () => onTabSelected(0),
          ),
          IconButton(
            icon: Icon(
              Icons.paste_rounded,
              color: currentIndex == 1 ? Mystyles.blueColor : Mystyles.grey,
            ),
            onPressed: () => onTabSelected(1),
          ),
          const SizedBox(width: 40), // Spacer for the notch
          IconButton(
            icon: Icon(
              Icons.monitor_heart_outlined,
              color: currentIndex == 2 ? Mystyles.blueColor : Mystyles.grey,
            ),
            onPressed: () => onTabSelected(2),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 3 ? Mystyles.blueColor : Mystyles.grey,
            ),
            onPressed: () => onTabSelected(3),
          ),
        ],
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomFloatingActionButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      onPressed: onPressed,
      backgroundColor: Mystyles.cyanColor,
      child: const Icon(Icons.add),
    );
  }
}
