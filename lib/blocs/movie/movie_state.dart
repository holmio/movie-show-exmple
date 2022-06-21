part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class GetMovieByIdSuccess extends MovieState {
  final MovieModel movie;

  const GetMovieByIdSuccess({required this.movie});
  @override
  List<Object> get props => [movie];
}

class SearchMovieByTitleSuccess extends MovieState {
  final List<MovieDetailModel> movies;

  const SearchMovieByTitleSuccess({required this.movies});
  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  final String? message;

  const MovieError(this.message);
}
