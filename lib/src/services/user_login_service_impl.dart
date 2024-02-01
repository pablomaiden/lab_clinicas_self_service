import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:fe_lab_clinicas_self_service/src/repositories/user/user_repository.dart';
import 'package:fe_lab_clinicas_self_service/src/services/user_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  UserLoginServiceImpl({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<Either<ServcieException, Unit>> execute(
      String email, String password) async {

    final loginResult = await userRepository.login(email, password);
   
    switch (loginResult) {
      case Left(value: AuthError()):
        return Left(ServcieException(message: 'Erro ao realizar login'));

      case Left(value: AuthUnauthorizedExcpetion()):
        return Left(ServcieException(message: 'Login ou senha inválidos'));

      case Right(value: final accessToken):
        final sp = await SharedPreferences.getInstance();
        sp.setString(LocalConstantsStorage.accesToken, accessToken);
        return Right(Unit());
      case Left<AuthExceptions, String>():
        return Right(Unit());
    }
  }
}
