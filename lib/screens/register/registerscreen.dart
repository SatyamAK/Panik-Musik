import 'package:flutter/material.dart';
import 'package:panik_musik/constants/validator.dart';
import 'package:panik_musik/services/authService.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        child: (isProcessing)?Center(child: CircularProgressIndicator()):Form( 
          key: _formKey,
          child: Center(
            child: Container( 
              margin: EdgeInsets.symmetric(horizontal:12, vertical: 12), 
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 72,
                    child: Image.asset('assets/panik.png', fit: BoxFit.contain,),
                  ),
                  SizedBox(height:12),
                  SizedBox(height: 4),
                  Container(
                    height: 42,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration( 
                        contentPadding: EdgeInsets.only(bottom:8, left:16),
                        hintText: 'Email'
                      ),
                      validator: validateEmail,
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    height: 42,
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration( 
                        contentPadding: EdgeInsets.only(bottom: 8, left:16), 
                        hintText: 'Password'
                      ),
                      validator: validatePass,
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: 100,
                    child:ElevatedButton( 
                      onPressed: () async {
                        if(!_formKey.currentState!.validate()){
                          return null;
                        }
                        setState(() {
                          isProcessing = true;
                        });
                        AuthService().register(
                          emailController.text, passwordController.text, context
                        );
                        isProcessing = false;
                      },
                      child:Text('Register')
                    )
                  ),
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}