import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'app/modules/pages/not_found/bindings/not_found_binding.dart';
import 'app/modules/pages/not_found/views/not_found_view.dart';
import 'helper/services/navigation_service.dart';
import 'helper/storage/local_storage.dart';
import 'helper/theme/app_notifier.dart';
import 'helper/theme/app_style.dart';
import 'helper/theme/theme_customizer.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'app/routes/app_pages.dart';
import 'themes/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await LocalStorage.init();
  AppStyle.init();
  await ThemeCustomizer.init();
  runApp(ChangeNotifierProvider<AppNotifier>(create: (_) => AppNotifier(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (_, _, _) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeCustomizer.instance.theme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: (BuildContext context, Widget? child) {
            NavigationService.registerContext(context);
            return Directionality(textDirection: AppTheme.textDirection, child: child ?? Container());
          },
          localizationsDelegates: FlutterQuillLocalizations.localizationsDelegates,
          unknownRoute: GetPage<Object>(name: Routes.NOT_FOUND, page: () => const NotFoundView(), binding: NotFoundBinding()),
        );
      },
    );
  }
}
