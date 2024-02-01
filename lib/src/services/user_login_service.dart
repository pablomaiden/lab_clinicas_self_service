

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class UserLoginService{


Future<Either<ServcieException,Unit>> execute (String email, String password);


}