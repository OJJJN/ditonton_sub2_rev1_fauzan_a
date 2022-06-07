import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/top_rated_tvseries_notifier.dart';


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



class TopRatedTvSeriesPage
    extends
    StatefulWidget {
  static const ROUTE_NAME = '/top-rated-TvSeries';

  const TopRatedTvSeriesPage(
      {Key? key}) : super(key: key);

  @override
  _TopRatedMoviesPageState createState()
  => _TopRatedMoviesPageState();
}

class _TopRatedMoviesPageState
    extends State<
        TopRatedTvSeriesPage> {
  @override
  void initState() {
    super
        .initState();
    Future.microtask(() =>
        Provider
            .of<TopRatedTvSeriesNotifier>(
            context,
            listen: false)
            .fetchTopRatedTvSeries());
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Top Rated Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets
            .all(
            8.0),
        child: Consumer<
            TopRatedTvSeriesNotifier>(
          builder: (
              context,
              data,
              child) {
            if (
            data.state
                == RequestState
                .Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (
            data.state
                == RequestState
                .Loaded) {
              return ListView
                  .builder(
                itemBuilder: (
                    context,
                    index) {
                  final
                  tvseries
                  = data
                      .tvseries[
                        index
                  ];
                  return TvSeriesCard(
                      tvseries
                  );
                },
                itemCount: data
                    .tvseries
                    .length,
              );
            } else {
              return Center(
                key: const Key(
                    'error_message'),
                child: Text(
                    data
                        .message),
              );
            }
          },
        ),
      ),
    );
  }
}
