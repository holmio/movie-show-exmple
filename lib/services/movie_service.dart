import 'package:dio/dio.dart';
import 'package:movie_show_example/constants/config_api_const.dart';
import 'package:movie_show_example/models/movie_model.dart';

class MovieService {
  final Dio _dio = Dio();

  Future<MovieModel> getMovieById(String id) async {
    try {
      Response response = await _dio.get(ApiConst.IdMovieApi + id);
      return MovieModel.fromJson(response.data);
    } catch (error, stacktrace) {
      return MovieModel.withError("Data not found / Connection issue");
    }
  }
}
