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

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  @override
  initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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

        if (state is LogInSuccessState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login Success')));
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(isCenter: true),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/auth_images/auth_background.png'),
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
                        'Welcome Back',
                        style: AppStyle.headlineLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Return to your curated culinary\nexperiences.',
                      textAlign: TextAlign.center,
                      style: AppStyle.bodyMedium.copyWith(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 32),

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
                                  onPressed: myCubit.togglePasswordVisibility,
                                  icon: const Icon(Icons.visibility_off),
                                )
                              : IconButton(
                                  onPressed: myCubit.togglePasswordVisibility,
                                  icon: const Icon(Icons.visibility),
                                ),
                          validator: Validation.validatePassword,
                          controller: _passwordController,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomTextButtom(
                        title: 'forget password?',
                        onpressed: () =>
                            Navigator.pushNamed(context, '/forget-password'),
                      ),
                    ),
                    const SizedBox(height: 32),
                    CustomButtom(
                      title: 'Sign In',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                            _emailController.text.trim(),
                            _passwordController.text,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    CustomTextButtom(
                      title: 'don\'t have an account? sign up',
                      onpressed: () => Navigator.pushNamed(context, '/signup'),
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
