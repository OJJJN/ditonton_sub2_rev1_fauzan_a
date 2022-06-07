import 'package:'
    'cached_network_image'
    '/cached_network_image.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


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
    '/provider'
    '/tvseries_list_notifier.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'provider'
    '/provider.dart';



class HomeTvSeriesPage
    extends
    StatefulWidget {
  static const ROUTE_NAME = '/homeTvSeries';

  const HomeTvSeriesPage({Key? key}) : super(key: key);
  @override
  _HomeTvSeriesPageState createState() =>
      _HomeTvSeriesPageState();
}

class _HomeTvSeriesPageState
    extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
            () => Provider.of<
                TvSeriesListNotifier>(
                context,
                listen: false)
          ..fetchNowPlayingTvSeries()
          ..fetchPopularTvSeries()
          ..fetchTopRatedTvSeries());
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
            8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              Consumer<TvSeriesListNotifier>(
                  builder: (
                      context, data, child) {
                final state = data
                    .nowPlayingState;
                if (state == RequestState
                    .Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState
                    .Loaded) {
                  return TvSeriesList(data
                      .nowPlayingTvSeries);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(
                        context,
                        PopularTvSeriesPage
                            .ROUTE_NAME),
              ),
              Consumer<TvSeriesListNotifier>(
                  builder: (
                      context,
                      data,
                      child) {
                final state = data
                    .popularTvSeriesState;
                if (state == RequestState
                    .Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState
                    .Loaded) {
                  return TvSeriesList(
                      data.popularTvSeries);
                } else {
                  return const Text(
                      'Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(
                        context,
                        TopRatedTvSeriesPage
                            .ROUTE_NAME),
              ),
              Consumer<TvSeriesListNotifier>(
                  builder: (context, data, child) {
                final state = data
                    .topRatedTvSeriesState;
                if (state == RequestState
                    .Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (
                state == RequestState
                    .Loaded) {
                  return TvSeriesList(data
                      .topRatedTvSeries);
                } else {
                  return const Text(
                      'Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title,
    required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(
                8.0),
            child: Row(
              children: const [Text(
                  'See More'),
                Icon(
                    Icons
                        .arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList
    extends
    StatelessWidget {
  final List<TvSeries>
  tvSeries;

  const TvSeriesList(
      this.tvSeries,
      {Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView
          .builder(
        scrollDirection: Axis
            .horizontal,
        itemBuilder: (
            context, index) {
          final tvseries = tvSeries[
            index];
          return Container(
            padding: const EdgeInsets.all(
                8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage
                      .ROUTE_NAME,
                  arguments: tvseries
                      .id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(
                        16)
                ),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvseries
                      .posterPath}',
                  placeholder: (
                      context,
                      url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context,
                      url,
                      error) => const Icon(
                      Icons
                          .error
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
