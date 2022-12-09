import 'package:e_commerce_app/core/utils/app_asstes_path.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:e_commerce_app/core/utils/media_query_values.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/cubit.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/state.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_string.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/textFormFiled.dart';

class LoginScreen extends StatelessWidget {
  final Animation<double>? transitionAnimation;
  const LoginScreen({
    super.key,
    this.transitionAnimation,
  });
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LoginLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is RegisterLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutErrorState) {
          debugPrint('${AppString.messageError} ${state.exception.message}');
          // debugPrint('${state.status}');
        }
        if (state is LogoutLoadedState) {
          debugPrint('${AppString.messageSuccess} ${state.message}');
          // debugPrint('${state.status}');
        }
      },
      builder: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: AppColors.primaryColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        );
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(ellipse21),
                  ),
                  const CircleAvatar(
                    backgroundColor: Color.fromRGBO(250, 184, 195, 1),
                    radius: 25,
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.primaryColor,
            elevation: 0,
          ),
          body: AnimatedBuilder(
            animation: transitionAnimation!,
            builder: (context, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: const Offset(1, 0), end: const Offset(0, 0))
                    .animate(transitionAnimation!),
                child: child,
              );
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomText(
                    text: AppString.welcomeBack,
                    size: 35.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(
                    height: 30.sp,
                    child: Padding(
                      padding: const EdgeInsets.only(right: AppPadding.p16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image(
                            image: AssetImage(ellipse20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.height / 200,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: context.height,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppSize.s20),
                                topRight: Radius.circular(AppSize.s20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(AppPadding.p30),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomText(
                                      text: AppString.login,
                                      size: AppSize.s18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.03,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(emailIcons),
                                        SizedBox(
                                          width: context.width / 45,
                                        ),
                                        CustomText(
                                          text: AppString.Email,
                                          size: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.height / 200,
                                    ),
                                    defaultTextFormField(
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      hintText: AppString.hintEmail,
                                      hintStyle: TextStyle(
                                        color: AppColors.balckColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      validate: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                                                .hasMatch(value)) {
                                          return AppString.textError;
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: context.height / 30,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(lockIcons),
                                        SizedBox(
                                          width: context.width / 45,
                                        ),
                                        CustomText(
                                          text: AppString.Password,
                                          size: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.height / 200,
                                    ),
                                    defaultTextFormField(
                                      isPassword:
                                          AuthCubit.get(context).isPassword,
                                      suffixPressed: () {
                                        AuthCubit.get(context)
                                            .changePasswordVisibility();
                                      },
                                      controller: passwordController,
                                      hintText: '********',
                                      hintStyle: TextStyle(
                                        color: AppColors.balckColor,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 1,
                                      suffix: AuthCubit.get(context).suffix,
                                    ),
                                    SizedBox(
                                      height: context.height / 50,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: CustomText(
                                        text: AppString.fotgotPassword,
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        size: 10.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: context.height / 10,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          CustomButton(
                                            text: AppString.login,
                                            color: AppColors.primaryColor,
                                            textColor: AppColors.whiteColor,
                                            onTap: () {
                                              if (formKey.currentState!
                                                  .validate()) {}
                                            },
                                          ),
                                          SizedBox(
                                            height: context.height / 50,
                                          ),
                                          CustomText(
                                            text: AppString.createAccount,
                                            color: AppColors.primaryColor,
                                            size: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
