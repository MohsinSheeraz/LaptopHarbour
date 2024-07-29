import 'package:flutter/material.dart';
import 'Registration.dart';

class HomePage extends StatefulWidget {
  final String? firstName;

  HomePage({this.firstName});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _firstName;

  @override
  void initState() {
    super.initState();
    _firstName = widget.firstName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          if (_firstName == null) ...[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegistrationPage()),
                );
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String email = '';
                    String password = '';
                    return AlertDialog(
                      title: Text('Login'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: 'Email'),
                            onChanged: (value) => email = value,
                          ),
                          TextField(
                            decoration: InputDecoration(labelText: 'Password'),
                            obscureText: true,
                            onChanged: (value) => password = value,
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _firstName =
                                  'User'; // Replace with real user data
                            });
                          },
                          child: Text('Login'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Center(
                child: Text(
                  'Welcome, $_firstName!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]
        ],
      ),
      body: Center(
        child: Text(
          _firstName != null
              ? 'Welcome, $_firstName!'
              : 'Welcome to the Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
