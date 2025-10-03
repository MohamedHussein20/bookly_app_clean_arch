import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        0.7 * _scrollController.position.maxScrollExtent) {
      BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber: nextPage);
      nextPage++;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: _scrollController,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BookListViewItem(
          image: widget.books[index].image ?? '',
          title: widget.books[index].title,
          author: widget.books[index].authorName ?? 'Unknown Author',
          rating: widget.books[index].rating ?? 0.0,
          ratingCount: widget.books[index].ratingCount ?? 0,
        );
      },
      itemCount: widget.books.length,
    );
  }
}
