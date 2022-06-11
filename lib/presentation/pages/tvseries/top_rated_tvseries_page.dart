//normal package
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
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/top_rated_tvseries'
    '/top_rated_tvseries_bloc.dart';




class
TopRatedTvSeriesPage
    extends
    StatefulWidget {


  static
  const
  ROUTE_NAME
  = '/top-rated-tvseries';

  @override
  _TopRatedTvSeriesPageState
  createState()
  => _TopRatedTvSeriesPageState(
  );

}



class
_TopRatedTvSeriesPageState
    extends State<
        TopRatedTvSeriesPage
    > {

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
          TopRatedTvseriesBloc>()
          .add(
          TopRatedTvseriesGetEvent()
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
            'Top Rated Tv Series'
        ),
      ),

      body: Padding(
        padding: const
        EdgeInsets
            .all(
            8.0
        ),

        child: BlocBuilder<
            TopRatedTvseriesBloc,
            TopRatedTvseriesState>(


          builder: (
              context,
              state
              ) {

            if (
            state
            is
            TopRatedTvseriesLoading
            ) {


              return
                const
                Center(

                child:
                CircularProgressIndicator(
                ),
              );


            } else if (
            state
            is TopRatedTvseriesLoaded
            ) {

              return
                ListView
                    .builder(
                itemBuilder: (
                    context,
                    index
                    ) {

                  final
                  tvserie
                  = state
                      .result[
                        index
                  ];


                  return
                    TvSeriesCard(
                        tvserie
                    );

                },
                itemCount:
                state
                    .result
                    .length,
              );


            } else {
              return
                Center(
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


