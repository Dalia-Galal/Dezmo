import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/extensions/responsive_extensions.dart';
import 'package:e_commerceapp/core/gen/assets.gen.dart';
import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorPalette.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: context.isTablet ? 500 : double.infinity,
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(
                  vertical: context.spacingS,
                  horizontal:  context.horizontalPadding ,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  spacing: context.isTablet?100:20,
                  children: [
                    Center(
                      child: Image.asset(
                        Assets.images.routeLogo.path,
                        width: context.isTablet ? 220 : 140,
                        fit: BoxFit.contain,
                      ),
                    ),

                    Text(
                      'Welcome Back To Route',
                      style: context.theme.textTheme.headlineSmall
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: context.theme.textTheme.titleSmall
                    ),

                    Text('User Name', style: context.theme.textTheme.bodyLarge),
                    CustomTextFormField(hintText: 'Enter Your Name'),
                    Text('Password', style: context.textTheme.bodyLarge),
                    CustomTextFormField(hintText: 'Enter Your Password'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password',
                          style: context.theme.textTheme.titleMedium!.copyWith(
                            color: ColorPalette.whiteColor,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                    CustomElevatedButton(),
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
