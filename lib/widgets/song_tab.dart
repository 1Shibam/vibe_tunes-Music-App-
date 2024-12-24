import 'package:flutter/material.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.music_note),
          title: Text("AUD-20241125-WA0007"),
          subtitle: Text("Unknown - WhatsApp Audio"),
          trailing: Icon(Icons.more_vert),
        ),
      ],
    );
  }
}