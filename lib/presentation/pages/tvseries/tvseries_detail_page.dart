import 'package:'
    'cached_network_image'
    '/cached_network_image.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/genre.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries_detail.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/tvseries_detail_notifier.dart';


import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'flutter_rating_bar'
    '/flutter_rating_bar.dart';


import 'package:'
    'provider'
    '/provider.dart';



class TvSeriesDetailPage
    extends
    StatefulWidget {
  static const ROUTE_NAME = '/detailTvSeries';

  final
  int id;


  const TvSeriesDetailPage(
      {Key? key, required this.id}) :
        super(key: key);

  @override
  _TvSeriesDetailPageState createState() =>
      _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState
    extends
    State<
        TvSeriesDetailPage> {
  @override
  void initState() {
    super
        .initState();
    Future
        .microtask(() {
      Provider
          .of<TvSeriesDetailNotifier>(
          context,
          listen: false)
          .fetchTvSeriesDetail(
          widget.id);
      Provider.of<TvSeriesDetailNotifier>(
          context, listen: false)
          .loadWatchlistTvSeriesStatus(
          widget.id);
    });
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      body: Consumer<
          TvSeriesDetailNotifier>(
        builder: (
            context,
            provider,
            child) {
          if (
          provider.tvSeriesState ==
              RequestState
                  .Loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (
          provider
              .tvSeriesState ==
              RequestState
                  .Loaded) {
            final movie = provider
                .tvseries;
            return SafeArea(
              child: DetailContent(
                movie,
                provider
                    .tvSeriesRecommendations,
                provider
                    .isAddedToWatchlist,
              ),
            );
          } else {
            return Text(
                provider
                    .message);
          }
        },
      ),
    );
  }
}

class DetailContent
    extends
    StatelessWidget {

  final
  TvSeriesDetail
  tvseries;


  final
  List<TvSeries>
  recommendations;


  final
  bool
  isAddedWatchlist;



  const DetailContent(this.tvseries,
      this.recommendations,
      this.isAddedWatchlist,
      {Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvseries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (
              context, url, error) => const Icon(
              Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(
              top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (
                context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvseries.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlist) {
                                  await Provider
                                      .of<TvSeriesDetailNotifier>(
                                      context,
                                      listen: false)
                                      .addWatchlistTvSeries(
                                      tvseries);
                                } else {
                                  await Provider
                                      .of<TvSeriesDetailNotifier>(
                                      context,
                                      listen: false)
                                      .removeFromWatchlistTvSeries(
                                      tvseries);
                                }

                                final message =
                                    Provider
                                        .of<TvSeriesDetailNotifier>(
                                        context,
                                        listen: false)
                                        .watchlistMessage;

                                if (message ==
                                    TvSeriesDetailNotifier
                                        .watchlistAddSuccessMessage ||
                                    message ==
                                        TvSeriesDetailNotifier
                                            .watchlistRemoveSuccessMessage) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)));
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Text(
                                              message),
                                        );
                                      });
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? const Icon(
                                      Icons
                                          .check)
                                      : const Icon(
                                      Icons
                                          .add),
                                  const Text(
                                      'Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(
                                  tvseries
                                      .genres),
                            ),
                            Text(
                              (tvseries
                                  .firstAirDate),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvseries
                                      .voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (
                                      context, index) => const Icon(
                                    Icons
                                        .star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text(
                                    '${tvseries.voteAverage}')
                              ],
                            ),
                            const SizedBox(
                                height:
                                16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvseries.overview,
                            ),
                            const SizedBox(
                                height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            Consumer<TvSeriesDetailNotifier>(
                              builder: (
                                  context,
                                  data,
                                  child) {
                                if (
                                data
                                    .recommendationState ==
                                    RequestState
                                        .Loading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (data
                                    .recommendationState ==
                                    RequestState
                                        .Error) {
                                  return Text(
                                      data
                                          .message);
                                } else if (data
                                    .recommendationState ==
                                    RequestState
                                        .Loaded) {
                                  return SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis
                                          .horizontal,
                                      itemBuilder: (
                                          context,
                                          index) {
                                        final movie = recommendations[
                                          index
                                        ];
                                        return Padding(
                                          padding: const EdgeInsets.all(
                                              4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvSeriesDetailPage.ROUTE_NAME,
                                                arguments: movie.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                                placeholder: (context, url) =>
                                                const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (
                                                    context,
                                                    url,
                                                    error) =>
                                                const Icon(
                                                    Icons
                                                        .error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations
                                          .length,
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors
                            .white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
            // initialChildSize: 0.5,
            minChildSize: 0.25,
            // maxChildSize: 1.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(
              8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(
                  Icons
                      .arrow_back),
              onPressed: () {
                Navigator.pop(
                    context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(
      List<Genre> genres) {
    String result = '';
    for (
    var genre in genres) {
      result += genre.name + ', ';
    }

    if (
    result
        .isEmpty) {
      return result;
    }

    return result.substring(
        0, result.length - 2);
  }

}
