//normal package
import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
    '/movie_card_list.dart';


import 'package:'
    'flutter'
    '/material.dart';

//bloc package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/popular_movies'
    '/movie_popular_bloc.dart';




class
PopularMoviesPage
    extends
    StatefulWidget {
  static
  const
  ROUTE_NAME
  = '/popular-movie';



  @override
  _PopularMoviesPageState
  createState()
  => _PopularMoviesPageState(
  );

}



class
_PopularMoviesPageState
    extends
    State<
        PopularMoviesPage
    > {

  @override
  void initState(
      ) {

    super
        .initState(
    );


    Future
        .microtask(
            (
            ) {
      context
          .read<
          MoviePopularBloc>()
          .add(
          MoviePopularGetEvent()
      );
    });
  }


  @override
  Widget build(
      BuildContext
      context
      ) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Popular Movies'
        ),
      ),

      body: Padding(
        padding: const
        EdgeInsets
            .all(
            8.0
        ),

        child: BlocBuilder<
            MoviePopularBloc,
            MoviePopularState>(

          builder: (
              context,
              state
              ) {

            if (
            state
            is
            MoviePopularLoading
            ) {


              return
                const Center(
                child: CircularProgressIndicator(
                ),
              );

            } else if (
            state
            is
            MoviePopularLoaded
            ) {

              return
                ListView
                    .builder(
                itemBuilder: (
                    context,
                    index
                    ) {

                  final
                  movie
                  = state
                      .result[
                        index
                  ];


                  return
                    MovieCard(
                        movie
                    );
                },
                itemCount: state
                    .result
                    .length,
              );
            } else {
              return Center(
                key: Key(
                    'error_message'
                ),

                child: Text(
                    "Error"
                ),
              );
            }
          },
        ),
      ),
    );
  }
}