import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planta_ai/shared/resources/colors.dart';

class TextStyles {
  static final titleRegular = GoogleFonts.lexendDeca(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );

  static final regular = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );

  static final bold = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsApp.black,
  );

  static final buttonBoldPrimary = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorsApp.primary,
  );

  static final buttonBold = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: ColorsApp.white,
  );

  static final input = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorsApp.gray,
  );
}
