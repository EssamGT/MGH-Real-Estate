import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/Classes/apprt_type.dart';
import 'package:mgh/componets/ddd_drop_down_menu.dart';
import 'package:mgh/componets/drop_down_menu.dart';
import 'package:mgh/componets/image_Edit_Picker.dart';
import 'package:mgh/componets/mgh_button.dart';
import 'package:mgh/componets/mgh_dic_text_fileld.dart';
import 'package:mgh/componets/mgh_text_filed.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class AdminEditScreen extends StatelessWidget {
  AdminEditScreen({super.key});
  static const route = 'AdminEditScreen';

  final GlobalKey<FormState> _adkey = GlobalKey();

  Color bottomNavBgColor = const Color(0xFF17203A);

  final ApprtType _type = ApprtType();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        final routeArgument =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        Map appData = routeArgument['data'];
        var cubit = AppLogic.get(context);
        cubit.titel.text = appData['title'];
        cubit.price.text = appData['price'].toString();
        cubit.area.text = appData['area'].toString();
        cubit.location.text = appData['location'];
        cubit.discription.text = appData['description'];
      
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Update Property',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            centerTitle: true,
            backgroundColor: bottomNavBgColor.withOpacity(0.8),
          ),
          body: cubit.isLooding == true
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Form(
                    key: _adkey,
                    child: Column(
                      children: [
                         ImageEditPicker(appData['images']),
                        const SizedBox(
                          height: 15,
                        ),
                        MghTextFiled(
                          'Title',
                          const Icon(Icons.text_fields),
                          false,
                          cubit.titel,
                          'title',
                          'title',
                        ),
                        MghTextFiled(
                          'Price',
                          const Icon(Icons.attach_money_sharp),
                          false,
                          cubit.price,
                          'price',
                          'int',
                        ),
                        MghTextFiled(
                          'Area (m2)',
                          const Icon(Icons.space_dashboard),
                          false,
                          cubit.area,
                          'area',
                          'int',
                        ),
                        MghTextFiled(
                          'Location',
                          const Icon(Icons.location_pin),
                          false,
                          cubit.location,
                          'location',
                          'title',
                        ),
                        DDDropDownMenu(
                          menu: _type.state,
                          selectedVal: appData['state'],
                          lastVal: cubit.sstate,
                          hint: 'State',
                        ),
                        DDDropDownMenu(
                          menu: _type.type,
                          selectedVal: appData['type'],
                          lastVal: cubit.ttype,
                          hint: 'Type',
                        ),
                        DDDropDownMenu(
                          menu: _type.rooms,
                          selectedVal: appData['bedrooms'],
                          lastVal: cubit.rooms,
                          hint: 'Bedrooms',
                        ),
                        DDDropDownMenu(
                          menu: _type.rooms,
                          selectedVal: appData['bathrooms'],
                          lastVal: cubit.brooms,
                          hint: 'Bathrooms',
                        ),
                        DDDropDownMenu(
                          menu: _type.level,
                          selectedVal: appData['level'],
                          lastVal: cubit.level,
                          hint: 'Level',
                        ),
                        DDDropDownMenu(
                          menu: _type.finished,
                          selectedVal: appData['finifhin'],
                          lastVal: cubit.finished,
                          hint: 'Finishing',
                        ),
                        DDDropDownMenu(
                          menu: _type.furnished,
                          selectedVal: appData['furnished'],
                          lastVal: cubit.furnished,
                          hint: 'Furnished',
                        ),
                        DDDropDownMenu(
                          menu: _type.payment,
                          selectedVal: appData['payment'],
                          lastVal: cubit.payment,
                          hint: 'Payment Option',
                        ),
                        MghNdicTextField(
                          'Description',
                          const Icon(Icons.text_increase),
                          cubit.discription,
                          'discribtion',
                          'text',
                        ),
                        MghButton(
                          title: 'Save New  Update ',
                          on_press: () {
                            // if (_adkey.currentState!.validate()) {
                            //   print(cubit.ttype.text);
                            //   print(cubit.rooms.text);
                            //   cubit.uploadData();
                            // }
                            cubit.editProperty(appData['unitid']);
                            AwesomeDialog(
                              context: context,
                              animType: AnimType.scale,
                              dialogType: DialogType.success,
                              title: 'Updated Successfully',
                              onDismissCallback: (type) {
                                Navigator.of(context).pop();
                              },
                            ).show();
                          },
                          color: Colors.black,
                        ),
                        MghButton(
                          title: 'Un Save',
                          on_press: () {
                            cubit.clear();
                          },
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
