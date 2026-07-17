import 'package:aura_luxury_reservations/core/app_colors.dart';
import 'package:aura_luxury_reservations/features/home/cubit/home_cubit.dart';
import 'package:aura_luxury_reservations/features/home/widgets/app_bar_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_results_widget.dart';
import 'package:aura_luxury_reservations/features/home/widgets/search_textfield_widget.dart';
import 'package:aura_luxury_reservations/features/view_resturant/widget/resturant_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResturantsScreen extends StatefulWidget {
  const ResturantsScreen({super.key});

  @override
  State<ResturantsScreen> createState() => _ResturantsScreenState();
}

class _ResturantsScreenState extends State<ResturantsScreen> {
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65.h),
          child: AppBarWidget(isHome: false),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(24.w),
              child: Column(
                children: [
                  SearchTextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: (value) {
                      context.read<HomeCubit>().searchRestaurants(value);
                    },
                  ),
                  SizedBox(height: 24.h),
                  const Expanded(child: ResturantList()),
                ],
              ),
            ),
            SearchResultsWidget(focusNode: _focusNode),
          ],
        ),
      ),
    );
  }
}
