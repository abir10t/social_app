import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instragram_clone/resources/auth_methods.dart';
import 'package:instragram_clone/utils/colors.dart';
import 'package:instragram_clone/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage()
  {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SvgPicture.asset(
                'assets/images/instragram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 64,
                    backgroundImage:
                        NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.red,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: selectImage,

                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                textInputType: TextInputType.text,
                hintText: 'Enter Your Username',
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter Your Email'),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                textInputType: TextInputType.text,
                hintText: 'Enter Your Password',
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  textEditingController: _bioController,
                  textInputType: TextInputType.text,
                  hintText: 'Enter Your bio'),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  print("hello");
                  String res = await AuthMethods().signUpUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                      bio: _bioController.text,
                      username: _usernameController.text);

                  print("here res is $res");


                },
                child: Container(
                  child: const Text('Sign Up'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Don't have an account?"),
                    padding: EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                  Container(
                    child: const Text(
                      " Sign up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
