import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/movie.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<PopularMoviesCubit>().fetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            if (state is PopularMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PopularMoviesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.popularMovie[index];
                  return MovieCard(movie);
                },
                itemCount: state.popularMovie.length,
              );
            } else if (state is PopularMoviesError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
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
