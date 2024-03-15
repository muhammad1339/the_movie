import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:the_movie/features/discover_movie/data/data_source/discover_movie_data_source.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/features/discover_movie/domain/repository/discover_movie_repository.dart';
import 'package:the_movie/network/api/utils/error_model.dart';

class DiscoverMovieRepositoryImpl implements DiscoverMovieRepository {
  final DiscoverMovieDataSource dataSource;

  DiscoverMovieRepositoryImpl({required this.dataSource});

  @override
  Future<Either<HttpError, DiscoverMoviesEntity>> discoverMovies({required int page}) async {
    try {
      final result = await dataSource.discoverMovies(page: page);
      return right(result.toEntity());
    } on DioException catch (e) {
      return left(
        HttpError(
          message: e.response?.statusMessage ?? 'Unkwon Error',
          code: e.response?.statusCode,
        ),
      );
    } on Exception catch (e) {
      return left(HttpError(message: e.toString(), code: 500));
    }
  }
}
