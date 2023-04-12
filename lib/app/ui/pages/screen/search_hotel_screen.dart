import 'package:flutter/widgets.dart';
import 'package:flutter_train/app/data/models/hotel_model.dart';
import 'package:flutter_train/app/helpers/assets_helpers.dart';
import 'package:flutter_train/app/ui/global_widgets/appbar_container.dart';
import 'package:flutter_train/app/ui/global_widgets/item_hotel_widget.dart';

class SearchHotelScreen extends StatefulWidget {
  const SearchHotelScreen({super.key});

  @override
  State<SearchHotelScreen> createState() => _SearchHotelScreenState();
}

class _SearchHotelScreenState extends State<SearchHotelScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
        hotelImage: AssetsHelper.hotel1,
        hotelName: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        star: 4.5,
        numberOfReview: 3241,
        price: 143,
        hotelInformation:
            ''''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
        hotelLocationInformation:
            '''Located in the famous neighborhood of Seoul, 
Grand Luxury’s is set in a building built in the 
2010s.'''),
    HotelModel(
        hotelImage: AssetsHelper.hotel2,
        hotelName: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        star: 4.5,
        numberOfReview: 3241,
        price: 143,
        hotelInformation:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
    HotelModel(
        hotelImage: AssetsHelper.hotel3,
        hotelName: 'Royal Palm Heritage',
        location: 'Purwokerto, Jateng',
        awayKilometer: '364 m',
        star: 4.5,
        numberOfReview: 3241,
        price: 143,
        hotelInformation:
            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
  ];

  @override
  Widget build(BuildContext context) {
    return AppbarContainerWidget(
      titleString: 'Hotels',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children:
              listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}
