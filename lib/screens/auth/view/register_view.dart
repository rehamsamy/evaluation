import 'package:evaluation/helpers/constants.dart';
import 'package:evaluation/helpers/core_classes/pusher.dart';
import 'package:evaluation/helpers/custom_widgets/app_buttons/app_progress_button.dart';
import 'package:evaluation/helpers/custom_widgets/app_text.dart';
import 'package:evaluation/helpers/custom_widgets/app_text_field.dart';
import 'package:evaluation/screens/auth/bloc/bloc.dart';
import 'package:evaluation/screens/auth/bloc/events.dart';
import 'package:evaluation/screens/auth/bloc/input_data.dart';
import 'package:evaluation/screens/auth/bloc/states.dart';
import 'package:evaluation/screens/auth/view/auth_view.dart';
import 'package:evaluation/screens/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _inputData = RegisterInputData();
  final _bloc = KiwiContainer().resolve<RegisterBloc>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                      hintText: 'Name',
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      radius: 15,
                      horizontalPadding: 5,
                      validateEmptyText: 'empty'),
                  CustomTextFormField(
                      hintText: 'Phone number',
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      radius: 15,
                      horizontalPadding: 5,
                      validateEmptyText: 'empty'),
                  CustomTextFormField(
                      hintText: 'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      radius: 15,
                      horizontalPadding: 5,
                      validateEmptyText: 'empty'),
                  CustomTextFormField(
                      hintText: 'Password',
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      horizontalPadding: 5,
                      radius: 15,
                      validateEmptyText: 'empty'),
                  CustomTextFormField(
                      hintText: 'Confirm password',
                      controller: _confirmPasswordController,
                      keyboardType: TextInputType.text,
                      horizontalPadding: 5,
                      radius: 15,
                      validateEmptyText: 'empty'),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    AppText('Already have an account ?'),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                        onTap: () {
                          pushAndRemoveUntil(const AuthView());
                        },
                        child: AppText(
                          'Login',
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
                  _btnRegister()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext ctx) {
    if (_formKey.currentState!.validate()) {
      _inputData.email = _emailController.text;
      _inputData.password = _passwordController.text;
      _inputData.confirmPassword = _confirmPasswordController.text;
      _inputData.mobile = _phoneController.text;
      _inputData.name = _nameController.text;
      _bloc.add(RegisterEventStart(_inputData));
    }
  }

  _btnRegister() {
    return BlocConsumer(
        bloc: _bloc,
        builder: (_, state) {
          if (state is RegisterStateStart) {
            return Center(
              child: AppProgressButton(
                onPressed: (AnimationController animationController) {
                  setState(() {
                    animationController.forward();
                  });
                  Future.delayed(Duration(seconds: 10))
                      .then((value) => _register(
                            context,
                          ))
                      .then((value) => animationController.reverse());
                },
                backgroundColor: kButtonColor,
                width: MediaQuery.of(context).size.width - 40,
                child: AppText(
                  'Register',
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
                      .then((value) => _register(
                            context,
                          ))
                      .then((value) => animationController.reverse());
                },
                backgroundColor: kButtonColor,
                width: MediaQuery.of(context).size.width - 40,
                child: AppText(
                  'Register',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17,
                ),
              ),
            );
          }
        },
        listener: (_, state) {
          if (state is RegisterStateSuccess) {
            pushAndRemoveUntil(const HomeView());
          } else if (state is RegisterStateFailed){
            pushAndRemoveUntil(const HomeView());
            Fluttertoast.showToast(
                msg: (state.msg).toString(),
                backgroundColor: kPurpleColor,
                textColor: Colors.white,
                fontSize: 15);
          } else {
            null;
          }
        });
  }
}
