import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/componets/mgh_button.dart';
import 'package:mgh/componets/mgh_text_filed.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class ForgotPassPage extends StatelessWidget {
   ForgotPassPage({super.key});
  static const String route = 'forgot';
  GlobalKey<FormState> fkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppLogic.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/logo.png',
                            scale: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.blueGrey[100],
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                key: fkey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Forgot Password ? ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 30),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Please Enter You Email ',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    MghTextFiled(
                                      'Email',
                                      const Icon(Icons.alternate_email),
                                      false,
                                      cubit.uemail,
                                      'email',
                                      'email',
                                    ),
                                    MghButton(
                                      title: 'Send Email', 
                                     on_press:   () {
                                      if (fkey.currentState!.validate()) {
                                        cubit.passReset();
                                      }
                                    },
                                    color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
