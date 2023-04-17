import 'package:flutter/material.dart';
import 'package:flutter_auth/models/user.dart';
import 'package:flutter_auth/services/web_services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:prefs/prefs.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../utils/commons.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Profil/home_screen.dart';
import '../../Signup/signup_screen.dart';
import '../../Welcome/welcome_screen.dart';

class LoginForm extends StatelessWidget {
   LoginForm({
    Key? key,
  }) : super(key: key);


   String? lastname, firstname, email, password;
   TextEditingController  _emailController =TextEditingController();
   TextEditingController  _passwordController =TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailController,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding:  EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: _passwordController,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const  InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding:  EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async{

                await Prefs.init();
                email = _emailController.text;
                password = _passwordController.text;

                print('------------------: $email - ${_emailController.text}  - ${_emailController.text.isEmpty }');
                print('------------------: $password - ${_passwordController.text}  - ${_passwordController.text.isEmpty }');

                Utils().loadingDialog(context, msg: "Connexion en cours!");
                WebService().login(email!, password!).then((value) async {
                  Navigator.of(context).pop();
                  if(value == null){
                    Fluttertoast.showToast(msg: "Erreur email ou mot de passe", toastLength: Toast.LENGTH_LONG);
                  }
                  else{
                    Prefs.setString(LOGIN, email!);
                    Prefs.setString(PASSWORD, password!);
                    Commons.user = value;
                    Fluttertoast.showToast(msg: "Bonjour ${value.first_name}", toastLength: Toast.LENGTH_LONG);
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  HomeScreen()), (Route<dynamic> route) => false);
                  }
                });

              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            child: RichText(text: const TextSpan(
                children: [
                  TextSpan(text: "Vous n'avez pas de compte? "),
                  TextSpan(text: "Créez en un ici! ", style: TextStyle(color: Colors.red))
                ]
            )),
            onTap: (){
              print("--------------");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
              },
          )

        ],
      ),
    );
  }

}