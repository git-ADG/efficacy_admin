import 'dart:typed_data';
import 'package:efficacy_admin/config/config.dart';
import 'package:efficacy_admin/controllers/controllers.dart';
import 'package:efficacy_admin/models/club/club_model.dart';
import 'package:efficacy_admin/models/user/user_model.dart';
import 'package:efficacy_admin/pages/create_club/utils/create_club_utils.dart';
import 'package:efficacy_admin/pages/create_club/widgets/club_form.dart';
import 'package:efficacy_admin/pages/create_club/widgets/create_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CreateClub extends StatefulWidget {
  //route
  static const String routeName = '/CreateClubPage';

  const CreateClub({super.key});

  @override
  State<CreateClub> createState() => _CreateClubState();
}

class _CreateClubState extends State<CreateClub> {
  //form variables
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController longDescController = TextEditingController();
  TextEditingController githubUrlController = TextEditingController();
  TextEditingController fbUrlController = TextEditingController();
  TextEditingController instaController = TextEditingController();
  TextEditingController linkedinController = TextEditingController();
  TextEditingController emailController = TextEditingController();



  //form validate function
  void _validateForm() {
    // if (_formKey.currentState!.validate()) {
      //validation logic
    //   EventModel event = EventModel(
    //     posterURL: _image.toString(),
    //     title: nameController.text,
    //     shortDescription: shortDescController.text,
    //     longDescription:
    //     longDescController.text.isNotEmpty ? longDescController.text : null,
    //     startDate: DateTime.now(),
    //     endDate: DateTime.now(),
    //     registrationLink: githubUrlController.text,
    //     facebookPostURL:
    //     fbUrlController.text.isNotEmpty ? fbUrlController.text : null,
    //     venue: venueController.text,
    //     contacts: selectedModerator != null ? [selectedModerator!.email] : [],
    //     clubID: selectedClub!.id!,
    //   );
    //   EventController.create(event);
    // } else {
    //   showErrorSnackBar(
    //       context, "Upload failed. Please enter valid credentials");
    // }
  }

  //image variable
  Uint8List? _image;

  //function to get image from gallery
  Future<void> _getImage() async {
    Uint8List? temp = await ImageController.compressedImage(
      source: ImageSource.gallery,
      maxSize: 1024 * 1024,
      context: context,
    );
    setState(() {
      _image = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    getSize(context);

    return Stack(children: [
      Scaffold(
        floatingActionButton: CreateButton(onPressed: _validateForm),
        body: SafeArea(
          child: SlidingUpPanel(
            padding: const EdgeInsets.only(top: 30),
            maxHeight: height,
            minHeight: height * .70,
            borderRadius: BorderRadius.circular(30),
            header: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.33),
                Container(
                  height: 3,
                  width: width * 0.35,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            panelBuilder: (sc) => ClubForm(
              formKey: _formKey,
              scrollController: sc,
              nameController: nameController,
              DescController: longDescController,
              githubUrlController: githubUrlController,
              fbUrlController: fbUrlController,
              instaController: instaController,
              linkedinController: linkedinController,
              emailController: emailController,
            ),
            body: _image == null
                ? Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "assets/images/media.png",
                  width: width,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: width / 3),
                  child: SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child: ElevatedButton(
                      onPressed: () => _getImage(),
                      child: const Text("Pick Banner"),
                    ),
                  ),
                ),
              ],
            )
                : Align(
              alignment: Alignment.topCenter,
              child: GestureDetector(
                onTap: () => _getImage(),
                child: Image.memory(
                  _image!,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 15,
        top: 35,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: dark,
              child: Icon(
                Icons.close,
                size: height * 0.035,
                color: light,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}