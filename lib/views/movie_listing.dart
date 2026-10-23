import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
          padding: EdgeInsets.all(40),
          color: cinemaFontMuted,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('harry poter'),
              Text("southsea cinema in portsmouth"),
              ElevatedButton(
                  onPressed: () {
                    print('add button pressed');
                  },
                  child: const Text('add'))
            ],
          )),
    );
  }
}
