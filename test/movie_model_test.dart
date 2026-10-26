import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    const movie = Movie(
      id: '1',
      title: 'Harry Potter',
      synopsis: 'Harry discovers he is a wizard.',
      ageRating: 'PG',
      screeningTime: '14:00',
      ticketPrice: 8.50,
      posterImagePath: 'assets/images/8088310.jpg',
    );

    test('constructor assigns all properties correctly', () {
      expect(movie.id, '1');
      expect(movie.title, 'Harry Potter');
      expect(movie.synopsis, 'Harry discovers he is a wizard.');
      expect(movie.ageRating, 'PG');
      expect(movie.screeningTime, '14:00');
      expect(movie.ticketPrice, 8.50);
      expect(movie.posterImagePath, 'assets/images/8088310.jpg');
    });

    test('formats a price with pence', () {
      expect(movie.formattedPrice, '£8.50');
    });

    test('formats a whole-pound price with two decimal places', () {
      const wholePoundMovie = Movie(
        id: '2',
        title: 'IT',
        synopsis: 'Friends confront a terrifying clown.',
        ageRating: '15',
        screeningTime: '20:00',
        ticketPrice: 10,
        posterImagePath: 'assets/images/37961.jpg',
      );

      expect(wholePoundMovie.formattedPrice, '£10.00');
    });
  });
}