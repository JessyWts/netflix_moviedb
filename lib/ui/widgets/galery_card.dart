import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/image_model.dart';
import 'package:netfix_moviedb/ui/widgets/reusable_text.dart';

class GaleryCard extends StatelessWidget {
  const GaleryCard({
    super.key,
    required this.image,
  });

  final Backdrop? image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: CachedNetworkImage(
          imageUrl: image!.posterURL(),
          fit: BoxFit.cover,
          width: 350,
          errorWidget: (context, url, error) {
            return const Center(
              child: Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}