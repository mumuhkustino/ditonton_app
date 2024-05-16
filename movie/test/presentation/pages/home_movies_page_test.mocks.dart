// Mocks generated by Mockito 5.4.4 from annotations
// in movie/test/presentation/pages/home_movies_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:flutter_bloc/flutter_bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie/movie.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeGetNowPlayingMovies_0 extends _i1.SmartFake
    implements _i2.GetNowPlayingMovies {
  _FakeGetNowPlayingMovies_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNowPlayingMoviesState_1 extends _i1.SmartFake
    implements _i2.NowPlayingMoviesState {
  _FakeNowPlayingMoviesState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetPopularMovies_2 extends _i1.SmartFake
    implements _i2.GetPopularMovies {
  _FakeGetPopularMovies_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakePopularMoviesState_3 extends _i1.SmartFake
    implements _i2.PopularMoviesState {
  _FakePopularMoviesState_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetTopRatedMovies_4 extends _i1.SmartFake
    implements _i2.GetTopRatedMovies {
  _FakeGetTopRatedMovies_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTopRatedMoviesState_5 extends _i1.SmartFake
    implements _i2.TopRatedMoviesState {
  _FakeTopRatedMoviesState_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [NowPlayingMoviesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockNowPlayingMoviesCubit extends _i1.Mock
    implements _i2.NowPlayingMoviesCubit {
  MockNowPlayingMoviesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetNowPlayingMovies get getNowPlayingMovies => (super.noSuchMethod(
        Invocation.getter(#getNowPlayingMovies),
        returnValue: _FakeGetNowPlayingMovies_0(
          this,
          Invocation.getter(#getNowPlayingMovies),
        ),
      ) as _i2.GetNowPlayingMovies);

  @override
  _i2.NowPlayingMoviesState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeNowPlayingMoviesState_1(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.NowPlayingMoviesState);

  @override
  _i3.Stream<_i2.NowPlayingMoviesState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.NowPlayingMoviesState>.empty(),
      ) as _i3.Stream<_i2.NowPlayingMoviesState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchNowPlayingMovies() => super.noSuchMethod(
        Invocation.method(
          #fetchNowPlayingMovies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.NowPlayingMoviesState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i4.Change<_i2.NowPlayingMoviesState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [PopularMoviesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockPopularMoviesCubit extends _i1.Mock
    implements _i2.PopularMoviesCubit {
  MockPopularMoviesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetPopularMovies get getPopularMovies => (super.noSuchMethod(
        Invocation.getter(#getPopularMovies),
        returnValue: _FakeGetPopularMovies_2(
          this,
          Invocation.getter(#getPopularMovies),
        ),
      ) as _i2.GetPopularMovies);

  @override
  _i2.PopularMoviesState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakePopularMoviesState_3(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.PopularMoviesState);

  @override
  _i3.Stream<_i2.PopularMoviesState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.PopularMoviesState>.empty(),
      ) as _i3.Stream<_i2.PopularMoviesState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchPopularMovies() => super.noSuchMethod(
        Invocation.method(
          #fetchPopularMovies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.PopularMoviesState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i4.Change<_i2.PopularMoviesState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [TopRatedMoviesCubit].
///
/// See the documentation for Mockito's code generation for more information.
class MockTopRatedMoviesCubit extends _i1.Mock
    implements _i2.TopRatedMoviesCubit {
  MockTopRatedMoviesCubit() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTopRatedMovies get getTopRatedMovies => (super.noSuchMethod(
        Invocation.getter(#getTopRatedMovies),
        returnValue: _FakeGetTopRatedMovies_4(
          this,
          Invocation.getter(#getTopRatedMovies),
        ),
      ) as _i2.GetTopRatedMovies);

  @override
  _i2.TopRatedMoviesState get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeTopRatedMoviesState_5(
          this,
          Invocation.getter(#state),
        ),
      ) as _i2.TopRatedMoviesState);

  @override
  _i3.Stream<_i2.TopRatedMoviesState> get stream => (super.noSuchMethod(
        Invocation.getter(#stream),
        returnValue: _i3.Stream<_i2.TopRatedMoviesState>.empty(),
      ) as _i3.Stream<_i2.TopRatedMoviesState>);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  void fetchTopRatedMovies() => super.noSuchMethod(
        Invocation.method(
          #fetchTopRatedMovies,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void emit(_i2.TopRatedMoviesState? state) => super.noSuchMethod(
        Invocation.method(
          #emit,
          [state],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onChange(_i4.Change<_i2.TopRatedMoviesState>? change) =>
      super.noSuchMethod(
        Invocation.method(
          #onChange,
          [change],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addError(
    Object? error, [
    StackTrace? stackTrace,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onError(
    Object? error,
    StackTrace? stackTrace,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #onError,
          [
            error,
            stackTrace,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
