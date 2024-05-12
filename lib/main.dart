import 'package:accompani_bloc/core/cubits/app_user/app_user_cubit.dart';
import 'package:accompani_bloc/core/theme/theme.dart';
import 'package:accompani_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:accompani_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:accompani_bloc/features/profile_process/index.dart';
import 'package:accompani_bloc/features/profile_process/index_bloc.dart';
import 'package:accompani_bloc/features/welcome/welcome.dart';
import 'package:accompani_bloc/init_dependencies.dart';
import 'package:accompani_bloc/nav_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<ProfileProcessBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(
          AuthIsUserLoggedIn(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Accompani',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn || state is AppUserLoggedIn2;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return NavMenu();
          }
          return const WelcomeScreen();
        },
      ),
    );
  }
}
