import 'package:flutter/material.dart';
import 'package:fruite_app/core/utils/app_colors.dart';
import 'package:fruite_app/core/utils/app_text_styles.dart';
import 'package:fruite_app/core/widgets/custom_text_form_field.dart';
import 'package:fruite_app/features/check_out/domain/entities/order_entity.dart';
import 'package:provider/provider.dart';

class AddressSection extends StatefulWidget {
  const AddressSection(
      {super.key, required this.formKey, required this.autovalidateMode});
  final GlobalKey<FormState> formKey;
  final ValueNotifier<AutovalidateMode> autovalidateMode;
  @override
  State<AddressSection> createState() => _AddressSectionState();
}

class _AddressSectionState extends State<AddressSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ValueListenableBuilder(
          valueListenable: widget.autovalidateMode,
          builder: (context, value, child) {
            return Form(
              key: widget.formKey,
              autovalidateMode: value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.name = value!;
                    },
                    hintText: 'الاسم الكامل',
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.phone = value!;
                    },
                    hintText: 'رقم الهاتف',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.email = value!;
                    },
                    hintText: 'البريد الاكتروني',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.address = value!;
                    },
                    hintText: ' العنوان',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.city = value!;
                    },
                    hintText: 'المدينة',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                    onSaved: (value) {
                      context.read<OrderEntity>().shipping.addressDetails =
                          value!;
                    },
                    hintText: 'رقم الطابق ,الشقة..',
                    keyboardType: TextInputType.streetAddress,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 0.6,
                        child: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Switch(
                            value:
                                context.read<OrderEntity>().shipping.isDefault,
                            onChanged: (value) {
                              context.read<OrderEntity>().shipping.isDefault =
                                  value;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'حفظ العنوان',
                        style: AppTextStyles().bodysmallSemibold.copyWith(
                              color: AppColors.lightgrey2,
                            ),
                      )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
