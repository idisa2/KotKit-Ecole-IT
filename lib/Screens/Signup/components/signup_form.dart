import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/splash_screen.dart';
import 'package:prefs/prefs.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../models/user.dart';
import '../../../services/web_services.dart';
import '../../../utils/utils.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatelessWidget {
   SignUpForm({
    Key? key,
  }) : super(key: key);

   String? lastname, firstname, email, password;
   TextEditingController  _emailController =TextEditingController();
   TextEditingController  _passwordController =TextEditingController();
   TextEditingController  _nameController =TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child:TextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (nom) {
                firstname = nom;
                lastname = nom;
              },
              decoration: const InputDecoration(
                hintText: "Your name",
                prefixIcon: Padding(
                  padding:  EdgeInsets.symmetric(vertical:defaultPadding),
                  child: Icon(Icons.person),
              ),
            ),
          ),
      ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextFormField(
              controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                onSaved: (val) {
                  email = val;
                },
                decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Padding(
                  padding:  EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
              ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: _passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onSaved: (value) {password = value;},
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding:  EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async{
              firstname = _nameController.text;
              lastname = _nameController.text;
              email = _emailController.text;
              password = _passwordController.text;

              print('------------------: $firstname - ${_nameController.text} - ${_nameController.text.isEmpty }');
              print('------------------: $email - ${_emailController.text}  - ${_emailController.text.isEmpty }');
              print('------------------: $password - ${_passwordController.text}  - ${_passwordController.text.isEmpty }');
              if (firstname != null && email != null && password != null) {
                AppUser user = AppUser(id:0, first_name: firstname!, last_name: lastname!, email: email!, phone_number: "960000000", gender: "M", access_token: '', refresh_token: '', groups: [], token_expire: DateTime.now(), is_staff: false, is_active: false, );
                // Fluttertoast.showToast(msg: "Hello");
                Utils().loadingDialog(context, msg: "Création du compte en cours");
                WebService().register(user, password!.trim(), password!.trim()).then((value){
                  Navigator.of(context).pop();
                  if(value == true){
                    Prefs.setString("LOGIN", email!);
                    Prefs.setString("ACCESS", password!);

                    Utils().showAlertSimpleMessage(context, "Félicitations, votre compte a été créé, vous pouvez vous connecter", (){
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>  SplashScreen()), (Route<dynamic> route) => false);
                    });
                  }
                  else{
                    Utils().showAlertSimpleMessage(context, "Une erreur s'est produite", (){
                      Navigator.of(context).pop();
                    });
                  }
                });
              }
              else{
                Utils().showAlertSimpleMessage(context, "Veuillez remplir toutes les informations", (){
                  Navigator.of(context).pop();
                });
              }
              
              
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: 20),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          
        ],
      ),
    );
  }
}