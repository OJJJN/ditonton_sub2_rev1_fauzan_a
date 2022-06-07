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
    '/watchlist_page.dart';


import 'package:'
    'flutter'
    '/material.dart';



class HomePage
    extends
    StatefulWidget {
  static const ROUTE_NAME = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeMoviePageState createState()
  => _HomeMoviePageState(
  );
}

class _HomeMoviePageState
    extends State<
        HomePage> {

  late
  int _selectedIndex = 0;

  final
  _screen
  = <Widget>[
    const HomeMoviePage(),
    const HomeTvSeriesPage(),
  ];

  final
  title
  = <String>[
    'Movies',
    'Tv Series',
  ];

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator
                  .pushNamed(
                  context, SearchPage
                  .ROUTE_NAME
              );
            },
            icon: const Icon(
                Icons
                    .search),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/circle-g.png'),
              ),
              accountName: Text(
                  'Ditonton'),
              accountEmail: Text(
                  'ditonton@dicoding.com'),
            ),
            ListTile(
              leading: const Icon(
                  Icons
                      .movie),
              title: const Text(
                  'Movies'),
              onTap: () {
                Navigator.pop(
                    context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons.tv),
              title: const Text(
                  'Tv Series'),
              onTap: () {
                Navigator.pop(
                    context);
              },
            ),
            ListTile(
              leading: const Icon(
                  Icons
                      .save_alt),
              title: const Text(
                  'Watchlist'),
              onTap: () {
                Navigator.pop(
                    context);
                Navigator.pushNamed(
                    context,
                    WatchlistPage
                        .ROUTE_NAME
                );
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(
                    context,
                    AboutPage
                        .ROUTE_NAME
                );
              },
              leading: const Icon(
                  Icons
                      .info_outline),
              title: const Text(
                  'About'),
            ),
          ],
        ),
      ),
      body: _screen[_selectedIndex],
      bottomNavigationBar: customNavigationBar(),
    );
  }

  Widget
  customNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: kMikadoYellow,
      selectedLabelStyle: kSubtitle,
      unselectedLabelStyle: kBodyText,
      onTap: (int value){
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
              Icons
                  .movie),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(
              Icons.tv),
          label: 'Tv Series',
        ),
      ],
    );
  }
}
