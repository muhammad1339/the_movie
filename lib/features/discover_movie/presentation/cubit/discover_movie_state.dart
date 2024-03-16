part of 'discover_movie_cubit.dart';

abstract class DiscoverMovieState {}

class DiscoverMovieInitial extends DiscoverMovieState {}

class DiscoverMovieLoading extends DiscoverMovieState {}

class DiscoverMovieSuccess extends DiscoverMovieState {
  // final DiscoverMoviesEntity discoverMoviesEntity;

  // DiscoverMovieSuccess({required this.discoverMoviesEntity});
}

class DiscoverMovieError extends DiscoverMovieState {
  final HttpError error;

  DiscoverMovieError(this.error);
}
