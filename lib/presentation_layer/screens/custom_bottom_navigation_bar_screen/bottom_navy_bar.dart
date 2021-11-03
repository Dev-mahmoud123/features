import 'package:flutter/material.dart';
import 'package:tasky/presentation_layer/screens/custom_bottom_navigation_bar_screen/bottom_navy_bar_item.dart';
import 'package:tasky/presentation_layer/screens/custom_bottom_navigation_bar_screen/item_widget.dart';

class BottomNavyBar extends StatelessWidget {
  final int selectedIndex;
  final bool showElevation;
  final double iconSize;
  final Color? backgroundColor;
  final double itemCornerRadius;
  final double containerHeight;
  final Duration animationDuration;
  final ValueChanged<int> onItemSelected;
  final Curve curve;
  final MainAxisAlignment mainAxisAlignment;
  final List<BottomNavyBarItem> items;

  const BottomNavyBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 50.0,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 55,
    this.animationDuration = const Duration(milliseconds: 270),
    required this.onItemSelected,
    required this.items,
    this.curve = Curves.linear,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(color: Colors.black12, blurRadius: 2),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: ItemWidget(
                  backgroundColor: bgColor,
                  animationDuration: animationDuration,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  item: item,
                  itemCornerRadius: itemCornerRadius,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
