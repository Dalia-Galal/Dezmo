import 'package:e_commerceapp/core/app_theme/color_palette.dart';
import 'package:e_commerceapp/core/extensions/context_extensions.dart';
import 'package:e_commerceapp/core/extensions/responsive_extensions.dart';
import 'package:e_commerceapp/core/routes_manager/page_route_name.dart';
import 'package:e_commerceapp/core/utils/validator.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_event.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/forget_password/forget_password_state.dart';
import 'package:e_commerceapp/modules/auth/presentation/manager/sign_in/sign_in_bloc.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_elevated_button.dart';
import 'package:e_commerceapp/modules/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey =GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainColor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.spacingL,
            horizontal: context.horizontalPadding,

          ),

          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: context.mainSpacing,
              children: [
                Text(
                  'Reset Your Password',
                  style: context.textTheme.headlineSmall!.copyWith(
                    fontSize: context.fontHeadline,
                  ),
                ),


                CustomTextFormField(
                  hintText: 'Enter Your Email',
                  controller: _emailController,
                  validator: (value) => Validator.validateEmail(value),
                ),

                BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                  listener: (context, state) {
                    if (state is ForgetPasswordSuccessState) {
                      print('Success');
                    } else if (state is ForgetPasswordErrorState) {
                      print(state.message);
                    }
                  },
                  builder: (context, state) {
                    if (state is LoadingSignInState) {
                      return CircularProgressIndicator();
                    }
                    return CustomElevatedButton(
                      text: 'Reset Password',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {

                        context.read<ForgetPasswordBloc>().add(
                          ForgetPasswordEvent(_emailController.text.trim()),
                        );}


                        });})],
            ),
          ),
        ),
      ),
    );
  }
}
