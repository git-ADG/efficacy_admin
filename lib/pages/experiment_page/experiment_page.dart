import 'package:efficacy_admin/config/config.dart';
import 'package:efficacy_admin/controllers/services/club/club_controller.dart';
import 'package:efficacy_admin/controllers/services/services.dart';
import 'package:efficacy_admin/models/invitation/invitaion_model.dart';
import 'package:efficacy_admin/models/models.dart';
import 'package:efficacy_admin/utils/local_database/constants.dart';
import 'package:efficacy_admin/utils/local_database/local_database.dart';
import 'package:flutter/material.dart';
import 'package:efficacy_admin/widgets/snack_bar/error_snack_bar.dart';
import 'package:provider/provider.dart';

class ExperimentPage extends StatefulWidget {
  static const String routeName = "/experimentPage";
  const ExperimentPage({super.key});

  @override
  State<ExperimentPage> createState() => _ExperimentPageState();
}

class _ExperimentPageState extends State<ExperimentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // print(
                //   await ClubController.update(
                //     const ClubModel(
                //       id: "653d0552e696c108109aeb0a",
                //       name: "name4",
                //       instituteName: "instituteName",
                //       description: "description",
                //       email: "email",
                //       clubLogoURL: "clubLogoURL",
                //       members: {},
                //     ),
                //   ),
                // );
              },
              child: const Text("Task 1"),
            ),
            ElevatedButton(
              onPressed: () async {},
              child: const Text("Log Out"),
            ),
          ].separate(10),
        ),
      ),
    );
  }
}
