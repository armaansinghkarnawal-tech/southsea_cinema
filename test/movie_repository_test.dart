import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie firstMovie = movies[0];

      expect(firstMovie.id, '1');
      expect(firstMovie.title, "Harry Potter and the Sorcerer's Stone");
      expect(firstMovie.ticketPrice, 8.50);

      final Movie secondMovie = movies[1];

      expect(secondMovie.id, '2');
      expect(secondMovie.title, 'IT');
      expect(secondMovie.ticketPrice, 10.00);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie?.title, "Harry Potter and the Sorcerer's Stone");
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();

      final Movie? movie = repository.getMovieById('999');

      expect(movie, isNull);
    });
  });
}
