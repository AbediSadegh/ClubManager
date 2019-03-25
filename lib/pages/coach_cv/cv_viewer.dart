import 'package:club_manager/entity/cv_entity.dart';
import 'package:flutter/material.dart';
import 'package:club_manager/widgets/single_trainer_cv.dart';

class CVViewer extends StatelessWidget {
  final List<CVEntity> cvs;

  CVViewer({@required this.cvs});

  Widget build(BuildContext context) {
    assert(cvs != null);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return CV(
            imgURL: cvs[index].imgURL,
            description: cvs[index].description,
            license: cvs[index].license,
            name: cvs[index].name,
            education: cvs[index].education,
          );
        },
      ),
    );
  }
}
