import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/core/utils/functions/save_data.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    final data = await apiService.get(
      endPoint: "volumes?filter=free-ebooks&q=programming&maxResults=40",
    );

    final books = getBooksList(data);
    saveData(books, kFeaturedBox);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    final data = await apiService.get(
      endPoint:
          "volumes?filter=free-ebooks&q=programming&orderBy=newest&maxResults=20",
    );

    final books = getBooksList(data);
    saveData(books, kNewestBox);
    return books;
  }
}

List<BookEntity> getBooksList(Map<String, dynamic> data) {
  final items = data['items'] as List?;
  if (items == null) {
    return [];
  }

  return items.map((book) => BookModel.fromJson(book)).toList();
}
