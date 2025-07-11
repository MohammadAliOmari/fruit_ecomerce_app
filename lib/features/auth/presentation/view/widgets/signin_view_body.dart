import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_images.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signin_cubit/signin_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/dont_have_aaccount.dart';
import 'package:fruite_app/core/widgets/or_divider.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signin_bloc_listner.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/social_signin_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SigninCubit>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: cubit.formKey,
          autovalidateMode: cubit.autoValidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                controller: cubit.emailController,
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                toogglePassword: () => cubit.togglePasswordVisibility(),
                controller: cubit.passwordController,
                obscureText: cubit.obscureText,
                suffixIcon: cubit.obscureText
                    ? Icon(
                        Icons.visibility,
                        color: AppColors.lightgrey2.withOpacity(0.5),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.lightgrey2.withOpacity(0.5),
                      ),
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles().bodysmallSemibold.copyWith(
                          color: AppColors.lightprimary,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                  title: 'تسجيل دخول',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.formKey.currentState!.save();
                      cubit.signInWithEmailAndPassword(
                        email: cubit.emailController.text,
                        password: cubit.passwordController.text,
                      );
                    } else {
                      setState(() {
                        cubit.autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              const SizedBox(height: 33),
              const DontHavAccount(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialSigninButton(
                text: 'تسجيل بواسطة جوجل',
                image: Assets.assetsImagesGoogleicons,
                onPressed: () {
                  cubit.signInWithGoogle();
                },
              ),
              // SizedBox(height: 16),
              // SocialSigninButton(
              //   text: 'تسجيل بواسطة أبل',
              //   image: Assets.assetsImagesAppleicon,
              //   onPressed: () {},
              // ),
              SizedBox(height: 16),
              SocialSigninButton(
                text: 'تسجيل بواسطة فيسبوك',
                image: Assets.assetsImagesFacbookicons,
                onPressed: () {
                  cubit.signInWithFacebook();
                },
              ),
              SigninBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
