import 'package:clean_arch_application/core/routes/routes_constants.dart';
import 'package:clean_arch_application/core/theme/app_pallete.dart';
import 'package:clean_arch_application/core/utils/snackbar_utils.dart';
import 'package:clean_arch_application/core/widgets/gradient_button.dart';
import 'package:clean_arch_application/core/widgets/loading_indicator.dart';
import 'package:clean_arch_application/core/widgets/textform_field.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/login_param.dart';
import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoading) {
            showLoadingIndicator(context);
          } else {
            Navigator.of(context).pop();
          }
          if (state is AuthSuccess) {
            CustomSnackBar.showSuccessSnackBar(
                context, "Account Logged in successfully");
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.homepage, (route) => false);
          }
          if (state is AuthFailure) {
            CustomSnackBar.showErrorSnackBar(context, state.message);
            debugPrint(state.message);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sign In.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                    hintText: "Email", controller: emailController),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: "Password",
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  buttonText: "Login",
                  onPressed: () {
                    context.read<AuthBloc>().add(
                          AuthLogin(
                            param: LoginParam(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.singup);
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppPallete.gradient2,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
