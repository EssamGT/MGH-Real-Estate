import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/componets/seet_Log_row.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppLogic.get(context);
        return Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[800],
                    radius: 50,
                    child: Text(
                      cubit.userData['userFName'].toString()[0],
                      style: const TextStyle(fontSize: 60),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          ' ${cubit.userData['userFName']} ${cubit.userData['userLName']}',
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 8,
          ),
          SeetLogRow(
              title: 'Edit User Name ', icon: Icons.person, onTap: () {}),
          const SizedBox(
            height: 8,
          ),
          SeetLogRow(title: 'Change Password ', icon: Icons.lock, onTap: () {}),
          const SizedBox(
            height: 8,
          ),
          SeetLogRow(
              title: 'Delete Account ',
              icon: Icons.person_off_rounded,
              onTap: () {}),
        ]);
      },
    );
  }
}
