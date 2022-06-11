//normal package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/search_page_movies.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/search_page_tvseries.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';



class
SearchPage
    extends
    StatelessWidget {

  static
  const
  ROUTE_NAME
  = '/searchPage';



  const
  SearchPage(
      {Key? key})
      : super(
      key: key
  );



  @override
  Widget build(
      BuildContext
      context
      ) {

    return DefaultTabController(
      length:
      2,
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled
                ) {

              return <
                  Widget>[
                SliverAppBar(
                  title:
                  const Text(
                      'Search'
                  ),
                  pinned:
                  true,
                  floating:
                  true,
                  bottom: TabBar(
                    unselectedLabelColor:
                    kGrey,
                    labelColor:
                    kMikadoYellow,
                    indicatorColor:
                    kGreenColor,
                    tabs: [
                      _buildTabBarItem(
                          'Movies',
                          Icons
                              .local_movies_outlined
                      ),
                      _buildTabBarItem(
                          'TV Series',
                          Icons
                              .live_tv_sharp
                      ),
                    ],
                  ),
                ),
              ];
            },

            body:  TabBarView(
              children: <
                  Widget>[
                SearchPageMovies(
                ),

                SearchPageTvSeries(
                ),
              ],
            ),
          )),
    );
  }

  Widget
  _buildTabBarItem(
      String title,
      IconData iconData
      )
  => Padding(
    padding:
    const
    EdgeInsets
        .only(
        top: 4.0,
        bottom:
        12.0
    ),
    child:
    Row(
      mainAxisAlignment:
      MainAxisAlignment
          .center,
      children: [
        Icon(
            iconData
        ),
        const SizedBox(
          width:
          12.0,
        ),
        Text(
            title
        ),
      ],
    ),
  );
}
