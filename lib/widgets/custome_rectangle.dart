import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import '../screens/theme.dart';

class CustomeRectangle extends StatelessWidget {
  const CustomeRectangle({
    Key? key,
    required this.title,
    required this.text,
    required this.persen,
  }) : super(key: key);

  final String title;
  final String text;
  final double persen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
              height: 80,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: whiteStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    text,
                    style: whiteStyle.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Neumorphic(
            style: NeumorphicStyle(
              color: kprimeColor,
              depth: -5,
              boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              shadowLightColorEmboss: Colors.grey.withOpacity(0.5),
              shadowDarkColorEmboss: Colors.black.withOpacity(0.6),
            ),
            child: SizedBox(
              height: 80,
              width: 80,
              child: Center(
                child: Text(
                  '$persen%'.toString(),
                  style: whiteStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
