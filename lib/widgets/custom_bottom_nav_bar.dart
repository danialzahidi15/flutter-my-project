import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/gift_card/screen/gift_card_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int index;
  const CustomBottomNavBar({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavBarIcon(
              icon: Icons.home,
              isSelected: index == 0,
              onTap: index != 0
                  ? () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GiftCardScreen(),
                        ),
                      );
                    }
                  : null,
            ),
            const _NavBarIcon(icon: Icons.find_in_page),
            const _NavBarIcon(icon: Icons.card_giftcard),
            const _NavBarIcon(icon: Icons.menu),
          ],
        ),
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final bool isSelected;
  const _NavBarIcon({
    super.key,
    required this.icon,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? Colors.black : Colors.black26;
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
