import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_list_view_bloc_builder.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: CustomAppBar()),
          const SliverToBoxAdapter(child: FeaturedBooksListViewBlocBuilder()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Newest Books",
              style: Styles.textStyle18,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20.h,
            ),
          ),
          const NewestBooksListViewBlocBuilder(),
        ],
      ),
    );
  }
}
