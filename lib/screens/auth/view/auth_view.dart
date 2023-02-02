import 'package:evaluation/helpers/constants.dart';
import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/helpers/custom_widgets/app_buttons/app_progress_button.dart';
import 'package:evaluation/helpers/custom_widgets/app_text.dart';
import 'package:evaluation/helpers/custom_widgets/app_text_field.dart';
import 'package:evaluation/screens/auth/bloc/bloc.dart';
import 'package:evaluation/screens/auth/bloc/events.dart';
import 'package:evaluation/screens/auth/bloc/input_data.dart';
import 'package:evaluation/screens/auth/bloc/states.dart';
import 'package:evaluation/screens/auth/view/register_view.dart';
import 'package:evaluation/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _inputData = LoginInputData();
  final _bloc = KiwiContainer().resolve<LoginBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _bloc.add(LoginEventStart(_inputData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                      hintText: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      radius: 15,
                      verticalPadding: 0,
                      horizontalPadding: 5,
                      validateEmptyText: 'empty'),
                  CustomTextFormField(
                      hintText: 'Password',
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      horizontalPadding: 5,
                      radius: 15,
                      validateEmptyText: 'empty'),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    AppText('Dont’t have an account ?'),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {
                          pushAndRemoveUntil(const RegisterView());
                        },
                        child: AppText(
                          'Register an account',
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                      onTap: () {
                        pushAndRemoveUntil(const HomeView());
                      },
                      child: AppText(
                        'Enter as Guest',
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  _btnLogin(),
                    ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _btnLogin() {
    AnimationController? anim;
    return BlocConsumer(
        bloc: _bloc,
        builder: (_, state) {
          if (state is LoginStateStart) {
          return  Center(
              child: AppProgressButton(
                onPressed: (AnimationController animationController) {
                  setState(() {
                    animationController.forward();
                  });
                  Future.delayed(Duration(seconds: 10))
                      .then((value) => _Login(
                    context,
                  ))
                      .then((value) => animationController.reverse());
                  // animationController.reverse();
                },
                backgroundColor: kButtonColor,
                width: MediaQuery.of(context).size.width - 40,
                child: AppText(
                  'Login',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            );
          } else {
           return Center(
              child: AppProgressButton(
                onPressed: (AnimationController animationController) {
                  setState(() {
                    animationController.forward();
                  });
                  Future.delayed(Duration(seconds: 10))
                      .then((value) => _Login(
                    context,
                  ))
                      .then((value) => animationController.reverse());
                  // animationController.reverse();
                },
                backgroundColor: kButtonColor,
                width: MediaQuery.of(context).size.width - 40,
                child: AppText(
                  'Login',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            );
          }
        },
        listener: (_, state) {
          if (state is LoginStateSuccess) {
            pushAndRemoveUntil(const HomeView());
          } else if (state is LoginStateFailed) {
            print('fffffff');
            pushAndRemoveUntil(const HomeView());
            Fluttertoast.showToast(
                msg: (state.msg).toString(),
                backgroundColor: kPurpleColor,
                textColor: Colors.white,
                fontSize: 15);
          }else{
           null;
          }
        });
  }

  void _Login(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      _inputData.mobile = _emailController.text;
      _inputData.password = _passwordController.text;
      _bloc.add(LoginEventStart(_inputData));
    }
  }



}
