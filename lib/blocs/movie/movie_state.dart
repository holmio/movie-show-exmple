part of 'movie_bloc.dart';

@immutable
abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieSuccess extends MovieState {
  final MovieModel movie;

  const MovieSuccess({required this.movie});
  @override
  List<Object> get props => [movie];
}

class MovieError extends MovieState {
  final String? message;

  const MovieError(this.message);
}
