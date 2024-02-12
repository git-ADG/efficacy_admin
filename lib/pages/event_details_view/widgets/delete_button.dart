import 'package:efficacy_admin/controllers/services/event/event_controller.dart';
import 'package:efficacy_admin/dialogs/loading_overlay/loading_overlay.dart';
import 'package:efficacy_admin/widgets/snack_bar/error_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class DeleteButton extends StatelessWidget {
  final EventModel event;
  final void Function(EventModel) onDeleteEvent;
  const DeleteButton(
      {super.key, required this.event, required this.onDeleteEvent});

  @override
  Widget build(BuildContext context) {
    double fontSize = 20;
    double pad = 18.0;
    return Padding(
      padding: EdgeInsets.all(pad),
      child: ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.red)),
        onPressed: () {
          showLoadingOverlay(
              context: context,
              asyncTask: () async {
                await EventController.delete(
                  eventID: event.id!,
                  clubID: event.clubID,
                );
                onDeleteEvent(event);
                showSnackBar(context, "Event deleted successfully!");
                Navigator.pop(context);
              });
        },
        child: Text(
          "Delete Event",
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}