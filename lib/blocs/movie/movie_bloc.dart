import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_show_example/models/movie_detail_model.dart';
import 'package:movie_show_example/models/movie_model.dart';
import 'package:movie_show_example/services/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieById>((event, emit) async {
      emit(MovieLoading());
      final result = await MovieRepository().getMovieById(event.id);
      if (result.response) {
        emit(GetMovieByIdSuccess(movie: result));
        return;
      }
      emit(MovieError(result.error));
    });

    on<SearchMovieByTitle>((event, emit) async {
      emit(MovieLoading());
      final result = await MovieRepository().searchMovieByTitle(event.title);
      if (result.response) {
        emit(SearchMovieByTitleSuccess(movies: result.search!));
        return;
      }
      emit(MovieError(result.error));
    });
  }
}
