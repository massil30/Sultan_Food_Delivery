import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sultan_admin/shared/theme/light_theme.dart';
import 'package:sultan_admin/shared/theme/dark_theme.dart';
import 'package:sultan_admin/shared/components/button.dart';
import 'package:sultan_admin/shared/components/container_reusable.dart';
import 'package:sultan_admin/shared/components/text_field.dart';
import 'package:sultan_admin/shared/components/list.dart';
import 'package:sultan_admin/shared/components/dialog.dart';
import 'package:sultan_admin/shared/components/toast_message.dart';
import 'package:sultan_admin/shared/theme/theme.dart';
import 'package:sultan_admin/utils/extensions/spacing_extension.dart';
import 'package:sultan_admin/utils/extensions/color_extension.dart';
import 'package:sultan_admin/utils/extensions/text_extension.dart';


// ============================================
// 4. UPDATED THEME SHOWCASE PAGE
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeToggleButton extends ConsumerWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider); // current theme

    final isDark = themeMode == ThemeMode.dark;

    return IconButton(
      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
      onPressed: () {
        // Access setTheme directly
        final notifier = ref.read(themeProvider.notifier);

        // Toggle theme example
        if (themeMode == ThemeMode.light) {
          notifier.setTheme(ThemeMode.dark);
        }  else {
          notifier.setTheme(ThemeMode.light);
        }
      },
    );
  }
}



class ThemeShowcasePage extends StatelessWidget {
  const ThemeShowcasePage({super.key});

  @override
  Widget build(BuildContext ctx,  ) {

   
        return  Scaffold(
              appBar: AppBar(
                title: const Text('Theme Showcase'),
                backgroundColor: ctx.c_primary,
        
                actions: [
                  // Use the new ThemeToggleButton with labels
                  const ThemeToggleButton(),
                  SizedBox(width: ctx.s8),
                ],
              ),
              backgroundColor: ctx.c_background,
              body: SingleChildScrollView(
                padding: ctx.pa16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section: Buttons
                    Text('Buttons', style: ctx.h2),
                    SizedBox(height: ctx.v12),
                    Wrap(
                      spacing: ctx.s12,
                      runSpacing: ctx.v12,
                      children: [
                        AppButton(label: 'Primary', onPressed: () {}),
                        AppButton(label: 'Loading', loading: true, onPressed: () {}),
                        AppOutlinedButton(label: 'Outlined', onPressed: () {}),
                        AppOutlinedButton(label: 'Full width', fullWidth: true, onPressed: () {}),
                      ],
                    ),
                    SizedBox(height: ctx.v24),

                    // Section: Inputs
                    Text('Inputs', style: ctx.h2),
                    SizedBox(height: ctx.v12),
                    ReusableTextField(hint: 'Normal input', onChanged: (v) {}),
                    SizedBox(height: ctx.v12),
                    ReusableTextField(hint: 'Disabled input', enabled: false),
                    SizedBox(height: ctx.v24),

                    // Section: Cards / Containers
                    Text('Container / Card', style: ctx.h2),
                    SizedBox(height: ctx.v12),
                    ContainerReusable(
                      padding: EdgeInsets.all(12.r),
                      borderRadius: 12.r,
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('A reusable card', style: ctx.h3),
                          SizedBox(height: ctx.v8),
                          Text('Uses theme surface/background/colors', style: ctx.bodySmall),
                          SizedBox(height: ctx.v8),
                          Row(
                            children: [
                              AppButton(label: 'Action', onPressed: () {}),
                              SizedBox(width: ctx.s8),
                              AppOutlinedButton(label: 'More', onPressed: () {}),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: ctx.v24),

                    // Section: List item
                    Text('List Item', style: ctx.h2),
                    SizedBox(height: ctx.v12),
                    ReusableListItem(
                      leading: CircleAvatar(
                        backgroundColor: ctx.c_primary,
                        child: const Icon(Icons.person),
                      ),
                      title: 'List item title',
                      subtitle: 'Subtitle text',
                      trailing: Icon(Icons.chevron_right, color: ctx.c_textPrimary),
                      onTap: () => showToast(
                        'Tapped list item',
                        backgroundColor: ctx.c_primary,
                        textColor: ctx.c_textPrimary,
                      ),
                    ),
                    SizedBox(height: ctx.v24),

                    // Section: Dialogs & Toast
                    Text('Dialogs & Toast', style: ctx.h2),
                    SizedBox(height: ctx.v12),
                    Wrap(spacing: ctx.s8, children: [
                      AppButton(
                        label: 'Show Info Dialog',
                        onPressed: () => showInfoDialog(
                          ctx,
                          title: 'Info',
                          content: 'This is an informational dialog.',
                        ),
                      ),
                      AppButton(
                        label: 'Show Confirm',
                        onPressed: () async {
                          final res = await showConfirmDialog(
                            ctx,
                            title: 'Confirm',
                            content: 'Proceed with action?',
                          );
                          showToast(
                            'Confirm result: $res',
                            backgroundColor: ctx.c_primary,
                            textColor: ctx.c_textPrimary,
                          );
                        },
                      ),
                      AppOutlinedButton(
                        label: 'Show Error',
                        onPressed: () => showErrorDialog(
                          ctx,
                          title: 'Error',
                          content: 'Something went wrong',
                        ),
                      ),
                      AppOutlinedButton(
                        label: 'Toast',
                        onPressed: () => showToast(
                          'Hello toast',
                          backgroundColor: ctx.c_primary,
                          textColor: ctx.c_textPrimary,
                        ),
                      ),
                    ]),

                    SizedBox(height: ctx.v32),
                    Center(child: Text('End of preview', style: ctx.caption)),
                    SizedBox(height: ctx.v48),
                  ],
                ),
             
              ));
          }}

    