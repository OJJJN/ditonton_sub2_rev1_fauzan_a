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
    '/tvseries.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/pages'
    '/tvseries'
    '/tvseries_detail_page.dart';


import 'package:'
    'flutter'
    '/material.dart';




class TvSeriesCard
    extends
    StatelessWidget {

  final
  TvSeries
  tvseries;



  const TvSeriesCard(
      this.tvseries,
      {Key? key}) : super(key: key);

  @override
  Widget build(
      BuildContext context) {
    return Container(
      margin: const EdgeInsets
          .symmetric(
          vertical:
          4),
      child: InkWell(
        onTap: () {
          Navigator
              .pushNamed(
            context,
            TvSeriesDetailPage
                .ROUTE_NAME,
            arguments: tvseries
                .id,
          );
        },
        child: Stack(
          alignment: Alignment
              .bottomLeft,
          children: [
            Card(
              child: Container(
                margin: const EdgeInsets
                    .only(
                  left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text(
                      tvseries
                          .name ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow
                          .ellipsis,
                      style: kHeading6,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      tvseries
                          .overview ?? '-',
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: ClipRRect(
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvseries.posterPath}',
                  width: 80,
                  placeholder: (context, url)
                  => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (
                      context,
                      url,
                      error) => const Icon(
                      Icons
                          .error
                  ),
                ),
                borderRadius: const BorderRadius
                    .all(
                    Radius
                        .circular(
                        8)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
