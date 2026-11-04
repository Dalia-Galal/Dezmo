import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/extensions/responsive_extensions.dart';
import 'package:e_commerceapp/core/gen/assets.gen.dart';
import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:e_commerceapp/core/utils/validator.dart';
import 'package:e_commerceapp/modules/auth/domain/entities/sign_in_parameters.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_in/sign_in_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
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
        child: Form(
          key: _formKey,
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
                        'Welcome Back To Route',
                        style: context.textTheme.headlineSmall!.copyWith(
                          fontSize: context.fontHeadline,
                        ),
                      ),
                      Text(
                        'Please sign in with your mail',
                        style: context.textTheme.titleSmall!.copyWith(
                          fontSize: context.fontTitle,
                        ),
                      ),

                      Text(
                        'User Email',
                        style: context.textTheme.bodyLarge!.copyWith(
                          fontSize: context.fontBody,
                        ),
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Your Email',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: ()=>context.push(PageRouteName.forgotPassword),
                            child: Text(
                              'Forgot password',
                              style: context.textTheme.titleMedium!.copyWith(
                                color: ColorPalette.whiteColor,
                              ),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: context.spacingS),
                      BlocConsumer<SignInBloc, SignInState>(
                        listener: (context, state) {
                          if (state is SuccessSignInState) {
                            context.go(PageRouteName.home);
                          } else if (state is ErrorSignInState) {
                            print(state.message);
                          }
                        },
                        builder: (context, state) {
                          if (state is LoadingSignInState) {
                            return CircularProgressIndicator();
                          }
                          return CustomElevatedButton(
                            text: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignInBloc>().add(
                                  SignInEvent(
                                    SignInParameters(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text,
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: context.textTheme.titleMedium!.copyWith(
                              color: ColorPalette.whiteColor,
                              fontSize: context.fontTitle,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => context.push(PageRouteName.signUp),
                            child: Text(
                              ' Create Account',
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
