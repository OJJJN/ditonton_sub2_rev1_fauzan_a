//normalpackage

import 'package:'
    'cached_network_image'
    '/cached_network_image.dart';

import 'package:'
    'flutter'
    '/material.dart';

import 'package:'
    'flutter_bloc'
    '/flutter_bloc.dart';

//page

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

//bloc
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/on_the_air_tvseries'
    '/on_the_air_tvseries_bloc.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/popular_tvseries'
    '/popular_tvseries_bloc.dart';

import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/bloc'
    '/tvseries'
    '/top_rated_tvseries'
    '/top_rated_tvseries_bloc.dart';

//constants
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/constants.dart';

//entitie
import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/domain'
    '/entities'
    '/tvseries.dart';

class HomeTvSeriesPage extends StatefulWidget {
  @override
  _HomeTvSeriesPageState createState() => _HomeTvSeriesPageState();

  static const ROUTE_NAME = '/tvseries';
}

class _HomeTvSeriesPageState extends State<HomeTvSeriesPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<OnTheAirTvseriesBloc>().add(OnTheAirTvseriesGetEvent());

      context.read<PopularTvseriesBloc>().add(PopularTvseriesGetEvent());

      context.read<TopRatedTvseriesBloc>().add(TopRatedTvseriesGetEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'On The Air Tv Series',
                style: kHeading6,
              ),
              BlocBuilder<OnTheAirTvseriesBloc, OnTheAirTvseriesState>(
                builder: (context, state) {
                  if (state is OnTheAirTvseriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is OnTheAirTvseriesLoaded) {
                    return TvSeriesList(state.result);
                  } else if (state is OnTheAirTvseriesError) {
                    return Text(state.message);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Popular Tv Series',
                onTap: () => Navigator.pushNamed(
                    context, PopularTvSeriesPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularTvseriesBloc, PopularTvseriesState>(
                builder: (context, state) {
                  if (state is PopularTvseriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is PopularTvseriesLoaded) {
                    return TvSeriesList(state.result);
                  } else if (state is PopularTvseriesError) {
                    return Text(state.message);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
              _buildSubHeading(
                title: 'Top Rated Tv Series',
                onTap: () => Navigator.pushNamed(
                    context, TopRatedTvSeriesPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedTvseriesBloc, TopRatedTvseriesState>(
                builder: (context, state) {
                  if (state is TopRatedTvseriesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopRatedTvseriesLoaded) {
                    return TvSeriesList(state.result);
                  } else if (state is TopRatedTvseriesError) {
                    return Text(state.message);
                  } else {
                    return const Text('Failed');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvSeriesList extends StatelessWidget {
  final List<TvSeries> tvseries;

  TvSeriesList(this.tvseries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvserie = tvseries[index];

          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: tvserie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvserie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvseries.length,
      ),
    );
  }
}
