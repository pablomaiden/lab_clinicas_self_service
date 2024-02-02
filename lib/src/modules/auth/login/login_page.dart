import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final formkey    = GlobalKey<FormState>();
final emailEC    = TextEditingController();
final passwordEC = TextEditingController();
final controller = Injector.get<LoginController>();

@override
void dispose(){
  emailEC.dispose();
  passwordEC.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(title: const Text('jkhkjh')),
        body: SingleChildScrollView(
            child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover)),
           child: Center(child: 
           
           Container(
            padding: const EdgeInsets.all(40),            
            constraints: BoxConstraints(maxWidth: sizeOf.width * .8),
            decoration:  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),child: 
            
            Form(
              key: formkey,
              child: Column(children:[
                
                const Text('Login', style: LabClinicasTheme.titleStyle,), 
              
                const SizedBox(height: 32,),
              
              Watch((_){
             
                return TextFormField(
                  controller: emailEC,
                  validator: Validatorless.multiple([Validatorless.required('Email obrigatório'),Validatorless.email('Email inválido')]),
                  decoration: const InputDecoration(label: Text('Email')));
                  
                  })
                  ,
              
                const SizedBox(height: 24,), 

                Watch((_){
              
                return TextFormField(
                  obscureText: controller.obscurePassword,
                  controller: passwordEC,
                  validator: Validatorless.required('Senha obrigatório'),                  
                  decoration: InputDecoration(
                    label: Text('Password'), 
                    suffixIcon: IconButton(onPressed: () {

                          controller.passwordToggle();

                    }, icon:Icon(Icons.visibility)) ));}),
              
                const SizedBox(height: 32,),
              
                SizedBox(width:sizeOf.width * .8, height: 20, child: ElevatedButton(onPressed: (){

                  final valid = formkey.currentState?.validate() ?? false;

                  if(valid){

                  }


                }, child: const Text('ENTRAR')))
              
              ],),
            )),)),
          ),
        );
  }
}
