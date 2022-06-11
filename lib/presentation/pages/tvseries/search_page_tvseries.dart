//normal package
import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';



//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/search_tvseries'
    '/tvseries_search_bloc.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
    '/tvseries_card_list.dart';





class
SearchPageTvSeries
    extends
    StatelessWidget {


  static
  const ROUTE_NAME
  = '/search-tvseries';



  @override
  Widget build(
      BuildContext
      context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Search'
        ),
      ),

      body: Padding(
        padding: const
        EdgeInsets
            .all(
            16.0
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment
              .start,
          children: [
            TextField(
              onSubmitted: (
                  query
                  ) {

                context
                    .read<
                    TvseriesSearchBloc>(
                )
                    .add(
                    TvseriesSearchQueryEvent(
                        query)
                );


              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon:
                Icon(
                    Icons
                        .search
                ),

                border: OutlineInputBorder(
                ),
              ),

              textInputAction:
              TextInputAction
                  .search,
            ),
            SizedBox(
                height:
                16
            ),

            Text(
              'Search Result',
              style: kHeading6,
            ),
            BlocBuilder<
                TvseriesSearchBloc,
                TvseriesSearchState>(

              builder: (
                  context,
                  state
                  ) {

                if (
                state
                is TvseriesSearchLoading
                ) {

                  return
                    const Center(
                    child: CircularProgressIndicator(
                    ),
                  );


                } else if (
                state
                is TvseriesSearchLoaded
                ) {

                  final
                  result
                  = state
                      .result;


                  return Expanded(
                    child: ListView
                        .builder(
                      padding:
                      const EdgeInsets
                          .all(
                          8
                      ),

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


                        return
                          TvSeriesCard(
                              tvseries
                          );
                      },
                      itemCount:
                      result
                          .length,
                    ),
                  );


                } else {
                  return
                    Expanded(
                    child: Container(
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
