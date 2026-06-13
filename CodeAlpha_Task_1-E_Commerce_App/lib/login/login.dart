import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/login/login_provider.dart';
import 'package:shopitem/sign_up/sign_up.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Login')),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Shop Item
                  Text(
                    "ShopItem",
                    style: tt.titleLarge?.copyWith(
                      color: Colors.lightBlue,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 30),

                  ///Welcome Back
                  Text(
                    'Welcome Back',
                    style: tt.titleMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15),

                  ///Secure Text
                  Text(
                    'Securely access your premium marketplace account',
                    style: tt.titleSmall?.copyWith(),
                  ),
                  SizedBox(height: 60),

                  ///Email TextField
                  Container(
                    child: TextFormField(
                      controller: provider.emailcontroller,
                      decoration: InputDecoration(
                        labelText: "Email or Phone",
                        hintText: "alex@example.com",

                        /// BORDER
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xffC9C9E8),
                            width: 1.5,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                        ),

                        /// LABEL STYLE
                        labelStyle: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),

                        /// HINT STYLE
                        hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 20,
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),

                  ///Password TextField
                  Container(
                    child: TextFormField(
                      controller: provider.passwordcontroller,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Color(0xffC9C9E8),
                            width: 1.5,
                          ),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),

                        labelStyle: const TextStyle(
                          color: Color(0xff5B5B75),
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),

                        suffixIcon: const Icon(
                          Icons.remove_red_eye_outlined,
                          size: 28,
                          color: Color(0xff5B5B75),
                        ),

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 22,
                        ),
                      ),
                    ),
                  ),

                  ///Forget Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forget Password?',
                        style: tt.titleMedium?.copyWith(
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),

                  ///Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        provider.loginUserWithEmailAndPassword();
                      },
                      icon: Icon(Icons.lock, color: Colors.white),
                      label: Text(
                        'Login',
                        style: tt.titleLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  ///OR Continue Text
                  Text(
                    'OR CONTINUE WITH',
                    style: tt.titleSmall?.copyWith(
                      color: Colors.black.withAlpha(30),
                    ),
                  ),
                  SizedBox(height: 10),

                  ///Other Sing In Option
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .5,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.g_mobiledata_outlined),
                              Text('Google'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: .5,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.apple_outlined),
                              Text('Apple'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  ///End To End Text
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.withAlpha(20),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shield_rounded, color: Colors.grey.shade500),
                        SizedBox(width: 10),
                        Text(
                          "END-TO-END ENCRYPTED SESSION",
                          style: tt.titleSmall?.copyWith(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  ///Sign Up Button
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ", // The base text
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .blue, // Optional: makes it look like a link
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => SignUp()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
