import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/utils.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/about_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/home_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/home_movie_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/movie_detail_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/popular_movies_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/top_rated_movies_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/watchlist_movies_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/search_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/home_tvseries_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/popular_tvseries_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/top_rated_tvseries_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/tvseries_detail_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/watchlist_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/movie_detail_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/movie_list_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/movie_search_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation/'
    'provider'
    '/popular_movies_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/top_rated_movies_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/watchlist_movie_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/popular_tvseries_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/top_rated_tvseries_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_detail_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_list_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_search_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/watchlist_tvseries_notifier.dart';


import 'package:'
    'flutter'
    '/cupertino.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'provider'
    '/provider.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/injection.dart' as di;



void main() {
  di.init();
  runApp(
      const MyApp());
}

class MyApp
    extends
    StatelessWidget {
  const MyApp(
      {Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              MovieListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              TvSeriesListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              MovieDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              TvSeriesDetailNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              MovieSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              TvSeriesSearchNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              TopRatedMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              TopRatedTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              PopularMoviesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              PopularTvSeriesNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              WatchlistMovieNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di
              .locator<
              WatchlistTvSeriesNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomePage(),
        navigatorObservers: [
          routeObserver],
        onGenerateRoute: (
            RouteSettings settings) {
          switch (
          settings
              .name) {
            case '/home':
              return MaterialPageRoute(builder: (_)
              => const HomePage()
              );


            case HomeMoviePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_)
              => const HomeMoviePage()
              );


            case HomeTvSeriesPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_)
              => const HomeTvSeriesPage()
              );


            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_)
              => const PopularMoviesPage()
              );


            case PopularTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_)
              => const PopularTvSeriesPage()
              );


            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_)
              => const TopRatedMoviesPage()
              );


            case TopRatedTvSeriesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_)
              => const TopRatedTvSeriesPage()
              );


            case MovieDetailPage.ROUTE_NAME:
              final
              id =
              settings
                  .arguments as int;


              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(
                    id: id
                ),
                settings: settings,
              );
            case TvSeriesDetailPage
                .ROUTE_NAME:
              final
              id
              = settings
                  .arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvSeriesDetailPage(
                    id: id
                ),
                settings: settings,
              );
            case SearchPage
                .ROUTE_NAME:
              return CupertinoPageRoute(
                  builder: (_)
                  => const SearchPage()
              );


            case WatchlistMoviesPage
                .ROUTE_NAME:
            case WatchlistPage
              .ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_)
                  => const WatchlistPage()
              );


            case AboutPage
                .ROUTE_NAME:
              return MaterialPageRoute(
                  builder: (_)
                  => const AboutPage()
              );
            default:
              return MaterialPageRoute(
                  builder: (_) {
                return const Scaffold(
                  body: Center(
                    child: Text(
                        'Page not found :('
                    ),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
