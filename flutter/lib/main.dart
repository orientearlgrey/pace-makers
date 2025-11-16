import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff194b22)),
        fontFamily: 'Inter',
      ),
      home: const PreOpChecklist(),
    );
  }
}

class PreOpChecklist extends StatelessWidget {
  const PreOpChecklist({super.key});

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
                        "images/HEIDI_SYMBOL_CMYK_BARK.png",
                        height: 36.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.asset(
                          "images/pexels-olly-3831569.jpg",
                        ).image,
                        radius: 40.0,
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Scottie Stacy",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32.0,
                            ),
                          ),
                          Text(
                            "June-14-1951",
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
                            "Hospital ID: 48379954",
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
                            "NHS ID: 28723478",
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
                            "Procedure Details",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "Procedure: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              // TO-DO: Create a link
                              Text("Closure of "),
                              InkWell(
                                child: Text(
                                  "atrial septal defect",
                                  style: TextStyle(color: Colors.blue),
                                ),
                                onTap: () => launchUrlString(
                                  "https://www.google.com/search?q=atrial+septal+defect",
                                ),
                              ),
                              Icon(Icons.search),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Surgery date: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("09:00 November-23-2025"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Consultant: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Mr/Dr Alex"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Contact details: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Nursing Team: 02076589876"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Description of the procedure: ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Keyhole procedure to close the hole in the heart (atrial septal defect).",
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
                          Row(
                            children: [
                              Checkbox.adaptive(value: true, onChanged: null),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Stop Apixaban 48 hours before"),
                                  Text("Last dose: November 21-2025"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(value: false, onChanged: null),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nil by mouth."),
                                  Text("From 00:00 November-23-2025"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(value: false, onChanged: null),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Use skin preparation solution."),
                                  Text("At 06:00 November-23-2025"),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox.adaptive(value: false, onChanged: null),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Arrival at the hospital."),
                                  Text("At 07:00 November-23-2025"),
                                ],
                              ),
                            ],
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
        onPressed: null,
        icon: ImageIcon(Image.asset("images/claude.png").image),
        label: Text("Ask AI"),
      ),
    );
  }
}
