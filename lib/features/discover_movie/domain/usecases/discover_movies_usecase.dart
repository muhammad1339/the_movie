import 'package:fpdart/fpdart.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/features/discover_movie/domain/repository/movie_repository.dart';
import 'package:the_movie/network/api/utils/error_model.dart';

class DiscoverMoviesUsecase {
  final MovieRepository repository;

  DiscoverMoviesUsecase(this.repository);

  Future<Either<HttpError, DiscoverMoviesEntity>> call({required int page}) async {
    return await repository.discoverMovies(page: page);
  }
}