import 'package:efficacy_admin/config/config.dart';
import 'package:efficacy_admin/controllers/services/club/club_controller.dart';
import 'package:efficacy_admin/controllers/services/services.dart';
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
                // GoogleSignInAccount account =
                //     await Authenticator.googleSignIn();
                // await LocalDatabase.setUser(user);
                // await UserController.create(
                //   const UserModel(
                //     name: "User5",
                //     password: "123",
                //     email: "user5@mail.com",
                //     scholarID: "2112005",
                //     branch: Branch.CSE,
                //     degree: Degree.BTech,
                //   ),
                // );
                // await ClubController.create(
                //   const ClubModel(
                //     name: "GDSC",
                //     instituteName: "NIT Silchar",
                //     description: "GDSC",
                //     email: "raj@mail.co",
                //     clubLogoURL: "http://",
                //     members: {},
                //   ),
                // );
              },
              child: const Text("Login with Google"),
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
