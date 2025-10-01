import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return const BookListViewItem();
      },
      itemCount: 10,
    );
  }
}
