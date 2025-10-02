import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                BookDetailsSection(
                  book: book,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const BookActions(),
                Expanded(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                const SimilarBookSection(),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
