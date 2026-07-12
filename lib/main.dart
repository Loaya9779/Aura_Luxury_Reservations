import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/forget_password/forget_password_screen.dart';
import 'package:aura_luxury_reservations/features/auth/login/login_screen.dart';
import 'package:aura_luxury_reservations/features/auth/signup/signup_screen.dart';
import 'package:aura_luxury_reservations/features/booking/details_resturant/cubit/booking_cubit.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/cubit/resturant_cubit.dart';
import 'package:aura_luxury_reservations/features/booking/view_resturant/screen/booking_screen.dart';
import 'package:aura_luxury_reservations/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  await firebaseDataSource.addResturants();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BookingCubit()),
        BlocProvider(create: (_) => ResturantCubit()..getResturants()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/login': (_) => const LoginScreen(),
          '/signup': (_) => const SignupScreen(),
          '/forget-password': (_) => const ForgetPasswordScreen(),
          '/booking': (_) => const BookingScreen(),
        },
      ),
    );
  }
}
