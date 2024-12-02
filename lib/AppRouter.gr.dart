// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:flutter/foundation.dart' as _i29;
import 'package:flutter/material.dart' as _i28;
import 'package:fstapp/dataModels/PlaceModel.dart' as _i30;
import 'package:fstapp/pages/AdminDashboardPage.dart' deferred as _i1;
import 'package:fstapp/pages/AdministrationOccasion/AdminPage.dart'
    deferred as _i2;
import 'package:fstapp/pages/BlueprintEditorPage.dart' deferred as _i3;
import 'package:fstapp/pages/CheckPage.dart' deferred as _i4;
import 'package:fstapp/pages/EventEditPage.dart' deferred as _i5;
import 'package:fstapp/pages/EventPage.dart' deferred as _i6;
import 'package:fstapp/pages/ForgotPasswordPage.dart' deferred as _i7;
import 'package:fstapp/pages/FormPage.dart' deferred as _i8;
import 'package:fstapp/pages/GamePage.dart' deferred as _i9;
import 'package:fstapp/pages/HtmlEditorPage.dart' deferred as _i10;
import 'package:fstapp/pages/InfoPage.dart' deferred as _i11;
import 'package:fstapp/pages/InstallPage.dart' deferred as _i12;
import 'package:fstapp/pages/LoginPage.dart' deferred as _i13;
import 'package:fstapp/pages/MapPage.dart' deferred as _i14;
import 'package:fstapp/pages/MySchedulePage.dart' deferred as _i15;
import 'package:fstapp/pages/NewsFormPage.dart' deferred as _i16;
import 'package:fstapp/pages/NewsPage.dart' deferred as _i17;
import 'package:fstapp/pages/OccasionHomePage.dart' deferred as _i18;
import 'package:fstapp/pages/ScheduleNavigationScreen.dart' deferred as _i20;
import 'package:fstapp/pages/SchedulePage.dart' deferred as _i21;
import 'package:fstapp/pages/SettingsPage.dart' deferred as _i22;
import 'package:fstapp/pages/SignupPage.dart' deferred as _i23;
import 'package:fstapp/pages/SignupPasswordPage.dart' deferred as _i19;
import 'package:fstapp/pages/SongPage.dart' deferred as _i24;
import 'package:fstapp/pages/TimetablePage.dart' deferred as _i25;
import 'package:fstapp/pages/UserPage.dart' deferred as _i26;

/// generated route for
/// [_i1.AdminDashboardPage]
class AdminDashboardRoute extends _i27.PageRouteInfo<void> {
  const AdminDashboardRoute({List<_i27.PageRouteInfo>? children})
      : super(
          AdminDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminDashboardRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.AdminDashboardPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.AdminPage]
class AdminRoute extends _i27.PageRouteInfo<void> {
  const AdminRoute({List<_i27.PageRouteInfo>? children})
      : super(
          AdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i2.loadLibrary,
        () => _i2.AdminPage(),
      );
    },
  );
}

/// generated route for
/// [_i3.BlueprintEditorPage]
class BlueprintEditorRoute
    extends _i27.PageRouteInfo<BlueprintEditorRouteArgs> {
  BlueprintEditorRoute({
    _i28.Key? key,
    int? id,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          BlueprintEditorRoute.name,
          args: BlueprintEditorRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'BlueprintEditorRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<BlueprintEditorRouteArgs>(
          orElse: () => BlueprintEditorRouteArgs(id: pathParams.optInt('id')));
      return _i27.DeferredWidget(
        _i3.loadLibrary,
        () => _i3.BlueprintEditorPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  );
}

class BlueprintEditorRouteArgs {
  const BlueprintEditorRouteArgs({
    this.key,
    this.id,
  });

  final _i28.Key? key;

  final int? id;

  @override
  String toString() {
    return 'BlueprintEditorRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i4.CheckPage]
class CheckRoute extends _i27.PageRouteInfo<CheckRouteArgs> {
  CheckRoute({
    required int id,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          CheckRoute.name,
          args: CheckRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'CheckRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CheckRouteArgs>(
          orElse: () => CheckRouteArgs(id: pathParams.getInt('id')));
      return _i27.DeferredWidget(
        _i4.loadLibrary,
        () => _i4.CheckPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
  );
}

class CheckRouteArgs {
  const CheckRouteArgs({
    required this.id,
    this.key,
  });

  final int id;

  final _i28.Key? key;

  @override
  String toString() {
    return 'CheckRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i5.EventEditPage]
class EventEditRoute extends _i27.PageRouteInfo<EventEditRouteArgs> {
  EventEditRoute({
    _i28.Key? key,
    int? id,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EventEditRoute.name,
          args: EventEditRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EventEditRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EventEditRouteArgs>(
          orElse: () => EventEditRouteArgs(id: pathParams.optInt('id')));
      return _i27.DeferredWidget(
        _i5.loadLibrary,
        () => _i5.EventEditPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  );
}

class EventEditRouteArgs {
  const EventEditRouteArgs({
    this.key,
    this.id,
  });

  final _i28.Key? key;

  final int? id;

  @override
  String toString() {
    return 'EventEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.EventPage]
class EventRoute extends _i27.PageRouteInfo<EventRouteArgs> {
  EventRoute({
    int? id,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          EventRoute.name,
          args: EventRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'EventRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<EventRouteArgs>(
          orElse: () => EventRouteArgs(id: pathParams.optInt('id')));
      return _i27.DeferredWidget(
        _i6.loadLibrary,
        () => _i6.EventPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
  );
}

class EventRouteArgs {
  const EventRouteArgs({
    this.id,
    this.key,
  });

  final int? id;

  final _i28.Key? key;

  @override
  String toString() {
    return 'EventRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i27.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i7.loadLibrary,
        () => _i7.ForgotPasswordPage(),
      );
    },
  );
}

/// generated route for
/// [_i8.FormPage]
class FormRoute extends _i27.PageRouteInfo<FormRouteArgs> {
  FormRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          FormRoute.name,
          args: FormRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FormRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<FormRouteArgs>(orElse: () => const FormRouteArgs());
      return _i27.DeferredWidget(
        _i8.loadLibrary,
        () => _i8.FormPage(key: args.key),
      );
    },
  );
}

class FormRouteArgs {
  const FormRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'FormRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.GamePage]
class GameRoute extends _i27.PageRouteInfo<GameRouteArgs> {
  GameRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<GameRouteArgs>(orElse: () => const GameRouteArgs());
      return _i27.DeferredWidget(
        _i9.loadLibrary,
        () => _i9.GamePage(key: args.key),
      );
    },
  );
}

class GameRouteArgs {
  const GameRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.HtmlEditorPage]
class HtmlEditorRoute extends _i27.PageRouteInfo<HtmlEditorRouteArgs> {
  HtmlEditorRoute({
    Map<String, dynamic>? content,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          HtmlEditorRoute.name,
          args: HtmlEditorRouteArgs(
            content: content,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'HtmlEditorRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HtmlEditorRouteArgs>(
          orElse: () => const HtmlEditorRouteArgs());
      return _i27.DeferredWidget(
        _i10.loadLibrary,
        () => _i10.HtmlEditorPage(
          content: args.content,
          key: args.key,
        ),
      );
    },
  );
}

class HtmlEditorRouteArgs {
  const HtmlEditorRouteArgs({
    this.content,
    this.key,
  });

  final Map<String, dynamic>? content;

  final _i28.Key? key;

  @override
  String toString() {
    return 'HtmlEditorRouteArgs{content: $content, key: $key}';
  }
}

/// generated route for
/// [_i11.InfoPage]
class InfoRoute extends _i27.PageRouteInfo<InfoRouteArgs> {
  InfoRoute({
    int? id,
    _i29.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          InfoRoute.name,
          args: InfoRouteArgs(
            id: id,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'InfoRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<InfoRouteArgs>(
          orElse: () => InfoRouteArgs(id: pathParams.optInt('id')));
      return _i27.DeferredWidget(
        _i11.loadLibrary,
        () => _i11.InfoPage(
          id: args.id,
          key: args.key,
        ),
      );
    },
  );
}

class InfoRouteArgs {
  const InfoRouteArgs({
    this.id,
    this.key,
  });

  final int? id;

  final _i29.Key? key;

  @override
  String toString() {
    return 'InfoRouteArgs{id: $id, key: $key}';
  }
}

/// generated route for
/// [_i12.InstallPage]
class InstallRoute extends _i27.PageRouteInfo<void> {
  const InstallRoute({List<_i27.PageRouteInfo>? children})
      : super(
          InstallRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstallRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i12.loadLibrary,
        () => _i12.InstallPage(),
      );
    },
  );
}

/// generated route for
/// [_i13.LoginPage]
class LoginRoute extends _i27.PageRouteInfo<void> {
  const LoginRoute({List<_i27.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i13.loadLibrary,
        () => _i13.LoginPage(),
      );
    },
  );
}

/// generated route for
/// [_i14.MapPage]
class MapRoute extends _i27.PageRouteInfo<MapRouteArgs> {
  MapRoute({
    int? id,
    _i30.PlaceModel? place,
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          MapRoute.name,
          args: MapRouteArgs(
            id: id,
            place: place,
            key: key,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MapRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<MapRouteArgs>(
          orElse: () => MapRouteArgs(id: pathParams.optInt('id')));
      return _i27.DeferredWidget(
        _i14.loadLibrary,
        () => _i14.MapPage(
          id: args.id,
          place: args.place,
          key: args.key,
        ),
      );
    },
  );
}

class MapRouteArgs {
  const MapRouteArgs({
    this.id,
    this.place,
    this.key,
  });

  final int? id;

  final _i30.PlaceModel? place;

  final _i28.Key? key;

  @override
  String toString() {
    return 'MapRouteArgs{id: $id, place: $place, key: $key}';
  }
}

/// generated route for
/// [_i15.MySchedulePage]
class MyScheduleRoute extends _i27.PageRouteInfo<void> {
  const MyScheduleRoute({List<_i27.PageRouteInfo>? children})
      : super(
          MyScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyScheduleRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i15.loadLibrary,
        () => _i15.MySchedulePage(),
      );
    },
  );
}

/// generated route for
/// [_i16.NewsFormPage]
class NewsFormRoute extends _i27.PageRouteInfo<void> {
  const NewsFormRoute({List<_i27.PageRouteInfo>? children})
      : super(
          NewsFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsFormRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i16.loadLibrary,
        () => _i16.NewsFormPage(),
      );
    },
  );
}

/// generated route for
/// [_i17.NewsPage]
class NewsRoute extends _i27.PageRouteInfo<NewsRouteArgs> {
  NewsRoute({
    _i28.Key? key,
    _i28.VoidCallback? onSetAsRead,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          NewsRoute.name,
          args: NewsRouteArgs(
            key: key,
            onSetAsRead: onSetAsRead,
          ),
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<NewsRouteArgs>(orElse: () => const NewsRouteArgs());
      return _i27.DeferredWidget(
        _i17.loadLibrary,
        () => _i17.NewsPage(
          key: args.key,
          onSetAsRead: args.onSetAsRead,
        ),
      );
    },
  );
}

class NewsRouteArgs {
  const NewsRouteArgs({
    this.key,
    this.onSetAsRead,
  });

  final _i28.Key? key;

  final _i28.VoidCallback? onSetAsRead;

  @override
  String toString() {
    return 'NewsRouteArgs{key: $key, onSetAsRead: $onSetAsRead}';
  }
}

/// generated route for
/// [_i18.OccasionHomePage]
class OccasionHomeRoute extends _i27.PageRouteInfo<void> {
  const OccasionHomeRoute({List<_i27.PageRouteInfo>? children})
      : super(
          OccasionHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OccasionHomeRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i18.loadLibrary,
        () => _i18.OccasionHomePage(),
      );
    },
  );
}

/// generated route for
/// [_i19.ResetPasswordPage]
class ResetPasswordRoute extends _i27.PageRouteInfo<void> {
  const ResetPasswordRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ResetPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i19.loadLibrary,
        () => _i19.ResetPasswordPage(),
      );
    },
  );
}

/// generated route for
/// [_i20.ScheduleNavigationPage]
class ScheduleNavigationRoute extends _i27.PageRouteInfo<void> {
  const ScheduleNavigationRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ScheduleNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleNavigationRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i20.loadLibrary,
        () => _i20.ScheduleNavigationPage(),
      );
    },
  );
}

/// generated route for
/// [_i21.SchedulePage]
class ScheduleRoute extends _i27.PageRouteInfo<void> {
  const ScheduleRoute({List<_i27.PageRouteInfo>? children})
      : super(
          ScheduleRoute.name,
          initialChildren: children,
        );

  static const String name = 'ScheduleRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i21.loadLibrary,
        () => _i21.SchedulePage(),
      );
    },
  );
}

/// generated route for
/// [_i22.SettingsPage]
class SettingsRoute extends _i27.PageRouteInfo<void> {
  const SettingsRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i22.loadLibrary,
        () => _i22.SettingsPage(),
      );
    },
  );
}

/// generated route for
/// [_i23.SignupPage]
class SignupRoute extends _i27.PageRouteInfo<void> {
  const SignupRoute({List<_i27.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i23.loadLibrary,
        () => _i23.SignupPage(),
      );
    },
  );
}

/// generated route for
/// [_i24.SongbookPage]
class SongbookRoute extends _i27.PageRouteInfo<SongbookRouteArgs> {
  SongbookRoute({
    _i28.Key? key,
    List<_i27.PageRouteInfo>? children,
  }) : super(
          SongbookRoute.name,
          args: SongbookRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SongbookRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SongbookRouteArgs>(
          orElse: () => const SongbookRouteArgs());
      return _i27.DeferredWidget(
        _i24.loadLibrary,
        () => _i24.SongbookPage(key: args.key),
      );
    },
  );
}

class SongbookRouteArgs {
  const SongbookRouteArgs({this.key});

  final _i28.Key? key;

  @override
  String toString() {
    return 'SongbookRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i25.TimetablePage]
class TimetableRoute extends _i27.PageRouteInfo<void> {
  const TimetableRoute({List<_i27.PageRouteInfo>? children})
      : super(
          TimetableRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimetableRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i25.loadLibrary,
        () => _i25.TimetablePage(),
      );
    },
  );
}

/// generated route for
/// [_i26.UserPage]
class UserRoute extends _i27.PageRouteInfo<void> {
  const UserRoute({List<_i27.PageRouteInfo>? children})
      : super(
          UserRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserRoute';

  static _i27.PageInfo page = _i27.PageInfo(
    name,
    builder: (data) {
      return _i27.DeferredWidget(
        _i26.loadLibrary,
        () => _i26.UserPage(),
      );
    },
  );
}
