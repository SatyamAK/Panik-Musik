import 'package:flutter/material.dart';
import 'package:panik_musik/constants/validator.dart';
import 'package:panik_musik/screens/register/registerscreen.dart';
import 'package:panik_musik/services/authService.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: (isProcessing)?Center(child:CircularProgressIndicator()):Form( 
          key: _formKey,
          child: Card(
            margin: EdgeInsets.symmetric(horizontal:12, vertical:200),
            child: Container( 
              padding: EdgeInsets.symmetric(horizontal:12, vertical: 12), 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 72,
                    child: Image.asset('assets/panik.png', fit: BoxFit.contain,),
                  ),
                  SizedBox(height:12),
                  Container(
                    height: 42,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration( 
                        contentPadding: EdgeInsets.only(bottom:9, left:16),
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
                        contentPadding: EdgeInsets.only(bottom: 9, left:16), 
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
                        if(!_formKey.currentState.validate()){
                          return null;
                        }
                        setState(() {
                          isProcessing = true;
                        });
                        AuthService().login(emailController.text, passwordController.text, context);
                        setState(() {
                          isProcessing = false;
                        });
                      },
                      child:Text('Login')
                    )
                  ),
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton( 
                        onPressed: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context)=>RegisterScreen())
                          );
                        },
                        child: Text('New User? Register Here'),
                      ),
                      TextButton( 
                        onPressed: (){},
                        child: Text('Forgot Password'),
                      )
                    ],
                  )
                ],
              )
            )
          ),
        ),
      ),
    );
  }
}