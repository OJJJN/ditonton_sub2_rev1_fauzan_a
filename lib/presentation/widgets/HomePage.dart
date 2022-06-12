//normal package

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/about_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/home_movie_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
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
    '/widgets'
    '/watchlist_page.dart';


import 'package:'
    'flutter'
    '/material.dart';


//import 'package:firebase_crashlytics/firebase_crashlytics.dart';





class
HomePage
    extends
    StatefulWidget {
  static
  const
  ROUTE_NAME
  = '/homePage';


  const
  HomePage({
    Key? key
  })
      : super(
      key: key
  );



  @override
  _HomeMoviePageState
  createState()
  => _HomeMoviePageState(
  );
}



class
_HomeMoviePageState
    extends
    State<
        HomePage
    > {



  late
  int
  _selectedIndex
  = 0;



  final
  _screen
  = <
      Widget>[
    const
    HomeMoviePage(
    ),

    HomeTvSeriesPage(
    ),
  ];



  final
  title
  = <
      String
  >[
    'Movies',
    'Tv Series',
  ];



  @override
  Widget build(
      BuildContext
      context
      ) {


    return
      Scaffold(
      appBar: AppBar(
        title: const
        Text(
            'Ditonton'
        ),
        actions: [
          IconButton(
            onPressed: () {
              //FirebaseCrashlytics.instance.crash();
              Navigator
                  .pushNamed(
                  context,
                  SearchPage
                      .ROUTE_NAME
              );

            },
            icon: const
            Icon(
                Icons
                    .search
            ),
          )
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/movie-and-tvseries.png'
                ),
              ),

              accountName: Text(
                  'Ditonton Movie And TvSeries'
              ),

              accountEmail: Text(
                  'ditonton@dicoding.com'
              ),
            ),

            ListTile(
              leading:
              const Icon(
                  Icons
                      .local_movies_outlined
              ),

              title: const
              Text(
                  'Movies'
              ),

              onTap: (
                  ) {

                Navigator
                    .pop(
                    context
                );

              },
            ),
            ListTile(
              leading:
              const Icon(
                  Icons
                      .live_tv_sharp
              ),


              title:
              const Text(
                  'Tv Series'
              ),

              onTap: (
                  ) {

                Navigator
                    .pop(
                    context
                );

              },
            ),
            ListTile(
              leading:
              const Icon(
                  Icons
                      .save_alt
              ),


              title:
              const Text(
                  'Watchlist'
              ),

              onTap: (
                  ) {

                Navigator
                    .pop(
                    context
                );


                Navigator
                    .pushNamed(
                    context,
                    WatchlistPage
                        .ROUTE_NAME
                );
              },
            ),

            ListTile(
              onTap: (
                  ) {

                Navigator
                    .pushNamed(
                    context,
                    AboutPage
                        .ROUTE_NAME
                );

              },
              leading:
              const Icon(
                  Icons
                      .info_outline
              ),

              title:
              const Text(
                  'About'
              ),
            ),
          ],
        ),
      ),
      body:
      _screen[
        _selectedIndex
      ],
      bottomNavigationBar:
      customNavigationBar(
      ),
    );
  }



  Widget customNavigationBar(
      ) {
    return BottomNavigationBar(
        type:
        BottomNavigationBarType
            .fixed,
        backgroundColor:
        kPrussianBlue,
        currentIndex:
        _selectedIndex,
        selectedItemColor:
        kGreenColor,
        selectedLabelStyle:
        kSubtitle,
        unselectedLabelStyle:
        kBodyText,
        onTap: (
            int value
            ) {
          setState((
              ) {
            _selectedIndex
            = value;

          });
        },
        items: const [
              BottomNavigationBarItem(
                icon: Icon(
                    Icons
                        .local_movies_outlined
                ),

                label:
                'Movies',
              ),
              BottomNavigationBarItem(
                icon:
                Icon(
                    Icons
                        .live_tv_sharp
                ),

                label:
                'Tv Series',
              ),
            ],
    );
  }
}
