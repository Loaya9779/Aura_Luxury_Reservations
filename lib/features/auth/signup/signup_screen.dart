import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/states.dart';
import 'package:aura_luxury_reservations/features/auth/widgets/custom_text_buttom.dart';
import 'package:aura_luxury_reservations/features/auth/widgets/custom_text_field.dart';
import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:aura_luxury_reservations/core/validator/validation.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_app_bar.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;
  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }

        if (state is SignUpSuccessState) {
          Navigator.pushNamed(context, '/login');
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(isCenter: true),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/auth_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Create Account',
                        style: AppStyle.headlineLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Join Aura and start enjoying exclusive luxury\ndining experiences.',
                      textAlign: TextAlign.center,
                      style: AppStyle.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 32),

                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'John Doe',
                      labelText: 'Name',
                      validator: Validation.validateName,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: '01*********',
                      labelText: 'Phone Number',
                      validator: Validation.validatePhone,
                      controller: _phoneNumberController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      hintText: 'concierge@lumiere.com',
                      labelText: 'email',
                      validator: Validation.validateEmail,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<AuthCubit, AuthStates>(
                      builder: (context, state) {
                        final myCubit = context.read<AuthCubit>();
                        return CustomTextField(
                          hintText: '••••••••',
                          labelText: 'password',
                          obscureText: myCubit.isPasswordHidden,
                          suffixIcon: myCubit.isPasswordHidden
                              ? IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  onPressed: myCubit.togglePasswordVisibility,
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility),
                                  onPressed: myCubit.togglePasswordVisibility,
                                ),
                          validator: Validation.validatePassword,
                          controller: _passwordController,
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    CustomButtom(
                      title: 'Sign Up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signUp(
                            _nameController.text.trim(),
                            _emailController.text.trim(),
                            _passwordController.text,
                            _phoneNumberController.text.trim(),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextButtom(
                      title: 'do you have an account? sign In',
                      onpressed: () => Navigator.pushReplacementNamed(context, '/login'),
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
