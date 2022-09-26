import 'package:flutter/material.dart';
import 'package:hesperis_tamuda/views/provider/locale_provider.dart';
import 'package:provider/provider.dart';
import 'package:flag/flag.dart';
class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final Locale locale=provider.locale;

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            return DropdownMenuItem(
              child: Center(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flag.fromCode(
                      flag,
                      height: 30,
                      width: 45,
                      fit: BoxFit.contain,
                      replacement: const SizedBox.shrink(),
                    ),
                  ],
                 ),
                
              ),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {},
      ),
    );
  }
}