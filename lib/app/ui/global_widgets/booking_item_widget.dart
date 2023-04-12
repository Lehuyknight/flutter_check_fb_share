import 'package:flutter/material.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.description,
      this.onTap,
      required this.color,
      required this.iconColor});

  final String title;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final String description;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(kItemPadding),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0), color: iconColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon, color: color),
              ),
            ),
            const SizedBox(
              width: kItemPadding,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: kItemPadding,
                ),
                Text(title),
                Text(
                  description,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
