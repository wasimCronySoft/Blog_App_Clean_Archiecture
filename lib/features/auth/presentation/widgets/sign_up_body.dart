import 'package:clean_arch_application/core/theme/app_pallete.dart';
import 'package:clean_arch_application/core/utils/snackbar_utils.dart';
import 'package:clean_arch_application/core/widgets/gradient_button.dart';
import 'package:clean_arch_application/core/widgets/textform_field.dart';
import 'package:clean_arch_application/features/auth/domain/entities/params/signup_param.dart';

import 'package:clean_arch_application/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            CustomSnackBar.showSuccessSnackBar(
                context, "Account created successfully");
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
                  'Sign Up.',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                CustomTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 20),
                GradientButton(
                  buttonText: 'Sign Up',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthSignUp(
                              param: SignupParam(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                          );
                    }
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                          text: 'Sign In',
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
