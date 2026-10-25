import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        width: double.infinity,
        color: cinemaSurface,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Harry Potter and the Philosopher's Stone",
                style: cinemaHeaderStyle,
              ),
              const SizedBox(height: 12),
              const Text(
                'Runtime: 152 minutes | Age rating: PG',
                style: TextStyle(color: cinemaFontMuted),
              ),
              const SizedBox(height: 16),
              const Text(
                'Harry discovers he is a wizard and joins Hogwarts, '
                'where he makes new friends and uncovers a mystery.',
                style: TextStyle(color: cinemaFontWhite),
              ),
              const SizedBox(height: 24),
              DropdownMenu<int>(
                initialSelection: _ticketQuantity,
                label: const Text('Tickets'),
                textStyle: const TextStyle(color: cinemaFontWhite),
                onSelected: (int? value) {
                  if (value != null) {
                    setState(() {
                      _ticketQuantity = value;
                    });
                  }
                },
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 1, label: '1'),
                  DropdownMenuEntry(value: 2, label: '2'),
                  DropdownMenuEntry(value: 3, label: '3'),
                  DropdownMenuEntry(value: 4, label: '4'),
                  DropdownMenuEntry(value: 5, label: '5'),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Tickets selected: $_ticketQuantity',
                style: const TextStyle(color: cinemaFontWhite),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _bookingMessage =
                        'Added $_ticketQuantity tickets to the order';
                  });
                },
                child: const Text('Add to order'),
              ),
              const SizedBox(height: 16),
              Text(
                _bookingMessage,
                style: const TextStyle(color: cinemaFontWhite),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
