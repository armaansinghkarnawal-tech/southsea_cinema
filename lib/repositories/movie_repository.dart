import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: '1',
        title: "Harry Potter and the Sorcerer's Stone",
        synopsis:
            'Harry discovers he is a wizard and begins his adventures at Hogwarts.',
        ageRating: 'PG',
        screeningTime: '14:00',
        ticketPrice: 8.50,
        posterImagePath: 'assets/images/8088310.jpg',
      ),
      Movie(
        id: '2',
        title: 'IT',
        synopsis:
            'A group of friends confront a terrifying clown haunting their town.',
        ageRating: '15',
        screeningTime: '20:00',
        ticketPrice: 10.00,
        posterImagePath: 'assets/images/37961.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
