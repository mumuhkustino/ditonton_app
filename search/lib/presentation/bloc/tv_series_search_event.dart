part of 'tv_series_search_bloc.dart';

abstract class TvSeriesSearchEvent extends Equatable {
  const TvSeriesSearchEvent();
}

class OnQueryTvSeriesChanged extends TvSeriesSearchEvent {
  final String query;

  const OnQueryTvSeriesChanged(this.query);

  @override
  List<Object> get props => [query];
}
