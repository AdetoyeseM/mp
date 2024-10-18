import 'package:flutter/material.dart';
import 'package:madetoyese_assessment_mp/views/reusable_widgets/constants/extensions.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
                controller: TextEditingController(text: 'Saint Petersburg'),
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colorScheme.onSurface,
                ),
                decoration: InputDecoration(
                  fillColor: context.colorScheme.surface,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
             
                  prefixIconConstraints: const BoxConstraints(
                    minWidth: 45,
                    minHeight: 30,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              );
  }
}