import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rice_quality_scaning_app/cubit/auth_cubit.dart';
import 'package:rice_quality_scaning_app/screens/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'Location',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/location.png'),
                    ),
                  ),
                ),
                Text(
                  'Aceh, Indonesia',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: kWhiteColor,
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    Widget textAndImage() {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rice',
                  style: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 10,
                    color: kWhiteColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Quality\nScanning ',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 10,
                    color: kWhiteColor,
                  ),
                ),
              ],
            ),
            Container(
              height: 140,
              width: 140,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/splash.png'),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget mainContent() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            Container(
              height: 160,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: kprimeColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: 25,
                        margin: const EdgeInsets.only(bottom: 5),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/dot.png'),
                          ),
                        ),
                      ),
                      Text(
                        'Untuk langkah-Langkah \nmelakukan scaning lihat \npada video ini.',
                        style: whiteStyle.copyWith(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/tutoriap-page');
                        },
                        child: Neumorphic(
                          style: NeumorphicStyle(
                            color: kprimeColor,
                            depth: -3,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(6)),
                            shadowLightColorEmboss:
                                Colors.grey.withOpacity(0.5),
                            shadowDarkColorEmboss:
                                Colors.black.withOpacity(0.6),
                          ),
                          child: SizedBox(
                            height: 38,
                            width: 100,
                            child: Center(
                              child: Text(
                                'Watch',
                                style: whiteStyle.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: double.maxFinite,
                    width: 100,
                    decoration: const BoxDecoration(
                      // color: kBlackColor,
                      image: DecorationImage(
                        image: AssetImage('assets/images/ilustration.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 220,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: kprimeColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(-4.0, -4.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/scan.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Lakukan scaning\ndengan memotret',
                          textAlign: TextAlign.center,
                          style: whiteStyle.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/scaning-page');
                          },
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: kprimeColor,
                              depth: -3,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(6)),
                              shadowLightColorEmboss:
                                  Colors.grey.withOpacity(0.5),
                              shadowDarkColorEmboss:
                                  Colors.black.withOpacity(0.6),
                            ),
                            child: SizedBox(
                              height: 38,
                              width: 100,
                              child: Center(
                                child: Text(
                                  'Scan',
                                  style: whiteStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Container(
                    height: 220,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      color: kprimeColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: const Offset(4.0, 4.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(-4.0, -4.0),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/upload.png'),
                            ),
                          ),
                        ),
                        Text(
                          'Lakukan scaning\ndengan memotret',
                          textAlign: TextAlign.center,
                          style: whiteStyle.copyWith(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/upload-page');
                          },
                          child: Neumorphic(
                            style: NeumorphicStyle(
                              color: kprimeColor,
                              depth: -3,
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(6)),
                              shadowLightColorEmboss:
                                  Colors.grey.withOpacity(0.5),
                              shadowDarkColorEmboss:
                                  Colors.black.withOpacity(0.6),
                            ),
                            child: SizedBox(
                              height: 38,
                              width: 100,
                              child: Center(
                                child: Text(
                                  'Upload',
                                  style: whiteStyle.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
              ],
            ),
            Container(
              height: 58,
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: kprimeColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(-4.0, -4.0),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(state.error),
                        ),
                      );
                    } else if (state is AuthInitial) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/signIn-page', (route) => false);
                    }
                  },
                  builder: (context, state) {
                    if (state is AuthLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: kWhiteColor,
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        context.read<AuthCubit>().signOut();
                      },
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          color: kprimeColor,
                          depth: -5,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(6)),
                          shadowLightColorEmboss: Colors.grey.withOpacity(0.6),
                          shadowDarkColorEmboss: Colors.black.withOpacity(0.6),
                        ),
                        child: SizedBox(
                          width: 156,
                          child: Center(
                            child: Text(
                              'LogOut',
                              style: whiteStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kprimeColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            header(),
            textAndImage(),
            mainContent(),
          ],
        ),
      ),
    );
  }
}
