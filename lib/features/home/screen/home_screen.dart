import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/core/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/home_body_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_results_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.surface,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.h),
          child: AppBarWidget(isHome: true),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24.w),
              child: HomeBodyWidget(
                controller: _controller,
                focusNode: _focusNode,
                height: height,
                width: width,
              ),
            ),
            SearchResultsWidget(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}
