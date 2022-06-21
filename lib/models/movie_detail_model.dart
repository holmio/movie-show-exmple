class MoviesListModel {
  List<MovieDetailModel>? search;
  String? totalResults;
  String? error;
  bool response = false;

  MoviesListModel.withError(String errorMessage) {
    error = errorMessage;
  }

  MoviesListModel({this.search, this.totalResults, required this.response});

  MoviesListModel.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <MovieDetailModel>[];
      json['Search'].forEach((v) {
        search!.add(new MovieDetailModel.fromJson(v));
      });
    }
    totalResults = json['totalResults'];
    response = json['Response'] == 'True';
    error = json['Error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['Search'] = this.search!.map((v) => v.toJson()).toList();
    }
    data['totalResults'] = this.totalResults;
    data['Response'] = this.response;
    return data;
  }
}

class MovieDetailModel {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  MovieDetailModel(
      {this.title, this.year, this.imdbID, this.type, this.poster});

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    year = json['Year'];
    imdbID = json['imdbID'];
    type = json['Type'];
    poster = json['Poster'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbID;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
