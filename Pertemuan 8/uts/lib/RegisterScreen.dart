import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _rememberMe = false;

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    } else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
        .hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter, 1 lowercase letter, and 1 number';
    }
    return null;
  }

  final List<String> logo = [
    'google',
    'facebook',
    'twitter',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                // // SvgPicture.asset('assets/logo/logo.svg'),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Text(
                  'Register an Account!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.02,
                      right: size.width * 0.02,
                    ),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: name,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              helperText: ' ',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                              // hintText: 'Enter your email',
                              labelText: 'Name'),
                          validator: _nameValidator,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 0),
                              helperText: ' ',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                              // hintText: 'Enter your email',
                              labelText: 'Email'),
                          validator: _emailValidator,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            // hintText: 'Enter your password',
                            helperText: ' ',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          validator: _passwordValidator,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        activeColor: Colors.grey[600],
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        }),
                    const Text('I agree terms and conditions'),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: size.width * 0.02,
                    right: size.width * 0.02,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Sign Up Success"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name : ${name.text}"),
                                Text("Email : ${email.text}"),
                                Text("Password : ${password.text}"),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 48),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 61, 64, 67),
                      ),
                      overlayColor: MaterialStatePropertyAll(
                        Colors.black.withOpacity(0.1),
                      ),
                    ),
                    child: const Text('Sign Up'),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign in',
                        style: const TextStyle(color: Color(0xFF3D80DE)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pop(context);
                          },
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
                  width: size.width * 0.8,
                  child: const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.black),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                const Column(
                  children: [
                    // Text('-- OR --'),
                    // SizedBox(height: 10),
                    Text(
                      'Sign up with',
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      logo.length,
                      (index) => GestureDetector(
                        onTap: () => print('login with ${logo[index]}'),
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/logo/${logo[index]}.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
