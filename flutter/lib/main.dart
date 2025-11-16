import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'screens/preop_checklist_view.dart';

// TO-DO: Implement middleware for calling server API
// This is a mock response from the server
Map mock = {
  'patient': {
    'name': 'Scottie Stacy',
    'dob': 'June-14-1951',
    'hospital_id': '48379954',
    'nhs_id': '28723478',
    'user_image': 'images/pexels-olly-3831569.jpg',
  },
  'procedure': {
    'name': 'Closure of atrial septal defect',
    'date': '09:00 November-23-2025',
    'consultant': 'Mr/Dr Alex',
    'contact': 'Nursing Team: 02076589876',
    'description':
        'Keyhole procedure to close the hole in the heart (atrial septal defect).',
  },
  'checklist': [
    {
      'completed': true,
      'description': 'Stop Apixaban 48 hours before op',
      'schedule': 'Last dose: November-21-2025',
    },
    {
      'completed': false,
      'description': 'Nil by mouth',
      'schedule': 'From: 00:00 November-23-2025',
    },
    {
      'completed': false,
      'description': 'Use skin preparation solution',
      'schedule': 'At 06:00 November-23-2025',
    },
    {
      'completed': false,
      'description': 'Arrival at the hospital',
      'schedule': 'At 07:00 November-23-2025',
    },
  ],
};

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
      title: 'PreOp Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff194b22)),
        fontFamily: 'Inter',
      ),
      home: PreOpChecklistView(info: mock),
    );
  }
}
