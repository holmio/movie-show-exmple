part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovie extends MovieEvent {
  final String id;
  const GetMovie(this.id);

  @override
  List<Object> get props => [id];
}
