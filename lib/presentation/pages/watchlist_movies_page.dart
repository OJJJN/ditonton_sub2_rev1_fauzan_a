
//normal package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';





import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
    '/movie_card_list.dart';


import 'package:'
    'flutter'
    '/material.dart';



import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';

//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/movie_watchlist'
    '/movie_watchlist_bloc.dart';





class
WatchlistMoviesPage
    extends
    StatefulWidget {
  static
  const
  ROUTE_NAME
  = '/watchlist-movie';



  @override
  _WatchlistMoviesPageState
  createState()
  => _WatchlistMoviesPageState(
  );
}

class
_WatchlistMoviesPageState
    extends
    State<
        WatchlistMoviesPage
    >
    with
        RouteAware {

  @override
  void initState(
      ) {
    super
        .initState(
    );

    Future
        .microtask((
        ) {
      context
          .read<
          MovieWatchlistBloc>()
          .add(
          GetListEvent(
          )
      );
    });
  }


  @override
  void
  didChangeDependencies(
      ) {
    super
        .didChangeDependencies(
    );


    routeObserver
        .subscribe(
        this,
        ModalRoute
            .of(
            context
        )!
    );
  }


  void didPopNext(
      ) {
    context
        .read<
        MovieWatchlistBloc>()
        .add
      (GetListEvent(
    ));

  }


  @override
  Widget build(
      BuildContext
      context
      ) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Watchlist Movie'
        ),
      ),

      body: Padding(
        padding: const
        EdgeInsets
            .all(
            8.0
        ),

        child:
        BlocBuilder<
            MovieWatchlistBloc,
            MovieWatchlistState>
          (
          builder: (
              context,
              state
              ) {

            if (
            state
            is
            MovieWatchlistLoading
            ) {

              return
                const Center(
                child: CircularProgressIndicator(
                ),
              );


            } else if (
            state
            is
            MovieWatchlistLoaded
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
                itemCount:
                state
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

  @override
  void dispose(
      ) {
    routeObserver
        .unsubscribe(
        this
    );


    super
        .dispose(
    );
  }
}
