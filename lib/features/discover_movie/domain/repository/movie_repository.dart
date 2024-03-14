import 'package:fpdart/fpdart.dart';
import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';
import 'package:the_movie/network/api/utils/error_model.dart';

abstract class MovieRepository {

    Future<Either<HttpError,DiscoverMoviesEntity>> discoverMovies({required int page});

}