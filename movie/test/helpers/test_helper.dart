import 'package:http/io_client.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/movie.dart';
import 'package:watchlist/watchlist.dart';

@GenerateMocks([
  MovieRepository,
  MovieRemoteDataSource,
  MovieLocalDataSource,
  DatabaseHelper,
], customMocks: [
  MockSpec<IOClient>(as: #MockIOClient)
])
void main() {}
