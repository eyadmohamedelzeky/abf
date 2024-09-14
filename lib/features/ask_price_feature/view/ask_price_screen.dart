import 'package:abf_ather/core/colors/app_colors.dart';
import 'package:abf_ather/core/widgets/csutom_text_form_field.dart';
import 'package:abf_ather/core/widgets/custom_button.dart';
import 'package:abf_ather/core/widgets/custom_text.dart';
import 'package:abf_ather/features/ask_price_feature/controller/ask_price_controller.dart';
import 'package:abf_ather/features/ask_price_feature/controller/ask_price_state.dart';
import 'package:abf_ather/features/ask_price_feature/model/ask_price_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskPriceScreen extends StatefulWidget {
  const AskPriceScreen({super.key});
  static const String id = "AskPriceScreen";
  @override
  State<AskPriceScreen> createState() => _AskPriceScreenState();
}

class _AskPriceScreenState extends State<AskPriceScreen> {
  @override
  void initState() {
    AskPriceController.get(context).askPriceDropDown();
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: BlocConsumer<AskPriceController, AskPriceState>(
            listener: (context, state) {},
            builder: (context, state) {
              final askPriceController = AskPriceController.get(context);
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.buttonColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            CustomText(
                              text: 'طلب عرض سعر',
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomText(
                          text: 'يمكنك إرسال طلب عرض سعر خاص',
                          color: AppColors.greyColor,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 20.h),
                          hintText: 'الاسم الأول',
                          controller:
                              askPriceController.fnForAskPriceController,
                          validator: (fn) {
                            if (fn!.isEmpty) {
                              return 'الرجاء ادخال الاسم الأول';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            hintText: 'الاسم الأخير',
                            controller:
                                askPriceController.lnForAskPriceController,
                            validator: (ln) {
                              if (ln!.isEmpty) {
                                return 'الرجاء ادخال الاسم الأخير';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 20.h),
                            hintText: 'البريد الإلكتروني',
                            controller:
                                askPriceController.emailForAskPriceController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'الرجاء ادخال البريد الإلكتروني';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 20.h,
                          ),
                          hintText: 'رقم الجوال',
                          controller:
                              askPriceController.phoneForAskPriceController,
                          validator: (phone) {
                            if (phone!.isEmpty) {
                              return 'الرجاء ادخال رقم الجوال';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        DropdownButtonFormField<String>(
                          validator: (dropDown) {
                            if (dropDown == null || dropDown.isEmpty) {
                              return 'برجاء تحديد القيمة المطلوبة';
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hint: const Text(
                              'أعمال الصيانة - أعمال الـDUCT - المشاريع - المنتجات'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.h, vertical: 30.h),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.grey.shade300,
                          ),
                          items: askPriceController
                              .askPriceCategoriesResponse.data
                              ?.map<DropdownMenuItem<String>>(
                                  (e) => DropdownMenuItem<String>(
                                        value: e.id.toString(),
                                        child: Text(e.name!),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            askPriceController.changeAskPriceDropDown(value);
                          },
                          dropdownColor: Colors.white,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 60.h),
                            hintText: ' نص الرسالة',
                            controller:
                                askPriceController.messageForAskPriceController,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return 'الرجاء ادخال نص الرسالة ';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 50.h,
                        ),
                        state is AskPriceRequestLoading
                            ? const CircularProgressIndicator()
                            : CustomButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await askPriceController.askPrice(
                                      request: AskPriceRequest(
                                          categoryId: askPriceController
                                              .selectValueForDropDown,
                                          fName: askPriceController
                                              .fnForAskPriceController.text,
                                          lName: askPriceController
                                              .lnForAskPriceController.text,
                                          email: askPriceController
                                              .emailForAskPriceController.text,
                                          phone: askPriceController
                                              .phoneForAskPriceController.text,
                                          message: askPriceController
                                              .messageForAskPriceController
                                              .text),
                                    );
                                  }
                                },
                                text: 'إرسال الطلب')
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
