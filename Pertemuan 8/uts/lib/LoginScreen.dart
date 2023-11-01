import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _rememberMe = false;

  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
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
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Text(
                  'Welcome back!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                Form(
                  key: _formKey,
                  child: Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.02,
                      right: size.width * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            labelText: 'Email',
                          ),
                          validator: _emailValidator,
                        ),
                        const SizedBox(height: 5),
                        TextFormField(
                          controller: password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 0),
                            helperText: ' ',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            labelText: 'Password',
                            suffixIcon: IconButton(
                              icon: _obscureText
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        const Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement forgot password
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: Color(0xFF3D80DE)),
                      ),
                    ),
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
                            title: const Text("Login Success"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                    child: const Text('Login'),
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign up',
                        style: const TextStyle(color: Color(0xFF3D80DE)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            );
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
                    Text(
                      'Sign in with',
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
                          // padding: EdgeInsets.all(12),
                          // child: Image.asset(
                          //   'assets/logo/${logo[index]}.jpg',
                          //   width: 24,
                          // ),
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
                                image: AssetImage(
                              'assets/logo/${logo[index]}.jpg',
                            )),
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
