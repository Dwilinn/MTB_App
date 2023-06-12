import 'package:flutter/material.dart';
import 'package:mtb_app/view_model/LogSignIn_View_Model.dart';
import 'package:mtb_app/ressources/components/round_buttons.dart';
import 'package:mtb_app/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';
import '../../utils/utils.dart';

class EcranEnregistrement extends StatefulWidget {
  const EcranEnregistrement({Key? key}) : super(key: key);

  @override
  State<EcranEnregistrement> createState() => _EcranEnregistrementState();
}

class _EcranEnregistrementState extends State<EcranEnregistrement> {
  ValueNotifier obsecurePassword = ValueNotifier(true);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();

  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final authViewModel = Provider.of<LogSignInViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creer un compte"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: "Entrez votre email",
                prefixIcon: Icon(Icons.email),
              ),
              onFieldSubmitted: (value) {
                // FocusScope.of(context).requestFocus(passwordFocusNode);
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: passwordController,
                  obscureText: obsecurePassword.value,
                  obscuringCharacter: "*",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                    hintText: "Entrer votre mot de passe",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                        onTap: () {
                          obsecurePassword.value = !obsecurePassword.value;
                        },
                        child: obsecurePassword.value
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility_outlined)),
                  ),
                );
              },
            ),
            SizedBox(
              height: height * 0.1,
            ),
            RoundButton(
              loading: authViewModel.signUploading,
              title: 'Enregistrement',
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'L\'email ne peut pas être vide', context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      'Le mot de passe ne peut pas être vide', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Le mot de passe doit comprend 6 caractéres minimum',
                      context);
                } else {
                  //Compiling data
                  Map data = {
                    "email": emailController.text.toString(),
                    "password": passwordController.text.toString()
                  };
                  //Calling Api
                  authViewModel.registerApi(data, context);
                  print("Api hit");
                }
              },
            ),
            SizedBox(
              height: height * 0.010,
            ),
            InkWell(
                onTap: () => Navigator.pushNamed(context, RoutesName.connexion),
                child: const Text("Déjà un compte ? Ce connecter")),
          ],
        ),
      ),
    );
  }
}
