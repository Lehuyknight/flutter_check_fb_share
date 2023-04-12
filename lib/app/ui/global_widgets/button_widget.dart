import 'package:flutter/material.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:flutter_train/app/ui/utils/textstyle_ext.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  Function()? onTap;
  final Color? opacity;
  CustomButtonWidget(
      {super.key, required this.title, this.onTap, this.opacity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            gradient:
                opacity == null ? Gradients.defaultGradientBackground : null,
            color: opacity),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyles.defaultStyle.bold.copyWith(
              color:
                  opacity != null ? ColorPalette.primaryColor : Colors.white),
        ),
      ),
    );
  }
}
