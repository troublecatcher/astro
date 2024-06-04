import 'package:astro/app/theme.dart';
import 'package:astro/common/widget/custom_text_field.dart';
import 'package:astro/features/primary/horoscope/domain/zodiac_sign/zodiac_sign.dart';
import 'package:astro/features/secondary/profile/shared/model/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class ProfileCreationWidget extends StatefulWidget {
  final Widget title;
  final Function(Profile) onDone;
  const ProfileCreationWidget(
      {super.key, required this.title, required this.onDone});

  @override
  State<ProfileCreationWidget> createState() => _ProfileCreationWidgetState();
}

class _ProfileCreationWidgetState extends State<ProfileCreationWidget> {
  final nameController = TextEditingController();
  DateTime? dateOfBirth;
  final dateOfBirthController = TextEditingController();
  final placeOfBirthController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    dateOfBirthController.dispose();
    placeOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSize(
          duration: Durations.medium4,
          curve: Curves.easeOut,
          child: Container(
            padding: EdgeInsets.all(20.r),
            margin: EdgeInsets.symmetric(horizontal: 40.w),
            decoration: BoxDecoration(
              borderRadius: br10,
              gradient: gradient1,
            ),
            child: Column(
              children: [
                widget.title,
                SizedBox(height: 33.h),
                CustomTextField(
                  title: 'NAME',
                  canRequestFocus: true,
                  controller: nameController,
                  onChanged: (_) => setState(() {}),
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  title: 'DATE OF BIRTH',
                  canRequestFocus: false,
                  controller: dateOfBirthController,
                  onTap: () async {
                    final newDateOfBirth = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    setState(() {
                      if (newDateOfBirth != null) {
                        dateOfBirth = newDateOfBirth;
                        dateOfBirthController.text =
                            DateFormat('dd.MM.yyyy').format(newDateOfBirth);
                      } else {
                        dateOfBirth = null;
                        dateOfBirthController.text = '';
                      }
                    });
                  },
                ),
                SizedBox(height: 14.h),
                CustomTextField(
                  title: 'PLACE OF BIRTH',
                  canRequestFocus: true,
                  controller: placeOfBirthController,
                  onChanged: (_) => setState(() {}),
                ),
                if (dateOfBirth != null)
                  Column(
                    children: [
                      SizedBox(height: 32.h),
                      SvgPicture.asset(zodiacSign().assetName),
                    ],
                  )
              ],
            ),
          ),
        ),
        SizedBox(height: 66.h),
        CupertinoButton.filled(
          onPressed: formValid()
              ? () {
                  widget.onDone(
                    Profile(
                      name: nameController.text,
                      dateOfBirth: dateOfBirth!,
                      placeOfBirth: placeOfBirthController.text,
                      zodiacSign: zodiacSign(),
                    ),
                  );
                }
              : null,
          child: const Text('CONTINUE'),
        ),
      ],
    );
  }

  formValid() {
    return nameController.text.isNotEmpty &&
        dateOfBirth != null &&
        placeOfBirthController.text.isNotEmpty;
  }

  ZodiacSign zodiacSign() => ZodiacSign.determineZodiacSign(dateOfBirth!);
}
