import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
