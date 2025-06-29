import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/widgets/custom_button.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/auth/presentation/cubit/signup_cubit/signup_cubit.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/have_an_account.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/signup_view_body_bloc_listener.dart';
import 'package:fruite_app/features/auth/presentation/view/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 24.0,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.name),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: AppColors.lightgrey2.withOpacity(0.5),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              TermsAndConditions(),
              SizedBox(
                height: 30.0,
              ),
              CustomButton(
                  title: 'إنشاء حساب جديد',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            name: name,
                            password: password,
                          );
                      // Handle signup logic here
                      // For example, call a signup function from a cubit or bloc
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
              SizedBox(
                height: 26.0,
              ),
              HaveAnAccount(),
              SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
