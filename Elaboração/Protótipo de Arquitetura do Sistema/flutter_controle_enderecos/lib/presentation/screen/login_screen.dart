import 'package:flutter/material.dart';
import 'package:flutter_controle_enderecos/controller/login_controller.dart';
import 'package:flutter_controle_enderecos/presentation/screen/register_screen.dart';
import 'package:flutter_controle_enderecos/presentation/widgets/widgets.dart';
import 'package:flutter_controle_enderecos/utils/utils.dart';
import 'package:flutter_controle_enderecos/view_model/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  //Armazena os valores digitos pelos usuários em cada campo
  late LoginViewModel viewModel = LoginViewModel();
  LoginController loginController = LoginController();

  //Armazena as mensagens de erro dos campos
  String? emailError, passwordError;

  //Auxilia na configuração do CircularProgressIndicator
  late AnimationController animationController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  //Define quando exibirá o CircularProgressIndicator
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailError = null;
    passwordError = null;
  }

  void resetFields() {
    setState(() {
      viewModel.reset();
    });
  }

  ///Limpa os campos do formulário
  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  ///Valida os campos do formulário de login
  bool validate() {
    resetErrorText();
    bool isValid = true;
    if (!viewModel.validLogin()) {
      setState(() {
        emailError = 'Por favor, entre com email.';
        isValid = false;
      });
    }

    if (!viewModel.validPassword()) {
      setState(() {
        passwordError = 'Por favor, entre com a senha.';
        isValid = false;
      });
    }

    return isValid;
  }

  String? senhaValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório.';
    }

    return null;
  }

  String? loginValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório.';
    }

    if (!isValidLogin(value)) {
      return 'Nome de usuário inválido!';
    }

    return null;
  }

  ///Valida todos os dados do formulário de login
  void submit(BuildContext context) async {
    // Providing a default value in case this was called on the
    // first frame, the [fromKey.currentState] will be null.
    final bool isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => isLoading = true);

    var result = await loginController.login(viewModel);

    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Aviso'),
              content: const Text("Teste"), //Text(result.message!),
              actions: [
                TextButton(
                  onPressed: Navigator.of(context).pop,
                  child: const Text('Ok'),
                ),
              ],
            );
          });
      isLoading = false;
      resetFields();
    });
  }

  @override
  Widget build(BuildContext context) {
    //Recupera a altura da UI na posição verticial (Não é a resolução)
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: builderFormulario(screenHeight, context),
    ));
  }

  /// Cria um listaview com os campos do formulário de login
  Widget builderFormulario(double screenHeight, BuildContext context) {
    if (!isLoading) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Form(
                      key: formKey,
                      child: createListView(screenHeight, context)))));
    } else {
      return const Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(child: CircularProgress()));
    }
  }

  //Cria os campos do formulário de login
  Widget createListView(double screenHeight, BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: screenHeight * .12),
          builderTextBemVindo(),
          SizedBox(height: screenHeight * .01),
          builderTextLogin(),
          SizedBox(height: screenHeight * .12),
          builderInputFieldUsuario(),
          SizedBox(height: screenHeight * .025),
          builderInputFieldSenha(),
          buildeTextButtonEsqueceuSenha(),
          SizedBox(
            height: screenHeight * .075,
          ),
          FormButton(
            text: 'Entrar',
            onPressed: () => submit(context),
          ),
          SizedBox(
            height: screenHeight * .15,
          ),
          builderTextButtonNovoUsuario(context)
        ]);
  }

  ///Cria um TextButton para adicionar um novo usuário. Um novo formulário é exibido
  TextButton builderTextButtonNovoUsuario(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        ),
      ),
      child: RichText(
        text: const TextSpan(
          text: "Eu sou um novo usuário, ",
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: 'Registrar',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Criar um TextButton para chamar a janela de recuperação de senha
  Align buildeTextButtonEsqueceuSenha() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Esqueceu a Senha!',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  ///Cria um campo para o usuário digitar a senha
  InputFormField builderInputFieldSenha() {
    return InputFormField(
      onChanged: (value) {
        setState(() {
          viewModel.password = value;
        });
      },
      validator: senhaValidator,
      labelText: 'Senha',
      errorText: passwordError,
      obscureText: true,
      textInputAction: TextInputAction.next,
    );
  }

  //Cria um campo para usuário digitar o nome do usuário ou email
  InputFormField builderInputFieldUsuario() {
    return InputFormField(
      onChanged: (value) {
        setState(() {
          viewModel.login = value;
        });
      },
      validator: loginValidator,
      labelText: 'Email ou Usuário',
      errorText: emailError,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autoFocus: true,
    );
  }

  ///Criar uma mensagem informativa
  Text builderTextLogin() {
    return Text(
      'Entre com Login e Senha para continuar!',
      style: TextStyle(
        fontSize: 18,
        color: Colors.black.withOpacity(.6),
      ),
    );
  }

  ///Criar uma mensagem de bem-vindo
  Text builderTextBemVindo() {
    return const Text(
      'Bem-vindo,',
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
