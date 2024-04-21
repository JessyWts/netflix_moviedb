import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/person_model.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({
    super.key,
    required this.person,
  });

  final PersonModel? person;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        children: [
          ClipRRect(
             borderRadius: BorderRadius.circular(5.0),
            child: CachedNetworkImage(
              imageUrl: person!.posterURL(),
              fit: BoxFit.cover,
              width: 160,
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 10.0
            ),
            child: SizedBox(
              width: 150,
              child: person!.name != null
                ? ReusableText(
                    text: person!.name,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )
                : ReusableText(
                    text: person!.originalName,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: SizedBox(
              width: 150,
              child: person!.character != null
              ? ReusableText(
                text: person!.character!,
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal
              )
              : ReusableText(
                text: "${person!.department} - ${person!.job}",
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.normal
              )
            ),
          )
        ],
      ),
    );
  }
}