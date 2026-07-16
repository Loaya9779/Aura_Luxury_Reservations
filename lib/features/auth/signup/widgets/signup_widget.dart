import 'package:aura_luxury_reservations/core/validator/validation.dart';
import 'package:aura_luxury_reservations/core/widgets/custom_buttom.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/states.dart';
import 'package:aura_luxury_reservations/features/auth/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
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
    return Form(
      key: formKey,
      child: Column(
        children: [
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
            labelText: 'Email',
            validator: Validation.validateEmail,
            controller: _emailController,
          ),

          const SizedBox(height: 16),
          BlocBuilder<AuthCubit, AuthStates>(
            builder: (context, state) {
              final cubit = context.read<AuthCubit>();

              return CustomTextField(
                hintText: '••••••••',
                labelText: 'Password',
                controller: _passwordController,
                validator: Validation.validatePassword,
                obscureText: cubit.isPasswordHidden,
                suffixIcon: IconButton(
                  onPressed: cubit.togglePasswordVisibility,
                  icon: Icon(
                    cubit.isPasswordHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}
