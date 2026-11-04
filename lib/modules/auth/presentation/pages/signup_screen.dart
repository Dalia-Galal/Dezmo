import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:e_commerceapp/core/extensions/responsive_extensions.dart';
import 'package:e_commerceapp/core/gen/assets.gen.dart';
import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:e_commerceapp/core/utils/validator.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_up_parameters.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_up/sign_up_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _mobileNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                child: Form(
                  key: _formKey,
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
                      CustomTextFormField(
                        hintText: 'enter your full name',
                        controller: _nameController,
                        validator: (value) => Validator.validateName(value),
                      ),
                      Text(
                        'Mobile Number',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: context.fontBody,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'enter your mobile no.',
                        controller: _mobileNumberController,
                        validator: (value) =>
                            Validator.validatePhoneNumber(value),
                      ),
                      Text(
                        'E-mail address',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: context.fontBody,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'enter your email address',
                        controller: _emailController,
                        validator: (value) => Validator.validateEmail(value),
                      ),
                      Text(
                        'Password',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: context.fontBody,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Your Password',
                        controller: _passwordController,
                        validator: (value) => Validator.validatePassword(value),
                      ),

                      SizedBox(
                        width: 20,
                      ),
                      BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, state) {
                          if (state is SignUpSuccessState) {
                            context.go(PageRouteName.home);
                          } else if (state is SignUpErrorState) {
                            print(state.message);
                          }
                        },
                        builder: (context, state) {
                          if (state is SignUpLoadingState) {
                            return CircularProgressIndicator();
                          }
                          return CustomElevatedButton(
                            text: ' Sign up',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignUpBloc>().add(
                                  SignUpEvent(
                                    SignUpParameters(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                      name: _nameController.text,
                                      phone: _mobileNumberController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: context.textTheme.titleMedium!.copyWith(
                              color: ColorPalette.whiteColor,
                              fontSize: context.fontTitle,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.push(PageRouteName.login),
                            child: Text(
                              ' Login ',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: ColorPalette.whiteColor,
                                fontSize: context.fontTitle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
