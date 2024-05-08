import 'package:flutter/material.dart';
import 'package:fitness_app/provider/base_view.dart';
import 'package:fitness_app/src/view/details_screen_view_model.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = '/details-screen';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsScreenViewModel>(
      onModelReady: (model) => {},
      builder: (context, model, child) {
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Body(
            model: model,
          ),
        );
      },
    );
  }
}
