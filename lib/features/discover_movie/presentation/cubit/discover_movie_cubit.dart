import 'package:bloc/bloc.dart';

part 'discover_movie_state.dart';

class DiscoverMovieCubit extends Cubit<DiscoverMovieState> {
  DiscoverMovieCubit() : super(DiscoverMovieInitial());
}
