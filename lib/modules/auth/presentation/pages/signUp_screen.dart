import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:e_commerceapp/core/extensions/responsive_extensions.dart';
import 'package:e_commerceapp/core/gen/assets.gen.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainColor,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: AlignmentGeometry.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.isTablet ? 700 : double.infinity,
                maxHeight: double.infinity,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.spacingS,
                  horizontal: context.horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  mainAxisSize: MainAxisSize.min,
                  spacing: context.mainSpacing,
                  children: [
                    Image.asset(
                      Assets.images.routeLogo.path,
                      width: context.logoWidth,
                      height: context.logoWidth * 0.5,
                      fit: BoxFit.contain,
                    ),

                    Text(
                      'Full Name',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: context.fontBody,
                      ),
                    ),
                    CustomTextFormField(hintText: 'enter your full name'),
                    Text(
                      'Mobile Number',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: context.fontBody,
                      ),
                    ),
                    CustomTextFormField(hintText: 'enter your mobile no.'),
                    Text(
                      'E-mail address',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: context.fontBody,
                      ),
                    ),
                    CustomTextFormField(hintText: 'enter your email address'),
                    Text(
                      'Password',
                      style: context.textTheme.bodyLarge!.copyWith(
                        fontSize: context.fontBody,
                      ),
                    ),
                    CustomTextFormField(hintText: 'Enter Your Password'),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: []),

                    CustomElevatedButton(text: ' Sign up'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
