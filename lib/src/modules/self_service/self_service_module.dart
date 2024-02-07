
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/find_patient/find_patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/self_service_page.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/self_service/who_i_am/who_i_am_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class SelfServiceModule extends FlutterGetItModule{

  @override
  String get moduleRouteName => 'self-service';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/'             : (context) => const SelfServicePage(),
    '/whoIam'       : (context) => const WhoIAmPage(),
    '/find-patient' : (context) => const FindPatientPage(),
    '/patient'      : (context) => const PatientPage()
  };

}