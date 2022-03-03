// ignore_for_file: file_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_quality_scaning_app/cubit/auth_cubit.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';
import 'package:rice_quality_scaning_app/widgets/costume_text_form_field.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController(text: '');

  final TextEditingController passwordController =
      TextEditingController(text: '');

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/asset1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 95, left: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rice quality',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    color: kBlackColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  ' Make sure good quality \n for consumption',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: kBlackColor,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  bottom: 40,
                  right: 35,
                  left: 35,
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 5,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 35,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white24.withOpacity(0.1),
                        ),
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 54,
                                  padding: const EdgeInsets.only(
                                    top: 3,
                                    left: 15,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: kWhiteColor,
                                  ),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      hintText: 'Email Address',
                                      hintStyle: greyStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 15,
                                      ),
                                      icon: const Icon(
                                        Icons.email,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 54,
                                  padding: const EdgeInsets.only(
                                    top: 3,
                                    left: 15,
                                    right: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: kWhiteColor,
                                  ),
                                  child: TextFormField(
                                    controller: passwordController,
                                    obscureText: !_isVisible,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: greyStyle.copyWith(
                                        fontWeight: medium,
                                        fontSize: 15,
                                      ),
                                      icon: const Icon(
                                        Icons.lock,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        },
                                        icon: _isVisible
                                            ? const Icon(
                                                Icons.visibility,
                                                color: Colors.black,
                                              )
                                            : const Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                BlocConsumer<AuthCubit, AuthState>(
                                  listener: (context, state) {
                                    if (state is AuthSuccess) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/main', (route) => false);
                                    } else if (state is AuthFailed) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(state.error),
                                        ),
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is AuthLoading) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    return Container(
                                      margin: const EdgeInsets.only(
                                          top: 30, bottom: 20),
                                      height: 53,
                                      width: 177,
                                      child: TextButton(
                                        onPressed: () {
                                          context.read<AuthCubit>().signIn(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text,
                                              );
                                        },
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          backgroundColor: kprimeColor,
                                        ),
                                        child: Text(
                                          'Login',
                                          style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: kWhiteColor),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Don’t have an account yet?',
                                      style: whiteStyle.copyWith(),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/signUp-page');
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: whiteStyle.copyWith(
                                          fontWeight: semibold,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
