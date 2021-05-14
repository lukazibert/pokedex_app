import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:pokedex_app/controllers/account_controller.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AccountController _accountController = Get.find();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        //key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //SizedBox(height: 50.0),
            Text(
              'Sing in to your pokedex account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Pocket-monk',
                fontSize: 30,
              ),
            ),
            //SizedBox(height: 50.0),
            TextFormField(
              //obscureText: true,
              //controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email',
                hintStyle: TextStyle(fontFamily: 'Pocket-monk', fontSize: 20.0),
              ),
              validator: (val) => val.isEmpty ? 'Enter an email' : null,
              onChanged: (val) {
                //_emailController.text = val;
                _accountController.email.value = val;
              },
            ),
            //SizedBox(height: 50.0),
            TextFormField(
              //controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(fontFamily: 'Pocket-monk', fontSize: 20.0),
              ),
              validator: (val) =>
                  val.length < 6 ? 'Enter a password 6+ chars long' : null,
              onChanged: (val) {
                _accountController.password.value = val;
              },
            ),
            //SizedBox(height: 40.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 1,
                    offset: Offset(1.5, 3),
                  ),
                ],
              ),
              child: Material(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.yellow,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  //focusColor: Colors.black,
                  splashColor: Colors.white.withOpacity(0.2),
                  onTap: () async {
                    if (_accountController.email.value != '' &&
                            _accountController.password.value != ''
                        //     &&
                        // _formKey.currentState.validate()
                        ) _accountController.singIn();
                    print('sing in');
                  },
                  child: Container(
                    // decoration: BoxDecoration(
                    //     color: Colors.yellow,
                    //     borderRadius:
                    //         BorderRadius.all(Radius.circular(20.0))),
                    height: 50.0,
                    width: 200.0,
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontFamily: 'Pocket-monk', fontSize: 40.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => _accountController.registerButton.value = true,
              child: Text(
                'Register',
                style: TextStyle(fontFamily: 'Pocket-monk', fontSize: 20.0),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.red),
                  overlayColor: MaterialStateProperty.all(Colors.black)),
            )
          ],
        ),
      ),
    );
  }
}
