import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopitem/login/login.dart';
import 'package:shopitem/login/login_provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;
    return Consumer<LoginProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(title: Text('Shop Item')),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  ///Heading
                  Text('Create Account', style: tt.titleLarge),
                  SizedBox(height: 20),
                  Text(
                    'Jion Our exculusive community of verified luxury shoppers and merchants',
                    textAlign: TextAlign.center,
                  ),

                  ///Full Name Text
                  SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Full Name',
                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Full Name TextField
                  Container(
                    child: TextField(
                      controller: provider.namecontroller,
                      decoration: InputDecoration(
                        // hintText: 'Enter your full name',
                        hint: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Enter your full name',
                              style: tt.titleSmall?.copyWith(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: cs.primary, width: 0.4),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  /// Email Text Heading
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email or Phone Number',
                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Email TextField
                  Container(
                    child: TextField(
                      controller: provider.emailcontroller,
                      decoration: InputDecoration(
                        // hintText: 'Enter your full name',
                        hint: Row(
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'name@example.com',
                              style: tt.titleSmall?.copyWith(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                        labelText: 'Enter Email',
                        labelStyle: tt.titleSmall?.copyWith(
                          color: cs.onSurface.withAlpha(50),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 5),

                  /// Password text
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: tt.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Password TextField
                  Container(
                    child: TextField(
                      controller: provider.passwordcontroller,
                      decoration: InputDecoration(
                        // hintText: 'Enter your full name',
                        hint: Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              color: Colors.grey.shade300,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'min. 8 characters',
                              style: tt.titleSmall?.copyWith(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                        labelText: 'Enter Password',
                        labelStyle: tt.titleSmall?.copyWith(
                          color: cs.onSurface.withAlpha(50),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Agree Text
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(
                        'I agree to the terms & Conditions and Privacy Policy',
                      ),
                    ],
                  ),

                  /// Create Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,

                    child: ElevatedButton.icon(
                      onPressed: () {
                        provider.createUserWithEmailAndPassword();
                      },
                      label: Text(
                        'Create Account',
                        style: tt.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    'or Sign up with',
                    style: tt.titleMedium?.copyWith(
                      color: Colors.grey.shade400,
                    ),
                  ),

                  /// Other Sign up
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.g_mobiledata_outlined),
                            label: Text('Google'),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.apple_outlined),
                            label: Text('Apple'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  /// Login In
                  Text.rich(
                    TextSpan(
                      text: 'Allready have an account?',
                      children: [
                        TextSpan(
                          text: "Log in",
                          style: TextStyle(color: Colors.lightBlue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => Login()),
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
