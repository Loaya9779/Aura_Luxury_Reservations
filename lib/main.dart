import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/forget_password/forget_password_screen.dart';
import 'package:aura_luxury_reservations/features/auth/login/login_screen.dart';
import 'package:aura_luxury_reservations/features/auth/signup/signup_screen.dart';
import 'package:aura_luxury_reservations/features/details_resturant/cubit/booking_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/resturant_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/screen/resturants_screen.dart';
import 'package:aura_luxury_reservations/features/home/screen/home_screen.dart';
import 'package:aura_luxury_reservations/features/onBoarding/cubit/onboarding_cubit.dart';
import 'package:aura_luxury_reservations/features/onBoarding/screen/onboarding_screen.dart';
import 'package:aura_luxury_reservations/features/splash/screen/splash_screen.dart';
import 'package:aura_luxury_reservations/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('appBox');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  // await firebaseDataSource.addResturants();
  bool isLoggedIn = Hive.box('appBox').get('isLoggedIn', defaultValue: false);

  runApp(
    MainApp(isLoggedIn: isLoggedIn),
  );
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthCubit()),
        BlocProvider(create: (_) => BookingCubit()),
        BlocProvider(create: (_) => ResturantCubit()..getResturants()),
        BlocProvider(create: (_) => OnboardingCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: isLoggedIn ? '/home' : '/splash',
          routes: {
            '/splash': (_) => const SplashScreen(),
            '/onboarding': (_) => const OnboardingScreen(),
            '/signup': (_) => const SignupScreen(),
            '/login': (_) => const LoginScreen(),
            '/forget-password': (_) => const ForgetPasswordScreen(),
            '/home': (_) => const HomeScreen(),
            '/resturants': (_) => const ResturantsScreen(),
          },
        ),
      ),
    );
  }
}
