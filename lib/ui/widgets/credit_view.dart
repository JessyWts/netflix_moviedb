import 'package:flutter/material.dart';
import 'package:netfix_moviedb/models/models.dart';
import 'package:netfix_moviedb/ui/widgets/widgets.dart';

class CreditView extends StatelessWidget {
  const CreditView({
    super.key,
    required this.sectionText,
    required this.persons,
  });

  final String sectionText;
  final List<PersonModel>? persons;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusableText(
          text: sectionText,
          color: Colors.white,
          fontSize: 16, 
          fontWeight: FontWeight.bold
        ),
        const SizedBox(height: 10.0,),
        SizedBox(
          height: 360,
          child: persons != null
            ? ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: persons?.length,
              itemBuilder: (context, index) {
                return persons?[index].profilePath == null
                  ? const Center()
                  : CastingCard(person: persons?[index]);
              },
            )
            : Center(
              child: Text('No $sectionText found') ,
            )
        ),
      ],
    );
  }
}