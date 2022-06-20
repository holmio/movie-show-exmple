import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_show_example/models/movie_model.dart';
import 'package:movie_show_example/services/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMovie>((event, emit) async {
      emit(MovieLoading());
      final movie = await MovieRepository().getMovieById(event.id);
      if (movie.response) {
        emit(MovieSuccess(movie: movie));
        return;
      }
      emit(MovieError(movie.error));
    });
  }
}
