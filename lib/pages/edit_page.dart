import 'package:flutter/material.dart';
import 'package:hngx2/models/cv_data_model.dart';
import 'package:hngx2/shared/app_button.dart';
import 'package:hngx2/shared/constants.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.cvData});
  final CVData cvData;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController stackController = TextEditingController();
  final TextEditingController slackUsernameController = TextEditingController();
  final TextEditingController githubHandleController = TextEditingController();
  final TextEditingController briefBioController = TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController comapnyController = TextEditingController();
  final TextEditingController employmentDateController =
      TextEditingController();
  final TextEditingController educationDateController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fullNameController.text = widget.cvData.fullName!;
    stackController.text = widget.cvData.stack!;
    slackUsernameController.text = widget.cvData.slackUsername!;
    githubHandleController.text = widget.cvData.githubHandle!;
    briefBioController.text = widget.cvData.briefBio!;
    roleController.text = widget.cvData.role!;
    comapnyController.text = widget.cvData.company!;
    employmentDateController.text = widget.cvData.employmentDate!;
    schoolController.text = widget.cvData.school!;
    courseController.text = widget.cvData.course!;
    educationDateController.text = widget.cvData.educationDate!;
  }

  void submit() {
    if (fullNameController.text.isEmpty ||
        slackUsernameController.text.isEmpty ||
        githubHandleController.text.isEmpty ||
        briefBioController.text.isEmpty ||
        roleController.text.isEmpty ||
        comapnyController.text.isEmpty ||
        employmentDateController.text.isEmpty ||
        schoolController.text.isEmpty ||
        courseController.text.isEmpty ||
        stackController.text.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Field can't be empty")));
    } else {
      CVData data = const CVData().copyWith(
        fullName: fullNameController.text,
        slackUsername: slackUsernameController.text,
        githubHandle: githubHandleController.text,
        briefBio: briefBioController.text,
        role: roleController.text,
        company: comapnyController.text,
        employmentDate: employmentDateController.text,
        school: schoolController.text,
        educationDate: educationDateController.text,
        course: courseController.text,
        stack: stackController.text,
      );
      Navigator.pop(context, data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit CV'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          submit();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: kAllPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Biodata',
                  style: kSubHeadingStyle,
                ),
                kSmallSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Full Name'),
                  controller: fullNameController,
                ),
                kSizedBox,
                TextField(
                  decoration: kTextfieldDecoration.copyWith(labelText: 'Stack'),
                  controller: stackController,
                ),
                kSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Slack Name'),
                  controller: slackUsernameController,
                ),
                kSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Github Handle'),
                  controller: githubHandleController,
                ),
                kSmallSizedBox,
                const Text(
                  'Brief Bio',
                  style: kSubHeadingStyle,
                ),
                kSmallSizedBox,
                TextField(
                  maxLines: 5,
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Brief Bio'),
                  controller: briefBioController,
                ),
                kSmallSizedBox,
                const Text(
                  'Professional experience',
                  style: kSubHeadingStyle,
                ),
                kSmallSizedBox,
                TextField(
                  decoration: kTextfieldDecoration.copyWith(labelText: 'Role'),
                  controller: roleController,
                ),
                kSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Company'),
                  controller: comapnyController,
                ),
                kSizedBox,
                TextField(
                  decoration: kTextfieldDecoration.copyWith(labelText: 'Date'),
                  controller: employmentDateController,
                ),
                kSmallSizedBox,
                const Text(
                  'Education',
                  style: kSubHeadingStyle,
                ),
                kSmallSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'Course'),
                  controller: courseController,
                ),
                kSizedBox,
                TextField(
                  decoration:
                      kTextfieldDecoration.copyWith(labelText: 'School'),
                  controller: schoolController,
                ),
                kSizedBox,
                TextField(
                  decoration: kTextfieldDecoration.copyWith(labelText: 'Date'),
                  controller: educationDateController,
                ),
                kSizedBox,
                Center(
                  child: AppButton(
                    title: "Save",
                    onPressed: () => submit(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
