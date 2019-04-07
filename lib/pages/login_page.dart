import 'package:flutter/material.dart';
import 'package:ecom_mobile_flutter/pages/register_page.dart';
import 'package:ecom_mobile_flutter/pages/user_detail_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Login';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  String _username;
  String _password;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
                child: Column(
              children: <Widget>[
                _usernameField(),
                _passwordField(),
                _loginButton(),
                _toRegisterPage()
              ],
            ))));
  }

  _usernameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Username'),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return 'Username can not be empty';
        }
      },
      onSaved: (val) {
        _username = val;
      },
    );
  }

  _passwordField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value.isEmpty) {
          return 'Password can not be empty';
        }
      },
      onSaved: (val) {
        _password = val;
      },
    );
  }

  _loginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () {
          // Validate will return true if the form is valid, or false if
          // the form is invalid.
          if (_formKey.currentState.validate()) {
            // If the form is valid, we want to show a Snackbar
            _formKey.currentState.save();
            print("Username $_username");
            print("Password $_password");
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('Processing Data')));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDetailPage()),
            );
          }
        },
        child: Text('Submit'),
      ),
    );
  }

  _toRegisterPage() {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegisterPage()),
        );
      },
      child: Text('Don\'t have an account? Tap here to Register'),
    );
  }
}
