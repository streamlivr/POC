import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:streamlivr/src/models/channel_model.dart';
import 'package:streamlivr/src/routes/router.dart';
import 'package:streamlivr/src/services/user_service.dart';
import 'package:streamlivr/src/widgets/app_message.dart';

import '../../theme/style.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_textfield.dart';
import '../../widgets/build_text.dart';
import '../../widgets/processing_dialogue.dart';
import '../../widgets/vertical_space.dart';

class CreateChannel extends StatefulWidget {
  const CreateChannel({Key? key}) : super(key: key);

  @override
  State<CreateChannel> createState() => _CreateChannelState();
}

class _CreateChannelState extends State<CreateChannel> {
  var imageUrl = "";
  final myKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Channel'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: myKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  ImagePicker()
                      .pickImage(source: ImageSource.gallery)
                      .then((value) {
                    if (value == null) return;
                    setState(() {
                      imageUrl = value.path;
                    });
                  });
                },
                child: Builder(
                  builder: (context) {
                    if (imageUrl == "") {
                      return const SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 60,
                          ),
                        ),
                      );
                    } else {
                      return Image.file(
                        File(imageUrl),
                        height: 100,
                        width: double.infinity,
                      );
                    }
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    data: 'Channel Title',
                    fontSize: 14,
                    color: Theme.of(context)
                        .appBarTheme
                        .iconTheme!
                        .color!
                        .withOpacity(0.5),
                  ),
                  const Verticalspace(space: 8),
                  AppTextField(
                    hint: "Channel Title",
                    prefix: const Icon(
                      Icons.person_outline,
                      color: Styles.grey,
                    ),
                    controller: titleController,
                  ),
                ],
              ),
              const Verticalspace(space: 26),
              AppButton(
                text: 'Create',
                textColor: Styles.white,
                onPressed: () {
                  if (titleController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("title field cannot be empty")));
                    return;
                  }
                  if (imageUrl.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("seleted An Image")));
                    return;
                  }
                  ProcessingDialog.showProcessingDialog(context: context);
                  UserService.createChannel(
                    userData: ChannelModel(
                      title: titleController.text,
                      image: imageUrl,
                    ),
                  ).then((value) {
                    pop(context: context);
                    if (value.status == "success") {
                      AppMessage.showMessage(
                          context: context,
                          message: 'Channel Created',
                          type: AnimatedSnackBarType.success);
                      pop(context: context);
                    } else {
                      AppMessage.showMessage(
                          context: context,
                          message: 'Channel Created',
                          type: AnimatedSnackBarType.success);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
