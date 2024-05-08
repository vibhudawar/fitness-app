import 'package:fitness_app/src/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fitness_app/src/view/auth_screen_view_model.dart';
import 'image_picker.dart';

class AuthForm extends StatefulWidget {
  final AuthScreenViewModel model;
  const AuthForm({super.key, required this.model});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: widget.model.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (!widget.model.isLogin) PickImage(widget.model.pickImage),
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    onSaved: (value) {
                      widget.model.userEmail = value as String;
                    },
                  ),
                  if (!widget.model.isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value == null || value.length <= 3) {
                          return 'Please enter a valid username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: 'UserName',
                      ),
                      onSaved: (value) {
                        widget.model.userName = value as String;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 7 characters';
                      }
                      return null;
                    },
                    obscureText: !widget.model.showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          widget.model.showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          widget.model.changePasswordVisibility();
                        },
                      ),
                    ),
                    onSaved: (value) {
                      widget.model.userPassword = value as String;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (isLoading)
                    const CircularProgressIndicator()
                  else
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        bool isSuccess = await widget.model.trySubmit(context);
                        if (isSuccess) {
                          Navigator.of(context)
                              .pushReplacementNamed(HomeScreen.routeName);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          Fluttertoast.showToast(
                              msg:
                                  'Oops! An error occurred while passing credentials');
                        }
                      },
                      child: Text(
                        widget.model.isLogin ? 'Login' : 'Signup',
                      ),
                    ),
                  if (!isLoading)
                    TextButton(
                      onPressed: () {
                        widget.model.changeLoginType();
                      },
                      child: Text(
                        widget.model.isLogin
                            ? 'Create New Account'
                            : 'I already have an account',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
