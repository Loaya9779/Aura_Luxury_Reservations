import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/states.dart';
import 'package:aura_luxury_reservations/features/auth/widgets/custom_text_field.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/validator/validation.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Password reset link has been sent to your email.',
              ),
            ),
          );

          Navigator.pop(context);
        }

        if (state is AuthErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(isCenter: false),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/auth_background.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password',
                      style: AppStyle.headlineLarge.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Enter your email address and we will send\nyou a password reset link.',
                      textAlign: TextAlign.center,
                      style: AppStyle.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 32),

                    CustomTextField(
                      controller: _emailController,
                      labelText: 'Email',
                      hintText: 'example@email.com',
                      validator: Validation.validateEmail,
                    ),

                    const SizedBox(height: 32),

                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        if (state is AuthLoadingState) {
                          return const CircularProgressIndicator();
                        }

                        return CustomButtom(
                          title: 'Send Reset Link',
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().forgetPassword(
                                    _emailController.text.trim(),
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}