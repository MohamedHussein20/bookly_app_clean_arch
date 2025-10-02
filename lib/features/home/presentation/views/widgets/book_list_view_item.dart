import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.rating,
    required this.ratingCount,
  });
  final String image;
  final String title;
  final String author;
  final num rating;
  final num ratingCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.kBookDetailsView,
            extra: BookEntity(
                bookId: "0",
                image: image,
                title: title,
                authorName: author,
                ratingCount: ratingCount,
                rating: rating),
          );
        },
        child: SizedBox(
          height: 125.h,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 5 / 8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(imageUrl: image),
                ),
              ),
              SizedBox(
                width: 30.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        title,
                        style: Styles.textStyle20.copyWith(
                          fontFamily: kGtSectraFine,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      author,
                      style: Styles.textStyle14,
                      maxLines: 1,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BookRating(
                          rating: rating,
                          ratingCount: ratingCount,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
