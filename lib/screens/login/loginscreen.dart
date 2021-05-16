import 'package:flutter/material.dart';
import 'package:panik_musik/screens/register/registerscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form( 
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
                      decoration: InputDecoration( 
                        contentPadding: EdgeInsets.only(top:4, bottom:4, left:16),
                        border: OutlineInputBorder(  
                          borderRadius: BorderRadius.circular(22)
                        ), 
                        hintText: 'Email'
                      )
                    ),
                  ),
                  SizedBox(height: 9),
                  Container(
                    height: 42,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration( 
                        contentPadding: EdgeInsets.only(top:4, bottom:4, left:16), 
                        border: OutlineInputBorder(  
                          borderRadius: BorderRadius.circular(22)
                        ),
                        hintText: 'Password'
                      )
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    width: 100,
                    child:ElevatedButton( 
                      onPressed: (){},
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