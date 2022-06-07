
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
    '/top_rated_tvseries_page.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/presentation'
    '/provider'
    '/top_rated_tvseries_notifier.dart';


import 'package:'
    'mockito'
    '/annotations.dart';


import 'package:'
    'ditonton_sub2_rev1_fauzan_a'
    '/common'
    '/state_enum.dart';



import 'package:'
    'flutter'
    '/material.dart';


import 'package:'
    'flutter_test'
    '/flutter_test.dart';


import 'package:'
    'mockito'
    '/mockito.dart';


import 'package:'
    'provider'
    '/provider.dart';



import 'top_rated_tvseries_page_test.mocks.dart';

@GenerateMocks(
    [
      TopRatedTvSeriesNotifier
    ]
)

void main() {
  late
  MockTopRatedTvSeriesNotifier
  mockNotifier
  ;



  setUp(() {
    mockNotifier =
        MockTopRatedTvSeriesNotifier(
        );
  });

  Widget _makeTestableWidget(
      Widget body) {
    return ChangeNotifierProvider<TopRatedTvSeriesNotifier>
        .value(
      value: mockNotifier,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Page should display progress bar when loading',
          (
          WidgetTester tester)
      async {
        when(
            mockNotifier.state)
            .thenReturn(
            RequestState
                .Loading
        );

        final
        progressFinder
        = find.byType(
            CircularProgressIndicator
        );


        final
        centerFinder
        = find.byType(
            Center
        );



        await tester
            .pumpWidget(
            _makeTestableWidget(
                const TopRatedTvSeriesPage()
            )
        );

        expect(
            centerFinder,
            findsOneWidget
        );


        expect(
            progressFinder,
            findsOneWidget
        );
      });

  testWidgets(
      'Page should display when data is loaded',
          (
          WidgetTester tester)
      async {
        when(
            mockNotifier.state)
            .thenReturn(
            RequestState
                .Loaded
        );


        when(
            mockNotifier
                .tvseries)
            .thenReturn(
            <TvSeries>[
            ]
        );

        final
        listViewFinder
        = find
            .byType(
            ListView
        );

        await tester
            .pumpWidget(
            _makeTestableWidget(
                const TopRatedTvSeriesPage()
            )
        );

        expect(
            listViewFinder,
            findsOneWidget
        );
      });

  testWidgets(
      'Page should display text with message when Error',
          (
          WidgetTester tester)
      async {
        when(
            mockNotifier.state)
            .thenReturn(
            RequestState
                .Error
        );


        when(
            mockNotifier.message)
            .thenReturn(
            'Error message'
        );



        final
        textFinder
        = find.byKey(
            const Key(
                'error_message')
        );



        await tester
            .pumpWidget(
            _makeTestableWidget(
                const TopRatedTvSeriesPage()
            )
        );

        expect(
            textFinder,
            findsOneWidget
        );
      });
}