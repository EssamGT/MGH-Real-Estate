import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mgh/componets/image_generate.dart';
import 'package:mgh/pages/admin/adminhome_screen.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class DetailsScreen extends StatelessWidget {
  // final  List<String> image;
  static const String route = 'DetailsScreen';

  const DetailsScreen({super.key});
  // const DetailsScreen(this.image, {super.key} );
  Numberff(int number) {
    String formattedNumber = NumberFormat('#,##0').format(number);
    return formattedNumber;
  }
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final Map<String, dynamic> data = (routeArgument['data']);
    List<String> imageUrl = List<String>.from(data['images']);
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              forceMaterialTransparency: true,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              actions: [
                IconButton(
                  onPressed: () {
                    print('${cubit.userData['userFavoritsList']}');
                  },
                  icon: const Icon(Icons.star_rate),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                  color: Colors.white,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ImageGenerate(
                    imageUrl,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EGP ${Numberff(data['price'])} ",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${data['title']}",
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.redAccent,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              '${data['state']}',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_pin),
                            Text(
                              '${data['location']}',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                              border:
                                  Border.fromBorderSide(BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.grid_view_sharp),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('Area(m2)'),
                                        Text('${data['area']}')
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.home_work_outlined),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Type'),
                                        Text('${data['type']}')
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.bed_sharp,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('BedRooms'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('${data['bedrooms']}')
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.bathtub_outlined),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('BathRooms'),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('${data['bathrooms']}')
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.thumb_up_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      children: [
                                        Text('Finishing'),
                                        Text('${data['finifhin']}')
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.chair),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Furnished'),
                                        Text('${data['furnished']}')
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                              border:
                                  Border.fromBorderSide(BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              "Descripiton",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('${data['description']}'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: const BoxDecoration(
                              border:
                                  Border.fromBorderSide(BorderSide(width: 1))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: bottomNavBgColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(
                            (Icons.phone_in_talk_sharp),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Call',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Icon(
                            (Icons.sms),
                            color: Colors.white,
                            size: 40,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'SMS',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MaterialButton(
                        onPressed: () {},
                        color: bottomNavBgColor.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                          'assets/images/whatsapp.png',
                          scale: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
