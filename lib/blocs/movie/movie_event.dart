part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovieById extends MovieEvent {
  final String id;
  const GetMovieById(this.id);

  @override
  List<Object> get props => [id];
}

class SearchMovieByTitle extends MovieEvent {
  final String title;
  const SearchMovieByTitle(this.title);

  @override
  List<Object> get props => [title];
}
