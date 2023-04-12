import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/google_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/social_button_widget.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:flutter_train/app/ui/utils/textstyle_ext.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var isVisible = false.obs;
    var rememberMe = false.obs;

    return AppbarContainerWidget(
      titleString: 'Login',
      subTitleString: 'Hi, welcome back',
      implementLeading: true,
      child: Container(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding),
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => EmailValidator.validate(value!)
                      ? null
                      : 'Please enter a valid email',
                  style: TextStyles.defaultStyle.bold,
                  decoration: InputDecoration(
                      icon: const Icon(
                        Icons.email,
                        color: ColorPalette.primaryColor,
                      ),
                      hintText: 'Your email',
                      labelStyle: MaterialStateTextStyle.resolveWith((states) {
                        if (states.contains(MaterialState.focused)) {
                          return const TextStyle(fontWeight: FontWeight.normal);
                        } else {
                          return TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.bold);
                        }
                      }),
                      labelText: 'Email',
                      border: InputBorder.none,
                      hintStyle: TextStyles.defaultStyle.bold),
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding),
                ),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => TextFormField(
                          style: TextStyles.defaultStyle.bold,
                          obscureText: !isVisible.value,
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.email,
                                color: ColorPalette.primaryColor,
                              ),
                              hintText: 'Your password',
                              labelStyle:
                                  MaterialStateTextStyle.resolveWith((states) {
                                if (states.contains(MaterialState.focused)) {
                                  return const TextStyle(
                                      fontWeight: FontWeight.normal);
                                } else {
                                  return TextStyle(
                                      color: Colors.black.withOpacity(0.3),
                                      fontWeight: FontWeight.bold);
                                }
                              }),
                              labelText: 'Password',
                              border: InputBorder.none,
                              hintStyle: TextStyles.defaultStyle.bold),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Obx(() => Icon(isVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility)),
                      onTap: () {
                        isVisible.value = !isVisible.value;
                      },
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  padding: const EdgeInsets.symmetric(horizontal: kMinPadding),
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(kMinPadding)),
                    color: Colors.white,
                  ),
                  child: Obx(
                    () => Checkbox(
                      value: rememberMe.value,
                      onChanged: (value) {
                        rememberMe.value = value!;
                      },
                      side: BorderSide.none,
                      // shape: const CircleBorder(),
                      checkColor: ColorPalette.primaryColor,
                      fillColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                    ),
                  ),
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(color: Color(0xff313131)),
                ),
                const Spacer(),
                GestureDetector(
                  child: const Text('Forgot password?'),
                  onTap: () {},
                )
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            CustomButtonWidget(
              title: 'Login',
              onTap: () {},
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
              // color: Colors.lightBlue,
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text('or login with'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              children: [
                Expanded(
                  child: SocialButtonWidget(
                    logo: const GoogleLogo(
                      size: 25,
                    ),
                    title: 'Google',
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: kMediumPadding,
                ),
                Expanded(
                  child: SocialButtonWidget(
                    title: 'Facebook',
                    color: Colors.blue.shade900,
                    logo: const Icon(
                      Icons.facebook,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('''Don't have an account?'''),
                    Text(
                      ' Sign up',
                      style: TextStyle(
                          color: ColorPalette.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
