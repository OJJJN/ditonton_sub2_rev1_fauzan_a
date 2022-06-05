import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/movie_detail.dart';


import 'package:'
    'equatable'
    '/equatable.dart';




//class
class MovieTable
    extends
    Equatable {
  final
  int id;
  final
  String? title;
  final
  String? posterPath;
  final
  String? overview;


  //movietable
  const MovieTable({
    required
    this.id,
    required
    this.title,
    required
    this.posterPath,
    required
    this.overview,
  });


  //factory movietable
  factory MovieTable.
  fromEntity(
      MovieDetail movie)
  => MovieTable(
    id: movie.id,
    title: movie.title,
    posterPath: movie.posterPath,
    overview: movie.overview,
  );


  //factory movietable
  factory MovieTable.
  fromMap(
      Map<String, dynamic> map)
  => MovieTable(
    id: map[
      'id'],
    title: map[
      'title'],
    posterPath: map[
      'posterPath'],
    overview: map[
      'overview'],
  );


  //json
  Map<String,
      dynamic> toJson(
      ) => {
    'id':
    id,
    'title':
    title,
    'posterPath':
    posterPath,
    'overview':
    overview,
  };


  //Movietoentity
  Movie toEntity(
      ) => Movie.
  watchlist(
    id:
    id,
    overview:
    overview,
    posterPath:
    posterPath,
    title:
    title,
  );

  @override
  List<Object?>
  get props
  => [id,
    title,
    posterPath,
    overview
  ];
  //List Object
}
