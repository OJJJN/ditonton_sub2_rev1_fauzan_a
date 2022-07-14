//normal package
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//bloc package
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
    '/widgets'
    '/tvseries_card_list.dart';

class PopularTvSeriesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-tvseries';

  @override
  _PopularTvSeriesPageState createState() => _PopularTvSeriesPageState();
}

class _PopularTvSeriesPageState extends State<PopularTvSeriesPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PopularTvseriesBloc>().add(PopularTvseriesGetEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularTvseriesBloc, PopularTvseriesState>(
          builder: (context, state) {
            if (state is PopularTvseriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularTvseriesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvserie = state.result[index];

                  return TvSeriesCard(tvserie);
                },
                itemCount: state.result.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text("Error"),
              );
            }
          },
        ),
      ),
    );
  }
}
