import 'package:aura_luxury_reservations/core/data_source/firebase_data_source.dart';
import 'package:aura_luxury_reservations/features/Navigation/cubit/navigation_cubit.dart';
import 'package:aura_luxury_reservations/features/Navigation/screen/navigation_screen.dart';
import 'package:aura_luxury_reservations/features/auth/cubit/auth_cubit.dart';
import 'package:aura_luxury_reservations/features/auth/forget_password/forget_password_screen.dart';
import 'package:aura_luxury_reservations/features/auth/login/login_screen.dart';
import 'package:aura_luxury_reservations/features/auth/signup/signup_screen.dart';
import 'package:aura_luxury_reservations/features/confirmation/screen/confirmation_screen.dart';
import 'package:aura_luxury_reservations/features/details_resturant/cubit/booking_cubit.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/my_bookings/cubit/my_bookings_cubit.dart';
import 'package:aura_luxury_reservations/features/my_bookings/screen/my_bookings_screen.dart';
import 'package:aura_luxury_reservations/features/profile/screen/profile_screen.dart';
import 'package:aura_luxury_reservations/features/view_resturant/cubit/restaurant_cubit.dart';
import 'package:aura_luxury_reservations/features/view_resturant/screen/resturants_screen.dart';
import 'package:aura_luxury_reservations/features/home/screen/home_screen.dart';
import 'package:aura_luxury_reservations/features/onBoarding/cubit/onboarding_cubit.dart';
import 'package:aura_luxury_reservations/features/onBoarding/screen/onboarding_screen.dart';
import 'package:aura_luxury_reservations/features/splash/screen/splash_screen.dart';
import 'package:aura_luxury_reservations/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  await Hive.openBox('appBox');
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseDataSource firebaseDataSource = FirebaseDataSource();
  // await firebaseDataSource.addResturants();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(390, 882),
          useInheritedMediaQuery: true,
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            ScreenUtil.configure(data: MediaQuery.of(context));
            return MainApp();
          },
        );
      },
    ),
  );
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
        BlocProvider(create: (_) => OnboardingCubit()),
        BlocProvider(create: (_) => HomeCubit()..getRestaurants()),
        BlocProvider(create: (_) => MyBookingsCubit()),
        BlocProvider(create: (_) => NavigationCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(splashColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => const SplashScreen(),
          '/onboarding': (_) => const OnboardingScreen(),
          '/signup': (_) => const SignupScreen(),
          '/login': (_) => const LoginScreen(),
          '/forget-password': (_) => const ForgetPasswordScreen(),
          '/navigation': (_) => const NavigationScreen(),
          '/home': (_) => const HomeScreen(),
          '/resturants': (_) => const ResturantsScreen(),
          '/my-bookings': (_) => const MyBookingsScreen(),
          '/profile': (_) => const ProfileScreen(),
        },
      ),
    );
  }
}
