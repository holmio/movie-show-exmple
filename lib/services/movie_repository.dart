import 'package:movie_show_example/models/movie_detail_model.dart';
import 'package:movie_show_example/models/movie_model.dart';

import 'movie_service.dart';

class MovieRepository {
  final _provider = MovieService();

  Future<MovieModel> getMovieById(String id) {
    return _provider.getMovieById(id);
  }

  Future<MoviesListModel> searchMovieByTitle(String title) {
    return _provider.searchMovieByTitle(title);
  }
}

class NetworkError extends Error {}
