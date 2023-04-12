import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_train/app/data/services/storage/storage_services.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:get/get.dart';
import '../utils/colors_const.dart';
import 'package:appinio_social_share/appinio_social_share.dart';
import '../utils/dimension_const.dart';
import '../utils/textstyle_ext.dart';

class SignupPage extends GetView {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppinioSocialShare appinioSocialShare = AppinioSocialShare();
    return AppbarContainerWidget(
      implementLeading: true,
      bottomText: true,
      titleString: "Signup",
      subTitleString: "Let's create your account",
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
            CustomButtonWidget(
              title: 'Bấm nút này để liên kết tài khoản',
              onTap: () async {
                StorageService box = Get.find<StorageService>();
                // showCountryPicker(
                //   context: context,
                //   onSelect: (Country country) {},
                //   showPhoneCode: false,
                //   countryListTheme: const CountryListThemeData(
                //     inputDecoration: InputDecoration(
                //       labelText: 'Search',
                //       hintText: 'Start typing to search',
                //       prefixIcon: null,
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.all(
                //           Radius.circular(kItemPadding),
                //         ),
                //       ),
                //     ),
                //   ),
                // );
                final LoginResult result = await FacebookAuth.instance
                    .login(); // by default we request the email and the public profile
// or FacebookAuth.i.login()
                if (result.status == LoginStatus.success) {
                  // you are logged
                  final AccessToken accessToken = result.accessToken!;
                  final data = await FacebookAuth.instance.getUserData();
                  box.write('accessToken', accessToken.token);
                } else {
                }
              },
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            CustomButtonWidget(
              title: 'Bấm nút này để share',
              onTap: () async {
                var result = await FlutterShareMe().shareToFacebook(
                    msg: 'Share manhuatop public test',
                    url: 'https://manhuavn.top');
                //     .then((value) => print(value));
              },
            )
          ],
        ),
      ),
    );
  }
}
