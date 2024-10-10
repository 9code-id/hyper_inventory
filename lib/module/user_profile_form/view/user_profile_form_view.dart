import 'package:flutter/material.dart';
import 'package:hyper_supabase/core.dart';

class UserProfileFormView extends StatefulWidget {
  final UserProfile? item;
  const UserProfileFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, UserProfileFormController controller) {
    controller.view = this;
    if (controller.loading) return LoadingScaffold();
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile Form"),
        actions: const [],
      ),
      body: SupaFormColumn(
        key: Key("user_profile_form"),
        isEditMode: controller.isEditMode,
        formKey: controller.formKey,
        children: [
          //::FORM
          QImagePicker(
            label: "Image Url",
            validator: Validator.required,
            extensions: ['png', 'jpg'],
            value: controller.imageUrl,
            onChanged: (value) {
              controller.imageUrl = value;
            },
          ),
          QTextField(
            label: "User Profile Name",
            validator: Validator.required,
            value: controller.userProfileName,
            onChanged: (value) {
              controller.userProfileName = value;
            },
          ),
          QDropdownField(
            label: "Gender",
            validator: Validator.required,
            items: [
              {"label": "Male", "value": "Male"},
              {"label": "Female", "value": "Female"}
            ],
            value: controller.gender,
            onChanged: (value, label) {
              controller.gender = value;
            },
          ),
          QTextField(
            label: "Email",
            validator: Validator.email,
            value: controller.email,
            onChanged: (value) {
              controller.email = value;
            },
          ),
          QTextField(
            label: "Password",
            validator: Validator.required,
            value: controller.password,
            obscure: true,
            enabled: controller.isEditMode ? false : true,
            onChanged: (value) {
              controller.password = value;
            },
          ),
          QDropdownField(
            label: "Role",
            validator: Validator.required,
            items: [
              {"label": "Admin", "value": "Admin"},
              {"label": "User", "value": "User"}
            ],
            value: controller.role,
            onChanged: (value, label) {
              controller.role = value;
            },
          ),
          QDropdownField(
            label: "Is Active",
            validator: Validator.required,
            items: [
              {
                "label": "Yes",
                "value": true,
              },
              {
                "label": "No",
                "value": false,
              }
            ],
            value: controller.isActive,
            onChanged: (value, label) {
              controller.isActive = value;
            },
          ),
          if (controller.isEditMode)
            QLink(
              label: "Reset password",
              onTap: () async {
                try {
                  await AuthService().resetPassword(
                    email: controller.email!,
                  );
                  ss("Password reset email sent to ${controller.email}");
                } on Exception catch (err) {
                  se(err);
                }
              },
            ),
        ],
      ),
      bottomNavigationBar: QActionButton(
        label: "Save",
        onPressed: () => controller.save(),
      ),
    );
  }

  @override
  State<UserProfileFormView> createState() => UserProfileFormController();
}
