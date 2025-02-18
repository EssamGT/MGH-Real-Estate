import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/componets/mgh_pass_text_filed.dart';
import 'package:mgh/pages/Login/creat_acc_page.dart';
import 'package:mgh/pages/Login/forgot_pass_page.dart';
import 'package:mgh/componets/google_button.dart';
import 'package:mgh/componets/ink_m.dart';
import 'package:mgh/componets/mgh_button.dart';
import 'package:mgh/componets/mgh_text_filed.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});
  static const String route = 'log';
    GlobalKey<FormState> lkey = GlobalKey();

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
                              key:   lkey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Login ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 30),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'To Use The App ',
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
                                  MghPassTextFiled(
                                    'Password',
                                    const Icon(Icons.lock),
                                    true,
                                    cubit.uPassword,
                                    'password',
                                  ),
                                  InkM('Forgot Password ?',
                                      Alignment.centerRight, () {
                                    Navigator.of(context)
                                        .pushNamed(ForgotPassPage.route);
                                  }),
                                  MghButton(
                                    title: 'Login',  
                                    on_press:  () {
                                    if (lkey.currentState!.validate()) {
                                      cubit.login(context);
                                      FocusScope.of(context).unfocus();
                                    }
                                  },
                                    color: Colors.black,
                                  ),
                                  GoogleButton('Login with Google', () {}),
                                  InkM('Create Account', Alignment.centerLeft,
                                      () {
                                    Navigator.of(context)
                                        .pushNamed(CreatAccPage.route);
                                  }),
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
      },
    );
  }
}
