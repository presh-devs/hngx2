import 'package:flutter/material.dart';
import 'package:hngx2/models/cv_data_model.dart';
import 'package:hngx2/pages/edit_page.dart';
import 'package:hngx2/shared/constants.dart';

class CVPage extends StatefulWidget {
  const CVPage({super.key, required this.title});

  final String title;

  @override
  State<CVPage> createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  CVData data = const CVData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: kAllPadding,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //kSmallSizedBox,
              Text(
                data.fullName!,
                style: kNameStyle,
              ),
              Text(
                data.stack!,
                // style: kNameStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Slack Username: '),
                  Text(data.slackUsername!),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Github Handle: '),
                  Text(data.githubHandle!),
                ],
              ),
              kDivider,
              buildSectionTitle('Bio'),
              SizedBox(
                height: 120,
                child: Text(
                  data.briefBio!,
                  overflow: TextOverflow.clip,
                  
                ),
              ),
              kDivider,
              buildSectionTitle('Professional Expereince'),
              // kSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.employmentDate!),
                  
                  Text(data.role!),
                ],
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                children: [
                  const SizedBox(
                    width: 75,
                  ),
                  Text(data.company!),
                ],
              ),
              kDivider,
              buildSectionTitle('Education'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data.educationDate!),
                  
                   Text(data.course!, overflow: TextOverflow.clip,),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 75,
                  ),
                  Text(data.school!),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[100],
        child: const Icon(Icons.edit),
        onPressed: () async {
          final result = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return EditPage(
              cvData: data,
            );
          }));

          setState(() {
            data = result;
          });
        },
      ),
    );
  }

  Align buildSectionTitle(String title) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: kSubHeadingStyle,
        ));
  }
}
