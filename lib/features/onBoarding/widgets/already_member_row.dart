import 'package:aura_luxury_reservations/core/app_style.dart';
import 'package:flutter/material.dart';

class AlreadyMemberRow extends StatelessWidget {
  const AlreadyMemberRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already a member?", style: AppStyle.bodySmall),
        TextButton(
          onPressed: () {},
          child: Text("SIGN IN", style: AppStyle.labelMedium),
        ),
      ],
    );
  }
}
