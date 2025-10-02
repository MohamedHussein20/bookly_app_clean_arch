import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

Future<void> saveData(List<BookEntity> books, String boxName) async {
  var box = await Hive.openBox(boxName);
  box.addAll(books);
}
