import 'package:rcp_dashboard/main_export.dart';
import 'package:rcp_dashboard/src/features/auth/data/auth_service.dart';
import 'package:talker/talker.dart';
import 'package:url_strategy/url_strategy.dart';

final logE = Talker(
  settings: TalkerSettings(),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  setPathUrlStrategy();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await getIt<AuthService>().autoLogin();
  // AuthService.authStatusStream.sink.add(AuthStatus.authenticated);

  runApp(const RCP());
}

class RCP extends StatelessWidget {
  const RCP({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Providers.getBlocProviders(),
      child: BlocBuilder<ThemeLogicCubit, ThemeLogicState>(
        builder: (context, state) {
          return MaterialApp.router(
            themeMode: state.mode,
            darkTheme: ThemeFlex.flexThemeDark(state),
            theme: ThemeFlex.flexThemeLight(state),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            routerConfig: router,
            title: ConfigApp.appName,
          );
        },
      ),
    );
  }
}
