import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return BookListViewItem(
          image: books[index].image ?? '',
          title: books[index].title,
          author: books[index].authorName ?? 'Unknown Author',
          rating: books[index].rating ?? 0.0,
          ratingCount: books[index].ratingCount ?? 0,
        );
      },
      itemCount: 10,
    );
  }
}
