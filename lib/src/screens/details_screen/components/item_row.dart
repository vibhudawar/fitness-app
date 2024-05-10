import 'package:flutter/material.dart';
import 'package:fitness_app/config/size_config.dart';
import 'package:fitness_app/src/models/weights_model.dart';
import 'package:intl/intl.dart';
import 'package:fitness_app/src/view/details_screen_view_model.dart';
import 'weight_operations.dart';

class ItemRow extends StatelessWidget {
  final WeightsModel weights;
  final String id;
  final DetailsScreenViewModel model;
  const ItemRow(
      {super.key,
      required this.weights,
      required this.id,
      required this.model});

  @override
  Widget build(BuildContext context) {
    int change = int.parse(weights.value) - 74;
    final bool goodWeight = model.checkWeight(int.parse(weights.value));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          height: getProportionateScreenHeight(100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              // Icon(
              //   goodWeight
              //       ? Icons.arrow_downward_outlined
              //       : Icons.arrow_upward_outlined,
              //   size: 20,
              //   color: goodWeight ? Colors.green : Colors.red,
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${weights.value} Kg",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    DateFormat.MMMEd().add_jm().format(
                        DateTime.fromMillisecondsSinceEpoch(weights.time)),
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              // Text(
              //   goodWeight ? change.toString() : '+$change',
              //   style: TextStyle(
              //       color: goodWeight ? Colors.green : Colors.red,
              //       fontWeight: FontWeight.bold,
              //       fontSize: getProportionateScreenWidth(15)),
              // ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      WeightOperations.editWeight(context, model, id);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 0,
                      backgroundColor: Colors.amber,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 20,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      WeightOperations.deleteWeight(context, model, id);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      shape: const CircleBorder(),
                      elevation: 0,
                      backgroundColor: Colors.red,
                    ),
                    child: const Icon(
                      Icons.delete_forever_rounded,
                      size: 22,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
