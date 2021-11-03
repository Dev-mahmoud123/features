import 'package:flutter/material.dart';

import 'bottom_navy_bar_item.dart';

class ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const ItemWidget({
    Key? key,
    required this.iconSize,
    required this.isSelected,
    required this.item,
    required this.backgroundColor,
    required this.itemCornerRadius,
    required this.animationDuration,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        duration: animationDuration,
        width: isSelected ? 130.0 : 50.0,
        height: double.maxFinite,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 130.0 : 50.0,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconTheme(
                  data: IconThemeData(
                    color: isSelected
                        ? item.activeColor
                        : item.inActiveColor ?? item.activeColor,
                  ),
                  child: item.icon,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: DefaultTextStyle.merge(
                        textAlign: item.textAlign,
                        maxLines: 1,
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        child: item.title,
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
