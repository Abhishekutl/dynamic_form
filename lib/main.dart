import 'package:dynami_form/src/helper/constants/appConstants.dart';
import 'package:dynami_form/src/views/formView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child:  FormApp()));
}

double height = 0.0;
double width = 0.0;

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: AppConstants.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const FormView(),
    );
  }
}


