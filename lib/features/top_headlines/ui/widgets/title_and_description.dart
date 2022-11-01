import 'package:flutter/material.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 10, bottom: 10),
        child: Column(
          children: [
            Text(title,
                maxLines: 1,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
                child: Text(
              description,
              maxLines: 4,
            ))
          ],
        ),
      ),
    );
  }
}
