//this is call the package
import 'package:'
    'flutter'
    '/material.dart';


//this is call the package
import 'package:'
    'google_fonts'
    '/google_fonts.dart';

// image url
const String BASE_IMAGE_URL =
    'https://image.tmdb.org/t/p/w500';

// colors
const Color kRichBlack =
    Color(
        0xFF000814
    );

// colors
const Color kOxfordBlue =
    Color(
        0xFF001D3D
    );

// colors
const Color kPrussianBlue =
    Color(
        0xFF003566
    );

// colors
const Color kMikadoYellow =
    Color(
        0xFFffc300
    );

// colors
const Color kDavysGrey =
    Color(
        0xFF4B5358
    );

// colors
const Color kGrey =
    Color(
        0xFF303030
    );

//colors
const Color kGreenColor =
Color(
    0xFF0C9869
);

// text style
final TextStyle kHeading5 =
GoogleFonts.karma(
    fontSize: 23,
    fontWeight:
    FontWeight
        .w400
);

// text style
final TextStyle kHeading6 =
GoogleFonts.karma(
    fontSize:
    19,
    fontWeight:
    FontWeight
        .w500,
    letterSpacing:
    0.15
);

// text style
final TextStyle kSubtitle =
GoogleFonts.karma(
    fontSize:
    15,
    fontWeight:
    FontWeight
        .w400,
    letterSpacing:
    0.15
);

// text style
final TextStyle kBodyText =
GoogleFonts.karma(
    fontSize:
    13,
    fontWeight:
    FontWeight
        .w400,
    letterSpacing:
    0.25
);


// text theme
final kTextTheme =
TextTheme(
    headline5:
    kHeading5,
    headline6:
    kHeading6,
    subtitle1:
    kSubtitle,
    bodyText2:
    kBodyText,
);


// scheme
const kColorScheme =
ColorScheme(
    primary:
    kMikadoYellow,
    primaryContainer:
    kMikadoYellow,
    secondary:
    kPrussianBlue,
    secondaryContainer:
    kPrussianBlue,
    surface:
    kRichBlack,
    background:
    kRichBlack,
    error:
    Colors
        .red,
    onPrimary:
    kRichBlack,
    onSecondary:
    Colors
        .white,
    onSurface:
    Colors
        .white,
    onBackground:
    Colors
        .white,
    onError:
    Colors
        .white,
    brightness:
    Brightness
        .dark,
);

