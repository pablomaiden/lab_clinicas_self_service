
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

abstract interface class UserRepository{
Future<Either<AuthExceptions,String>> login (String email, String password);
}