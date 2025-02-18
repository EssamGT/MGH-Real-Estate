import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:mgh/componets/drop_down_menu.dart';
import 'package:mgh/pages/admin/admin_edit_screen.dart';
import 'package:mgh/pages/admin/admindetails_screen.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

// ignore: must_be_immutable
class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});
  static const String route = 'Adminhome_screen';
  // List<List<String>> image = [
  //   ['assets/images/2.jpg', 'assets/images/1.jpg', 'assets/images/3.jpg'],
  //   [
  //     'assets/images/3.jpg',
  //     'assets/images/2.jpg',
  //     'assets/images/1.jpg',
  //   ]
  // ];
  Numberff(int number) {
    String formattedNumber = NumberFormat('#,##0').format(number);
    return formattedNumber;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cubit.appData.length,
                itemBuilder: (
                  context,
                  index,
                ) =>
                    Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AdminDetailsScreen.route, arguments: {
                        'data': cubit.appData[index],
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // border: Border.fromBorderSide(
                        //     BorderSide(width: 2, color: Colors.black)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                            // decoration: BoxDecoration(
                            //   border:  Border.fromBorderSide(
                            // BorderSide(width: 2, color: Colors.black)
                            // ),
                            // ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: cubit.appData[index]['images'][0],
                                placeholder: (context, url) => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                ),
                                errorWidget: (context, url, error) => Center(
                                  child: Text('Image Not Found'),
                                ),
                                fadeInDuration: Duration(milliseconds: 10),
                                cacheManager: AppLogic.customCacheManger,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${cubit.appData[index]['title']}",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            print(
                                                "#########################################${cubit.appData[index]['unitid']}");
                                            cubit.deleteProperty(context,
                                                "${cubit.appData[index]['unitid']}");
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          minWidth: 5,
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            cubit.clear();
                                            Navigator.of(context).pushNamed(
                                                AdminEditScreen.route,
                                                arguments: {
                                                  'data': cubit.appData[index],
                                                });
                                          },
                                          child: Icon(Icons.edit),
                                          minWidth: 5,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'EGP',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      Numberff(cubit.appData[index]['price']),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Center(
                                          child: Text(
                                        cubit.appData[index]['state'],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      )),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.bed_sharp),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${cubit.appData[index]['bedrooms']}'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.bathtub_outlined),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                        '${cubit.appData[index]['bathrooms']}'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(Icons.space_dashboard),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text('${cubit.appData[index]['area']}'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(' ${cubit.appData[index]['location']}'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        width: 1, color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: MaterialButton(
                                          onPressed: () {
                                            cubit.makePhoneCall('01017003144');
                                          },
                                          color:
                                              bottomNavBgColor.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  (Icons.phone_in_talk_sharp),
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'Call',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: MaterialButton(
                                          onPressed: () {
                                            cubit.makeSms('01017003144');
                                          },
                                          color:
                                              bottomNavBgColor.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: const Row(
                                              children: [
                                                Icon(
                                                  (Icons.sms),
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  'SMS',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      // Container(
                                      //   child: MaterialButton(
                                      //     onPressed: () {
                                      //       cubit.makeWhatsapp('Egypt: +20 1017003144');
                                      //     },
                                      //     color:
                                      //         bottomNavBgColor.withOpacity(0.8),
                                      //     shape: RoundedRectangleBorder(
                                      //         borderRadius:
                                      //             BorderRadius.circular(15)),
                                      //     child: Image.asset(
                                      //       'assets/images/whatsapp.png',
                                      //       scale: 20,
                                      //     ),
                                      //   ),
                                      // ),
                                      Container(
                                        child: MaterialButton(
                                          onPressed: () {
                                            cubit.makeWhatsapp(
                                                'Egypt: +20 1017003144');
                                          },
                                          color:
                                              bottomNavBgColor.withOpacity(0.8),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/whatsapp.png',
                                                  scale: 20,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                        color: bottomNavBgColor, width: 1.5)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
