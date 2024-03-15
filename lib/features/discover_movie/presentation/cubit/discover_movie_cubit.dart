import 'package:bloc/bloc.dart';
import 'package:the_movie/features/discover_movie/domain/usecases/discover_movies_usecase.dart';
import 'package:the_movie/network/api/utils/error_model.dart';

import '../../../../utils/logger.dart';
import '../../domain/entities/discover_movies_entity.dart';

part 'discover_movie_state.dart';

class DiscoverMovieCubit extends Cubit<DiscoverMovieState> {
  DiscoverMovieCubit({
    required this.discoverMoviesUsecase,
  }) : super(DiscoverMovieInitial());

  int page = 1;
  final DiscoverMoviesUsecase discoverMoviesUsecase;
  Future<void> discoverMovies() async {
    try {
      emit(DiscoverMovieLoading());
      final result = await discoverMoviesUsecase(page: page);
      result.fold(
        (l) {
          emit(DiscoverMovieError(l));
        },
        (r) {
          emit(DiscoverMovieSuccess(discoverMoviesEntity: r));
        },
      );
    } catch (e, s) {
      logger.e(e.toString());
      logger.t(s.toString());
      emit(DiscoverMovieError(
        HttpError(
          message: e.toString(),
          code: 500,
        ),
      ));
    }
  }
}
