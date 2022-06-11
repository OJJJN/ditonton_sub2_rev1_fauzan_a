//normal package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
    '/tvseries_card_list.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';




//bloc package
import '../'
    '..'
    '/bloc'
    '/tvseries'
    '/tvseries_watchlist'
    '/watchlist_tvseries_bloc.dart';



class
WatchlistTvSeriesPage
    extends
    StatefulWidget {

  static
  const
  ROUTE_NAME
  = '/watchlist-tvseries';



  @override
  _WatchlistTvSeriesPageState
  createState()
  => _WatchlistTvSeriesPageState(
  );

}



class
_WatchlistTvSeriesPageState
    extends
    State<
        WatchlistTvSeriesPage>

    with
        RouteAware {
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
          WatchlistTvseriesBloc>()
          .add(
          WatchlistTvseriesGetEvent()
      );
    });
  }


  @override
  void didChangeDependencies(
      ) {

    super
        .didChangeDependencies(
    );


    routeObserver
        .subscribe(
        this,
        ModalRoute
            .of(
            context)
        !
    );

  }

  void didPopNext(
      ) {

    context
        .read<
        WatchlistTvseriesBloc>()
        .add(
        WatchlistTvseriesGetEvent()
    );

  }

  @override
  Widget build(
      BuildContext
      context
      ) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Watchlist TvSeries'
        ),
      ),

      body: Padding(
        padding: const
        EdgeInsets
            .all(
            8.0
        ),


        child: BlocBuilder<
            WatchlistTvseriesBloc,
            WatchlistTvseriesState
        >(
          builder: (
              context,
              state
              ) {

            if (
            state
            is WatchlistTvseriesLoading
            ) {

              return const Center(
                child: CircularProgressIndicator(
                ),
              );


            } else if (
            state
            is WatchlistTvseriesLoaded
            ) {

              return ListView
                  .builder(

                itemBuilder: (
                    context,
                    index
                    ) {

                  final
                  tvseries
                  = state
                      .result[
                        index
                  ];


                  return TvSeriesCard(
                      tvseries
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
