import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv_series/presentation/cubit/on_the_air_tv_series_cubit.dart';
import 'package:tv_series/presentation/widgets/tv_series_card_list.dart';

class OnTheAirTvSeriesPage extends StatefulWidget {
  const OnTheAirTvSeriesPage({super.key});

  @override
  State<OnTheAirTvSeriesPage> createState() => _OnTheAirTvSeriesPageState();
}

class _OnTheAirTvSeriesPageState extends State<OnTheAirTvSeriesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<OnTheAirTvSeriesCubit>().fetchOnTheAirTvSeries());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('On The Air Tv Series'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<OnTheAirTvSeriesCubit, OnTheAirTvSeriesState>(
          builder: (context, state) {
            if (state is OnTheAirTvSeriesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnTheAirTvSeriesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final tvSeries = state.onTheAirTvSeries[index];
                  return TvSeriesCard(tvSeries);
                },
                itemCount: state.onTheAirTvSeries.length,
              );
            } else if (state is OnTheAirTvSeriesError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.error),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
