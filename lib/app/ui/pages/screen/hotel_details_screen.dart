import 'package:flutter/material.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../data/models/hotel_model.dart';

class HotelDetailsScreen extends StatefulWidget {
  const HotelDetailsScreen({super.key});

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  final HotelModel hotelModel = Get.arguments as HotelModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetsHelper.bigHotelImage1,
              fit: BoxFit.fill),
        ),
        Positioned(
          top: kMediumPadding * 3,
          left: kMediumPadding,
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              height: 50,
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                FontAwesomeIcons.arrowLeft,
                size: 18,
              ),
            ),
            onTap: () {
              Get.back();
            },
          ),
        ),
        Positioned(
          top: kMediumPadding * 3,
          right: kMediumPadding,
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(kItemPadding),
              height: 50,
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(kDefaultPadding),
                ),
                color: Colors.white,
              ),
              child: const Icon(
                FontAwesomeIcons.solidHeart,
                size: 18,
                color: Colors.redAccent,
              ),
            ),
            onTap: () {},
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.3,
          maxChildSize: 0.8,
          builder: (context, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: kMediumPadding),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  )),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: Container(
                      height: 5,
                      width: 60,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(kItemPadding),
                          ),
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        Row(
                          children: [
                            Text(
                              hotelModel.hotelName,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '\$${hotelModel.price}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Text(' /night')
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          children: [
                            // ImageHelper.loadFromAsset(hotelModel.hotelImage),
                            const Icon(
                              FontAwesomeIcons.locationDot,
                              color: Color(0xfff77777),
                            ),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            Text(hotelModel.location),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.solidStar,
                              color: Color(0xffFFC107),
                            ),
                            const SizedBox(
                              width: kMinPadding,
                            ),
                            Text(
                              '''${hotelModel.star.toString()}/5''',
                            ),
                            Text(
                              ' (${hotelModel.numberOfReview} reviews)',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                          'Information:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(hotelModel.hotelInformation),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        const Text(
                          'Location:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        hotelModel.hotelLocationInformation != null
                            ? Text(hotelModel.hotelLocationInformation!)
                            : Text(
                                'This place does not have description',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8)),
                                textAlign: TextAlign.center,
                              ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        ImageHelper.loadFromAsset(AssetsHelper.defaultMap),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        CustomButtonWidget(
                          title: 'Select Room',
                          onTap: () {
                            Get.toNamed(Routes.HOTEL_ROOM_SELECT_DETAIL);
                          },
                        ),
                        const SizedBox(
                          height: kMediumPadding,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
      ],
    ));
  }
}
