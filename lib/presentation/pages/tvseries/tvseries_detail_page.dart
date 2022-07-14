//normal package
import 'package:'
    'flutter'
    '/material.dart';

import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';

import 'package:'
    'flutter_rating_bar'
    '/flutter_rating_bar.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common/'
    'commutils.dart';

import 'package'
    ':cached_network_image'
    '/cached_network_image.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';

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

//bloc package
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_detail'
    '/tvseries_detail_bloc.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_recommendations'
    '/tvseries_recommendations_bloc.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/tvseries_watchlist'
    '/watchlist_tvseries_bloc.dart';

class TvSeriesDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tvseries';

  final int id;

  TvSeriesDetailPage({required this.id});

  @override
  _TvSeriesDetailPageState createState() => _TvSeriesDetailPageState();
}

class _TvSeriesDetailPageState extends State<TvSeriesDetailPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TvseriesDetailBloc>().add(TvseriesDetailGetEvent(widget.id));

      context
          .read<TvseriesRecommendationsBloc>()
          .add(TvseriesRecommendationsGetEvent(widget.id));

      context
          .read<WatchlistTvseriesBloc>()
          .add(WatchlistTvseriesGetStatusEvent(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    TvseriesRecommendationsState tvseriesRecommendations =
        context.watch<TvseriesRecommendationsBloc>().state;

    return Scaffold(
      body: BlocListener<WatchlistTvseriesBloc, WatchlistTvseriesState>(
        listener: (_, state) {
          if (state is WatchlistTvseriesSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.message),
            ));
            context
                .read<WatchlistTvseriesBloc>()
                .add(WatchlistTvseriesGetStatusEvent(widget.id));
          }
        },
        child: BlocBuilder<TvseriesDetailBloc, TvseriesDetailState>(
          builder: (context, state) {
            if (state is TvseriesDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TvseriesDetailLoaded) {
              final tvSeries = state.tvSeriesDetail;

              bool isAddedToWatchlist = (context
                      .watch<WatchlistTvseriesBloc>()
                      .state is WatchlistTvseriesStatusLoaded)
                  ? (context.read<WatchlistTvseriesBloc>().state
                          as WatchlistTvseriesStatusLoaded)
                      .result
                  : false;

              return SafeArea(
                child: DetailContent(
                  tvSeries,
                  tvseriesRecommendations is TvseriesRecommendationsLoaded
                      ? tvseriesRecommendations.tvSeries
                      : List.empty(),
                  isAddedToWatchlist,
                ),
              );
            } else {
              return Text("Empty");
            }
          },
        ),
      ),
    );
  }
}

class DetailContent extends StatelessWidget {
  final TvSeriesDetail tvSeries;

  final List<TvSeries> recommendations;

  final bool isAddedWatchlist;

  DetailContent(this.tvSeries, this.recommendations, this.isAddedWatchlist);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvSeries.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedWatchlist) {
                                  BlocProvider.of<WatchlistTvseriesBloc>(
                                      context)
                                    ..add(WatchlistTvseriesTambahItemEvent(
                                        tvSeries));
                                } else {
                                  BlocProvider.of<WatchlistTvseriesBloc>(
                                      context)
                                    ..add(WatchlistTvseriesHapusItemEvent(
                                        tvSeries));
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedWatchlist
                                      ? Icon(Icons.playlist_add_check)
                                      : Icon(Icons.library_add_outlined),
                                  Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              showFormatGenres(tvSeries.genres),
                            ),
                            Text(
                              (tvSeries.firstAirDate),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvSeries.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${tvSeries.voteAverage}')
                              ],
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              tvSeries.overview,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            BlocBuilder<TvseriesRecommendationsBloc,
                                TvseriesRecommendationsState>(
                              builder: (context, state) {
                                if (state is TvseriesRecommendationsLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state
                                    is TvseriesRecommendationsError) {
                                  return Text(state.message);
                                } else if (state
                                    is TvseriesRecommendationsLoaded) {
                                  final recommendations = state.tvSeries;

                                  if (recommendations.isEmpty) {
                                    return const Text("No tv recommendations");
                                  }
                                  return Container(
                                    height: 150,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvSeries = recommendations[index];

                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                context,
                                                TvSeriesDetailPage.ROUTE_NAME,
                                                arguments: tvSeries.id,
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    'https://image.tmdb.org/t/p/w500${tvSeries.posterPath}',
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendations.length,
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
                        color: Colors.white,
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
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}
