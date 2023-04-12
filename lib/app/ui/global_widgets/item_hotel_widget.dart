import 'package:flutter/material.dart';
import 'package:flutter_train/app/data/models/hotel_model.dart';
import 'package:flutter_train/app/helpers/image_helpers.dart';
import 'package:flutter_train/app/routes/pages.dart';
import 'package:flutter_train/app/ui/global_widgets/button_widget.dart';
import 'package:flutter_train/app/ui/global_widgets/dashline_widget.dart';
import 'package:flutter_train/app/ui/utils/colors_const.dart';
import 'package:flutter_train/app/ui/utils/dimension_const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: Colors.white),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding,
              vertical: kDefaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      color: Color(0xffF77777),
                    ),
                    const SizedBox(
                      width: kMinPadding,
                    ),
                    Text(hotelModel.location),
                    Expanded(
                      child: Text(
                        ' - ${hotelModel.awayKilometer} from destination',
                        style:
                            const TextStyle(color: ColorPalette.subTitleColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
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
                    Text(hotelModel.star.toString()),
                    Text(
                      ' (${hotelModel.numberOfReview})',
                      style: const TextStyle(color: ColorPalette.subTitleColor),
                    )
                  ],
                ),
                const DashLineWidget(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          const Text('/night')
                        ],
                      ),
                    ),
                    Expanded(
                      child: CustomButtonWidget(
                        title: 'Book a room',
                        onTap: () {
                          Get.toNamed(Routes.HOTEL_DETAIL,
                              arguments: hotelModel);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
