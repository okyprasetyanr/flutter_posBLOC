import 'package:flutter/material.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropDownBranch extends StatelessWidget {
  final int i;
  final TextEditingController areaBranch;
  final TextEditingController addressBranch;
  final TextEditingController phoneBranch;

  const CustomDropDownBranch({
    super.key,
    required this.i,
    required this.areaBranch,
    required this.addressBranch,
    required this.phoneBranch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text("Cabang $i", style: GoogleFonts.poppins(fontSize: 20)),
            customTextFieldSignUp(
              "Daerah Cabang",
              "Masukkan daerah...",
              areaBranch,
              validator: (value) => null,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(height: 10),
            customTextFieldSignUp(
              "Alamat Cabang",
              "Masukkan alamat...",
              addressBranch,
              validator: (value) => null,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(height: 10),
            customTextFieldSignUp(
              "No. Telepon",
              "Masukkan no telepon...",
              phoneBranch,
              validator: (value) => null,
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}

Widget customTextFieldSignUp(
  String label,
  String hint,
  TextEditingController controller, {
  required TextInputType keyboardType,
  required String? Function(dynamic value) validator,
}) {
  return Material(
    elevation: 4,
    shadowColor: Colors.black,
    borderRadius: BorderRadius.circular(15),
    child: TextFormField(
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: labelTextStyle,
        labelText: label,
        hintStyle: hintTextStyle,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    ),
  );
}
