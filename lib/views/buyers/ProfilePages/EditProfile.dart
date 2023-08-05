import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temp_store/Widgets/FormVerification.dart';
import 'package:temp_store/constants/colors.dart';
import 'package:temp_store/controllers/UIcontrollers/EditProfileController.dart';
import 'package:temp_store/controllers/userController.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.put(EditProfileController());
    final ImagePicker imagePicker = ImagePicker();
    XFile? profilePicture;

    Future<void> _pickImage(ImageSource source) async {
      final pickedFile = await imagePicker.pickImage(source: source);
      controller.obj = pickedFile!.path;
    }

    final formKey = GlobalKey<FormState>();

    bool firstSubmit = false;
    final userController = Get.find<UserController>();
    String name = '',
        phone = '',
        email = userController.user!.email.toString(),
        address = '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.appBackgroundColor,
        elevation: 0.5,
        leadingWidth: 75,
        centerTitle: true,
        leading: TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel',
                maxLines: 1,
                style: TextStyle(color: Colors.redAccent, fontSize: 16))),
        title:
            const Text('Edit Profile', style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                userController.updateUserProfile(name.trim(), address.trim(),
                    controller.imagePath, phone.trim());
                Get.back();
              }
              firstSubmit = true;
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.indigo, fontSize: 17),
            ),
          ),
        ],
      ),
      backgroundColor: CustomColors.appBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          // Image and Bottom Sheet
          Center(
            child: Obx(
              () => CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                backgroundImage: Get.find<EditProfileController>().imagePath !=
                        ''
                    ? FileImage(
                            File(Get.find<EditProfileController>().imagePath))
                        as ImageProvider<Object>
                    : NetworkImage(
                        Get.find<UserController>().user!.image.toString()),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Get.bottomSheet(Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.45,
                        thickness: 4,
                        endIndent: MediaQuery.of(context).size.width * 0.45,
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.photo),
                        title: const Text('Choose from Library'),
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.gallery);
                        },
                      ),
                      ListTile(
                        leading: const Icon(CupertinoIcons.photo_camera),
                        title: const Text('Take Photo'),
                        onTap: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.camera);
                        },
                      ),
                      ListTile(
                        leading: const Icon(
                          CupertinoIcons.trash,
                          color: Colors.redAccent,
                        ),
                        title: const Text(
                          'Remove Current Picture',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        onTap: () {
                          // Navigator.pop(context);
                          // _pickImage(ImageSource.camera);
                        },
                      ),
                    ],
                  ),
                ));
              },
              child: const Text(
                'Edit Picture',
                style: TextStyle(
                    color: Colors.blueAccent, fontWeight: FontWeight.w700),
              )),
          const Divider(),

          // -- Form Fields
          Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 65,
                      child: Text('Name:'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: userController.user!.name,
                        onSaved: (newName) => name = newName!,
                        onChanged: (name) {
                          if (firstSubmit) formKey.currentState!.validate();
                        },
                        validator: (name) {
                          if (name!.isEmpty) {
                            return kNameNullError;
                          } else if (name.isNotEmpty &&
                              !nameValidationRegExp.hasMatch(name)) {
                            return kInvalidNameError;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Full Name'),
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 65,
                      child: Text('Phone:'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: userController.user!.phone,
                        onSaved: (newNumber) => phone = newNumber!,
                        onChanged: (number) {
                          if (firstSubmit) formKey.currentState!.validate();
                        },
                        validator: (number) {
                          if (number!.isEmpty) {
                            return kPhoneNullError;
                          } else if (number.isNotEmpty &&
                              !phoneValidationRegExp.hasMatch(number)) {
                            return kPhoneInvalidError;
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Enter Number'),
                      ),
                    )
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 65,
                      child: Text('Email:'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        userController.user!.email.toString(),
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ))
                  ],
                ),
                const Divider(),
                Row(
                  children: [
                    const SizedBox(
                      width: 65,
                      child: Text('Location:'),
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: TextFormField(
                        initialValue: userController.user!.address,
                        onSaved: (newAddress) => address = newAddress!,
                        onChanged: (address) {
                          if (firstSubmit) formKey.currentState!.validate();
                        },
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add Shop Location'),
                      ),
                    )
                  ],
                ),
                const Divider(),
                // -- Created Date and Delete Button
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        text: 'Joined: ',
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                              text: 'xyz',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
