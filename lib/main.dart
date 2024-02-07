import 'dart:async';
import 'dart:developer';

import 'package:fe_lab_clinicas_core/lab_clinicas_core_config.dart';
import 'package:fe_lab_clinicas_self_service/src/binding/lab_clinicas_application_binding.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/auth_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/home/module/home_module.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_module.dart';
import 'package:fe_lab_clinicas_self_service/src/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() {
    runApp(const LabClinicasSelfService());
  }, (error, stack) { 

    log('Erro não tratado',error:error,stackTrace:stack);
    throw error;
  });

  
}

class LabClinicasSelfService extends StatelessWidget {
  const LabClinicasSelfService({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(title: 'Lab Clinicas Auto Atendimento',
    binding: LabClinicasApplicationBinding(),
    pagesBuilders: [
      FlutterGetItPageBuilder(page: (_) => const SplashPages(),path:'/',)
    ],modules: [AuthModule(), HomeModule(), SelfServiceModule()],);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
     
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
