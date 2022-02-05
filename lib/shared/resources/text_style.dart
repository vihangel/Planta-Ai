import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class TextStyles {
  static final titleRegular = GoogleFonts.lexendDeca(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );
  static final title = GoogleFonts.lexendDeca(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorsApp.primary,
  );

  static final regular = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );
  static final titleCard = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );
  static final subCard = GoogleFonts.lexendDeca(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: ColorsApp.black,
  );
  static final priceCard = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: ColorsApp.primary,
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
  static final buttonBoldPrimarySmall = GoogleFonts.inter(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: ColorsApp.white,
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
