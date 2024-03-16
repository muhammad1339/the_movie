import 'package:the_movie/features/discover_movie/domain/entities/discover_movies_entity.dart';

class DiscoverMoviesModel extends DiscoverMoviesEntity {
  const DiscoverMoviesModel({
    required super.page,
    required List<MovieItemModel>? super.results,
    required super.totalPages,
    required super.totalResults,
  });

  factory DiscoverMoviesModel.fromJson(Map<String, dynamic> json) {
    return DiscoverMoviesModel(
      page: json['page'],
      results: List<MovieItemModel>.from(json['results'].map((x) => MovieItemModel.fromJson(x))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'results': results?.map((x) => (x as MovieItemModel).toJson()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  DiscoverMoviesEntity toEntity() {
    return DiscoverMoviesEntity(
      page: page,
      results: results?.map((x) => (x as MovieItemModel).toEntity()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }

  
}

class MovieItemModel extends MovieItemEntity {
  const MovieItemModel({ 
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieItemModel.fromJson(Map<String, dynamic> json) {
    return MovieItemModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }

  MovieItemEntity toEntity() {
    return MovieItemEntity(
      adult: adult,
      backdropPath: backdropPath,
      genreIds: genreIds,
      id: id,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      overview: overview,
      popularity: popularity,
      posterPath: posterPath,
      releaseDate: releaseDate,
      title: title,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

}
