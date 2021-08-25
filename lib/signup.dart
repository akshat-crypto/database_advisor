import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:databaseapp/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController _email = new TextEditingController();
//   TextEditingController _username = new TextEditingController();
//   TextEditingController _password = new TextEditingController();

//   Future<void> signUp() async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//         email: _email.text,
//         password: _password.text,
//       )
//           .then((value) {
//         FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _email.text,
//           password: _password.text,
//         );
//         Navigator.pushReplacement(
//             context, MaterialPageRoute(builder: (context) => HomePage()));
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: _username,
//                   decoration: InputDecoration(
//                     icon: Icon(Icons.person),
//                     labelText: "Enter UserName",
//                     hintText: "Username",
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   controller: _email,
//                   decoration: InputDecoration(
//                     icon: Icon(Icons.email),
//                     labelText: "Enter Email",
//                     hintText: "Email",
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextFormField(
//                   obscureText: true,
//                   controller: _password,
//                   decoration: InputDecoration(
//                     icon: Icon(Icons.lock),
//                     labelText: "Enter Password",
//                     hintText: "Password",
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: MaterialButton(
//                 onPressed: () => {signUp()},
//                 child: Text("Submit"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController firstNameInputController;
  TextEditingController lastNameInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
  TextEditingController userNameInputController;
  TextEditingController policyNameInputController;

  @override
  initState() {
    firstNameInputController = new TextEditingController();
    lastNameInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
    userNameInputController = new TextEditingController();
    policyNameInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
                child: Form(
              key: _registerFormKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'First Name*', hintText: "John"),
                    controller: firstNameInputController,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a valid first name.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Last Name*', hintText: "Doe"),
                    controller: lastNameInputController,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a valid last name.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'User Name*', hintText: "Doe331"),
                    controller: userNameInputController,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a valid username.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Plan', hintText: "Gold"),
                    controller: policyNameInputController,
                    validator: (value) {
                      if (value.length < 3) {
                        return "Please enter a valid plan name.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email*', hintText: "john.doe@gmail.com"),
                    controller: emailInputController,
                    keyboardType: TextInputType.emailAddress,
                    validator: emailValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password*', hintText: "********"),
                    controller: pwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Confirm Password*', hintText: "********"),
                    controller: confirmPwdInputController,
                    obscureText: true,
                    validator: pwdValidator,
                  ),
                  MaterialButton(
                    child: Text("Register"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_registerFormKey.currentState.validate()) {
                        if (pwdInputController.text ==
                            confirmPwdInputController.text) {
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                              .then((currentUser) => FirebaseFirestore.instance
                                          .collection("advisor")
                                          .add({
                                        "fname": firstNameInputController.text,
                                        "lname": lastNameInputController.text,
                                        "email": emailInputController.text,
                                        "username":
                                            userNameInputController.text,
                                        "plan": policyNameInputController.text,
                                      })
                                  // .doc(currentUser.)
                                  //.document(currentUser.credential)
                                  // .setData(
                                  // {
                                  //"uid": currentUser.uid,

                                  // },
                                  )
                              .then((result) => {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                        (_) => false),
                                    firstNameInputController.clear(),
                                    lastNameInputController.clear(),
                                    emailInputController.clear(),
                                    pwdInputController.clear(),
                                    confirmPwdInputController.clear(),
                                    userNameInputController.clear(),
                                    policyNameInputController.clear()
                                  });
                          // .catchError((err) => print(err))
                          // .catchError((err) => print(err));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("The passwords do not match"),
                                  actions: <Widget>[
                                    MaterialButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      }
                    },
                  ),
                  Text("Already have an account?"),
                  MaterialButton(
                    child: Text("Login here!"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ))));
  }
}
