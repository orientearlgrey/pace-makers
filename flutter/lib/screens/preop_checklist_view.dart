import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../components/preop_checklist_item.dart';
import '../components/chat_widget.dart';

class PreOpChecklistView extends StatelessWidget {
  const PreOpChecklistView({super.key, required this.info});

  final Map info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Color(0xfff4e7dd),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'images/HEIDI_SYMBOL_CMYK_BARK.png',
                        height: 36.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.asset(
                          info['patient'].containsKey('user_image')
                              ? info['patient']['user_image']
                              : null,
                        ).image,
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            info['patient']['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          Text(
                            info['patient']['dob'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xfffbf582),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hospital ID: ${info['patient']['hospital_id']}',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xfffbf582),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'NHS ID: ${info['patient']['nhs_id']}',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color(0xfffcfaf8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Procedure Details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                'Procedure: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // TO-DO: Assume feature in-place to parse search
                              // keywords from procedure
                              Text('Closure of '),
                              InkWell(
                                child: Text(
                                  'atrial septal defect',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () => launchUrlString(
                                  'https://www.google.com/search?q=atrial+septal+defect',
                                ),
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Surgery date: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${info['procedure']['date']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Consultant: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${info['procedure']['consultant']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Contact details: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${info['procedure']['contact']}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Description of the procedure: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${info['procedure']['description']}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Color(0xfffcfaf8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Patient's preparation checklist",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: info['checklist'].length,
                            itemBuilder: (context, index) => PreOpChecklistItem(
                              completed: info['checklist'][index]['completed'],
                              description:
                                  info['checklist'][index]['description'],
                              schedule: info['checklist'][index]['schedule'],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                margin: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: ChatWidget(info: info),
                ),
              ),
            ),
          );
        },
        icon: ImageIcon(Image.asset('images/claude.png').image),
        label: Text('Ask AI'),
      ),
    );
  }
}
