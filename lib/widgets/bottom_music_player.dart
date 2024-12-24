import 'package:flutter/material.dart';

class BottomMusicPlayer extends StatelessWidget {
  const BottomMusicPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.music_note, size: 40),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AUD-20241125-WA0007",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text("Unknown"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.pause, size: 30),
              SizedBox(width: 15),
              Icon(Icons.skip_next, size: 30),
            ],
          ),
        ],
      ),
    );
  }
}
