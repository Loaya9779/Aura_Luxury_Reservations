import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  const AppBarWidget({super.key, required this.isHome});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isHome
          ? Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    width: 1,
                  ),
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/splash.png'),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 18),
              child: IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/navigation');
                },
                icon: Icon(Icons.arrow_back_ios_new_outlined),
                color: AppColors.primary,
              ),
            ),
      actions: [
        isHome
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.primary,
                    size: 30,
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: AppColors.primary,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.25),
                          width: 1,
                        ),
                      ),

                      child: const CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage('assets/images/splash.png'),
                      ),
                    ),
                  ],
                ),
              ),
      ],
      bottom: PreferredSize(
        preferredSize: Size(1, 15),
        child: Container(
          color: AppColors.primary.withValues(alpha: 0.15),
          height: 1,
        ),
      ),
      backgroundColor: AppColors.surface,
      title: isHome
          ? Text(
              'LUMIÈRE',
              style: GoogleFonts.hankenGrotesk(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
              ),
            )
          : Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'LUMIÈRE',
                style: GoogleFonts.hankenGrotesk(
                  color: AppColors.primary,
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 4,
                ),
              ),
            ),
    );
  }
  
  @override
  Size get preferredSize =>  Size.fromHeight(65.h);
}
