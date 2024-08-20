import 'package:rcp_dashboard/main_export.dart';
import 'package:talker/talker.dart';

final logE = Talker(
  settings: TalkerSettings(),
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDi();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
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
