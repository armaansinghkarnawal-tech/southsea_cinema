import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';

void main() {
  group('App widget tests', () {
    // Exercise 4 - Test the home page
    testWidgets('Home page displays movies and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      // Check the home page title
      expect(find.text(appTitle), findsOneWidget);

      // Check the first movie
      expect(
        find.text("Harry Potter and the Sorcerer's Stone"),
        findsOneWidget,
      );

      // Check booking button
      expect(find.text('Book tickets'), findsWidgets);

      // Scroll to the second movie
      await tester.scrollUntilVisible(
        find.text('IT'),
        200,
        scrollable: find.byType(Scrollable).first,
      );

      // Check the second movie
      expect(find.text('IT'), findsOneWidget);
    });

    // Exercise 6 - Test the full booking process
    testWidgets('User can book a movie and add tickets to order',
        (WidgetTester tester) async {
      // Open the application
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      // Find the first booking button
      await tester.ensureVisible(find.text('Book tickets').first);
      await tester.pumpAndSettle();

      // Click Book tickets
      await tester.tap(find.text('Book tickets').first);
      await tester.pumpAndSettle();

      // Check navigation to MovieListing
      expect(find.byType(MovieListing), findsOneWidget);

      // Check the correct movie
      expect(
        find.text("Harry Potter and the Sorcerer's Stone"),
        findsOneWidget,
      );

      // Check ticket price
      expect(
        find.text('Ticket price: £8.50'),
        findsOneWidget,
      );

      // Check ticket quantity
      expect(
        find.text('Tickets selected: 1'),
        findsOneWidget,
      );

      // Check total price
      expect(
        find.text('Total: £8.50'),
        findsOneWidget,
      );

      // Find Add to order button
      await tester.ensureVisible(find.text('Add to order'));
      await tester.pumpAndSettle();

      // Click Add to order
      await tester.tap(find.text('Add to order'));
      await tester.pump();

      // Check booking confirmation message
      expect(
        find.text(
          "Added 1 tickets for Harry Potter and the Sorcerer's Stone to the order",
        ),
        findsOneWidget,
      );
    });

    // Exercise 7 - Test navigation between different movies
    testWidgets('User can return home and book another movie',
        (WidgetTester tester) async {
      // Open Southsea Cinema
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      // Open Harry Potter
      await tester.ensureVisible(find.text('Book tickets').first);
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book tickets').first);
      await tester.pumpAndSettle();

      // Check Harry Potter listing is displayed
      expect(find.byType(MovieListing), findsOneWidget);

      expect(
        find.text("Harry Potter and the Sorcerer's Stone"),
        findsOneWidget,
      );

      // Add Harry Potter ticket to order
      await tester.ensureVisible(find.text('Add to order'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      // Check booking confirmation
      expect(
        find.text(
          "Added 1 tickets for Harry Potter and the Sorcerer's Stone to the order",
        ),
        findsOneWidget,
      );

      // Return to home page
      final navigator = tester.state<NavigatorState>(
        find.byType(Navigator),
      );

      navigator.pop();
      await tester.pumpAndSettle();

      // Check home page is displayed
      expect(find.byType(HomeView), findsOneWidget);

      expect(find.text(appTitle), findsOneWidget);

      // Scroll to the second movie
      await tester.scrollUntilVisible(
        find.text('IT'),
        200,
        scrollable: find.byType(Scrollable).first,
      );

      // Find the movie card for IT
      final itCard = find.ancestor(
        of: find.text('IT'),
        matching: find.byType(MovieCard),
      );

      // Find the booking button belonging to IT
      final itBookingButton = find.descendant(
        of: itCard,
        matching: find.text('Book tickets'),
      );

      await tester.ensureVisible(itBookingButton);
      await tester.pumpAndSettle();

      // Open IT movie listing
      await tester.tap(itBookingButton);
      await tester.pumpAndSettle();

      // Check second movie details
      expect(find.byType(MovieListing), findsOneWidget);

      expect(
        find.text('IT'),
        findsOneWidget,
      );

      expect(
        find.text('Ticket price: £10.00'),
        findsOneWidget,
      );

      // Check booking starts fresh
      expect(
        find.text('Tickets selected: 1'),
        findsOneWidget,
      );

      expect(
        find.text('Total: £10.00'),
        findsOneWidget,
      );

      // Check previous booking message is cleared
      expect(
        find.textContaining('Added '),
        findsNothing,
      );

      // Add IT ticket to order
      await tester.ensureVisible(find.text('Add to order'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      // Confirm IT booking
      expect(
        find.text('Added 1 tickets for IT to the order'),
        findsOneWidget,
      );
    });
  });
}
