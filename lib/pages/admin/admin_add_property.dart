import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/Classes/apprt_type.dart';
import 'package:mgh/componets/drop_down_menu.dart';
import 'package:mgh/componets/imagePicker.dart';
import 'package:mgh/componets/mgh_button.dart';
import 'package:mgh/componets/mgh_dic_text_fileld.dart';
import 'package:mgh/componets/mgh_text_filed.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class AdminAddProperty extends StatelessWidget {
  AdminAddProperty({super.key});
  static const route = 'adminAddProprty';

  final GlobalKey<FormState> _adkey = GlobalKey();

  Color bottomNavBgColor = const Color(0xFF17203A);

  final ApprtType _type = ApprtType();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              'Add New Property',
              style: TextStyle(color: Colors.white),
            ),
            leading: IconButton(
                onPressed: () {
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
                        const ImagePiker(),
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
                        DropDownMenu(
                          menu: _type.state,
                        
                          lastVal: cubit.sstate,
                          hint: 'State',
                        ),
                        DropDownMenu(
                          menu: _type.type,
                          
                          lastVal: cubit.ttype,
                          hint: 'Type',
                        ),
                        DropDownMenu(
                          menu: _type.rooms,
                          
                          lastVal: cubit.rooms,
                          hint: 'Bedrooms',
                        ),
                        DropDownMenu(
                          menu: _type.rooms,
                          lastVal: cubit.brooms,
                          hint: 'Bathrooms',
                        ),
                        DropDownMenu(
                          menu: _type.level,
                          lastVal: cubit.level,
                          hint: 'Level',
                        ),
                        DropDownMenu(
                          menu: _type.finished,
                          lastVal: cubit.finished,
                          hint: 'Finishing',
                        ),
                        DropDownMenu(
                          menu: _type.furnished,
                          lastVal: cubit.furnished,
                          hint: 'Furnished',
                        ),
                        DropDownMenu(
                          menu: _type.payment,
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
                          title: 'Publish',
                          on_press: () {
                            // if (_adkey.currentState!.validate()) {
                            //   print(cubit.ttype.text);
                            //   print(cubit.rooms.text);
                            //   cubit.uploadData();
                            // }
                            cubit.isLooding = true;
                            cubit.uploadData(context);
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
