//normal package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


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
    '/search_movies'
    '/movie_search_bloc.dart';






class
SearchPageMovies
    extends
    StatelessWidget {
  static
  const
  ROUTE_NAME
  = '/search';



  @override
  Widget build(
      BuildContext
      context
      ) {

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
                    MovieSearchBloc>(
                )
                    .add(
                    MovieSearchQueryEvent(
                        query)
                );
              },
              decoration: InputDecoration(
                hintText: 'Search title',
                prefixIcon: Icon(
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
              style:
              kHeading6,
            ),
            BlocBuilder<
                MovieSearchBloc,
                MovieSearchState>
              (
              builder: (
                  context,
                  state
                  ) {

                if (
                state
                is MovieSearchLoading
                ) {

                  return
                    const Center(
                    child: CircularProgressIndicator(
                    ),
                  );


                } else if (
                state
                is
                MovieSearchLoaded
                ) {

                  final
                  result
                  = state
                      .result;


                  return Expanded(
                    child: ListView
                        .builder(
                      padding: const
                      EdgeInsets
                          .all(
                          8
                      ),

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