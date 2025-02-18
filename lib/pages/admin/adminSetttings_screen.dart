import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/componets/seet_Log_row.dart';
import 'package:mgh/componets/seet_row.dart';
import 'package:mgh/pages/admin/admin_add_property.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class AdminSetttingsScreen extends StatelessWidget {
  const AdminSetttingsScreen({super.key});

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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.blue[800],
                  //   radius: 50,
                  // ),
                  // const SizedBox(
                  //   width: 20,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text(
                  //         'User Name',
                  //         style:
                  //             TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  //       ),
                  //       const SizedBox(
                  //         height: 8,
                  //       ),
                  //       GestureDetector(
                  //         child: Container(
                  //           decoration: const BoxDecoration(
                  //               border: Border(
                  //                   bottom:
                  //                       BorderSide(width: 2, color: Colors.black))),
                  //           child: const Text(
                  //             'View and edit profile',
                  //             style: TextStyle(fontWeight: FontWeight.w500),
                  //           ),
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SeetLogRow(
              title: 'Add Proprty  ',
              icon: Icons.add_business_outlined,
              onTap: () {
                cubit.clear();
                Navigator.of(context).pushNamed(AdminAddProperty.route);
              },
            ),
            const SizedBox(
              height: 1,
            ),
            SeetRow(
              title: 'Favorites',
              subTilte: 'All Of Your Favorites',
              icon: Icons.star,
              onTap: () {},
            ),
            const SizedBox(
              height: 2,
            ),
            SeetRow(
              title: 'Language ',
              subTilte: 'Change Language? ',
              icon: Icons.language,
              onTap: () {},
            ),
            const SizedBox(
              height: 2,
            ),
            const SizedBox(
              height: 2,
            ),
            SeetLogRow(
              title: 'Logout ',
              icon: Icons.login,
              onTap: () {
                cubit.logout(context);
              },
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        );
      },
    );
  }
}
