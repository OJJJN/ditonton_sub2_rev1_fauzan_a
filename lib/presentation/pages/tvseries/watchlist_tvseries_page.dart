import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/utils.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/watchlist_tvseries_notifier.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/widgets'
    '/tvseries_card_list.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'provider'
    '/provider.dart';



class WatchlistTvSeriesPage
    extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-tvseries';

  const WatchlistTvSeriesPage({Key? key}) : super(key: key);

  @override
  _WatchlistTvSeriesPageState createState()
  => _WatchlistTvSeriesPageState();
}

class _WatchlistTvSeriesPageState
    extends State<WatchlistTvSeriesPage>
    with RouteAware {
  @override
  void initState() {
    super
        .initState();
    Future
        .microtask(() =>
        Provider
            .of<WatchlistTvSeriesNotifier>(
            context,
            listen: false)
            .fetchWatchlistTvSeries());
  }

  @override
  void didChangeDependencies() {
    super
        .didChangeDependencies();
    routeObserver.subscribe(
        this,
        ModalRoute
            .of(
            context)!);
  }

  @override
  void didPopNext() {
    Provider.of<WatchlistTvSeriesNotifier>(
        context,
        listen: false)
        .fetchWatchlistTvSeries();
  }

  @override
  Widget build(
      BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          8.0),
      child: Consumer<
          WatchlistTvSeriesNotifier>(
        builder: (
            context,
            data,
            child) {
          if (data
              .watchlistTvState ==
              RequestState
                  .Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (data
              .watchlistTvState ==
              RequestState
                  .Loaded) {
            return ListView.builder(
              itemBuilder: (
                  context,
                  index) {
                final
                tvseries
                = data
                    .watchlistTvSeries[
                      index
                ];
                return TvSeriesCard(
                    tvseries
                );
              },
              itemCount: data
                  .watchlistTvSeries
                  .length,
            );
          } else {
            return Center(
              key: const Key(
                  'error_message'
              ),
              child: Text(
                  data
                      .message
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    routeObserver
        .unsubscribe(
        this);
    super
        .dispose(
    );
  }
}
