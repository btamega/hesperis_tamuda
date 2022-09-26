import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/core/res/color.dart';

class TaskWidget extends StatelessWidget {

  const TaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
                child: Text(
                  "PM",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: AppColors.getDarkLinearGradient(
                      Colors.blue,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.2),
                        blurRadius: 8,
                        spreadRadius: 1,
                        offset: const Offset(2, 6),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "taskModel.taskName",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      " PM -",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Divider(),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
