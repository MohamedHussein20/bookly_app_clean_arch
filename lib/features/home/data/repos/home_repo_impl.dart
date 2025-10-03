import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepoImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber = 0}) async {
    try {
      final localBooks = localDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );

      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }

      final remoteBooks = await remoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks(
      {int pageNumber = 0}) async {
    try {
      final localBooks = localDataSource.fetchNewestBooks(
        pageNumber: pageNumber,
      );

      if (localBooks.isNotEmpty) {
        return right(localBooks);
      }

      print("Repo: fetching newest books from remote 🌍");
      final remoteBooks = await remoteDataSource.fetchNewestBooks(pageNumber: pageNumber);
      return right(remoteBooks);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
