import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/watchlist_movies_page.dart' show WatchlistMoviesPage;


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/watchlist_tvseries_page.dart' show WatchlistTvSeriesPage;


import 'package:'
    'flutter'
    '/material.dart';



class WatchlistPage
    extends
    StatelessWidget {
  static const ROUTE_NAME = '/watchlistPage';

  const WatchlistPage(
      {Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (
                BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text(
                      'Watchlist'),
                  pinned: true,
                  floating: true,
                  bottom: TabBar(
                    indicatorColor: kMikadoYellow,
                    tabs: [
                      _buildTabBarItem(
                          'Movies', Icons
                          .movie),
                      _buildTabBarItem(
                          'TV Series', Icons
                          .tv),
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: <Widget>[
                WatchlistMoviesPage(),
                WatchlistTvSeriesPage(),
              ],
            ),
          )),
    );
  }

  Widget _buildTabBarItem(
      String title, IconData iconData)
  => Padding(
    padding: const EdgeInsets.only(
        top: 4.0,
        bottom: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment
          .center,
      children: [
        Icon(
            iconData),
        const SizedBox(
          width: 12.0,
        ),
        Text(
            title),
      ],
    ),
  );
}
