import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // String name = '';

  //fr FORM
  var _formkey = GlobalKey<FormState>(); // key to uniquely identify a widget; also handles the state
  TextEditingController _phnController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[200],
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    "https://www.charislms.com/images/slogin.png",
                    width: 200,
                    height: 250,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _phnController,
                    // onSubmitted: (v){
                    //   name = v;
                    // },
                    // onChanged: (v) {
                    //   print(v);
                    // },
                    decoration: InputDecoration(
                        hintText: '+91',
                        labelText: 'Enter your Contact No.',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 5,
                            color: Colors.green[900],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        // errorText: name.isEmpty?'Please input a name':null,
                        icon: Icon(Icons.person),),

                    keyboardType: TextInputType.phone,
                    validator: (val){
                      if(val.isEmpty)
                        return 'Please enter your no';

                      else if(val.length<10)
                        return 'Number must be of 5 characters atleast';

                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextFormField(
                    controller: _passwordController,
                    // onSubmitted: (v){
                    //   name = v;
                    // },
                    // onChanged: (v) {
                    //   print(v);
                    // },
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 5,
                          color: Colors.green[900],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // errorText: name.isEmpty?'Please input a name':null,
                      icon: Icon(Icons.enhanced_encryption),),

                    keyboardType: TextInputType.text,
                    validator: (val){
                      if(val.isEmpty)
                        return 'Please enter your password';

                      else if(val.length<5)
                        return 'Password must be of 5 characters atleast';

                        return null;
                    },
                    obscureText: true,
                  ),
                ),

                FlatButton(onPressed: ()=>checkSignIn(),
                  height: 40,
                  minWidth: 200,
                  color: Colors.cyan[800],
                  child: Text('Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                  ),),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(
                    width: 3,
                    color: Colors.cyan
                  ),
                ),),
              ],
            ),
          ),
        ));
  }

  checkSignIn() {
    if(_formkey.currentState.validate()) // validator
        print('Phone: ${_phnController.text}\n'
            'Password: ${_passwordController.text}');
  }
}
