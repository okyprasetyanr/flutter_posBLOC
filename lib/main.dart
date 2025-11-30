import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/colors/colors.dart';
import 'package:flutter_pos/connection/authentication_account.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/features/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/transaction/logic/transaction/transaction_bloc.dart';
import 'package:flutter_pos/firebase_options.dart';
import 'package:flutter_pos/routes/routes.dart';
import 'package:flutter_pos/style_and_transition/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition/transition_navigator/transition_up_down.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('firestoreQueue');

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  _listenConnection();

  Workmanager().initialize(callbackDispatcher);
  Workmanager().registerPeriodicTask(
    "1",
    "firestoreWorker",
    frequency: Duration(minutes: 15),
  );

  final dataUserRepo = DataUserRepository();
  final repo = DataUserRepositoryCache(dataUserRepo);

  runApp(
    RepositoryProvider.value(
      value: repo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => InventoryBloc(repo)),
          BlocProvider(create: (context) => TransactionBloc(repo)),
          BlocProvider(create: (context) => PaymentBloc()),
          BlocProvider(create: (context) => PartnerBloc(repo)),
          BlocProvider(create: (context) => BatchBloc(repo)),
          BlocProvider(create: (context) => HistoryTransactionBloc(repo)),
          BlocProvider(create: (context) => ReportBloc(repo)),
          BlocProvider(create: (context) => FinancialBloc(repo)),
          BlocProvider(create: (context) => TransFinancialBloc(repo)),
          BlocProvider(create: (context) => HistoryFinancialBloc(repo)),
          BlocProvider(create: (context) => OperatorBloc(repo)),
        ],
        child: MaterialApp(
          initialRoute: '/login',
          routes: routesPage,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}

void _listenConnection() {
  Connectivity().onConnectivityChanged.listen((
    ConnectivityResult result,
  ) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      debugPrint("Log Main: Internet hidup");
      await FirestoreWorker.processQueueHive();
    }
  });
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    await Hive.openBox('firestoreQueue');

    await FirestoreWorker.processQueueHive();
    debugPrint('Log Main: FirestoreWorker masuk');
    return Future.value(true);
  });
}

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _MainAppState();
}

class _MainAppState extends State<ScreenLogin> {
  bool _obscurePassword = false;
  double? _logoTopPosition;
  bool showForm = false;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _logoTopPosition = 0;

    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() => _logoTopPosition = -150);
    });

    Future.delayed(const Duration(milliseconds: 2800), () {
      setState(() => showForm = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // return
    // StreamBuilder<User?>(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
    //         Nav_slide_up_down_transition(context, MainMenu(), true);
    //       }
    //       );
    //       return SizedBox();
    //     } else {
    return _login();
    //     }git
    //   },
    // );
  }

  Widget _login() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (_logoTopPosition != null)
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                transform: Matrix4.translationValues(0, _logoTopPosition!, 0),
                curve: Curves.easeOut,
                child: Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),

          AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: showForm ? 1.0 : 0.0,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 220),
                                Text("Aplikasi POS", style: titleTextStyle),
                                const SizedBox(height: 10),
                                Material(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  elevation: 2,
                                  shadowColor: Colors.black,
                                  child: TextField(
                                    controller: emailcontroller,
                                    decoration: InputDecoration(
                                      labelText: 'Username:',
                                      labelStyle: labelTextStyle,
                                      hintText: 'Username...',
                                      hintStyle: hintTextStyle,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(100),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(100),
                                      ),
                                      elevation: 2,
                                      shadowColor: Colors.black,
                                      child: TextField(
                                        controller: passcontroller,
                                        obscureText: _obscurePassword,
                                        decoration: InputDecoration(
                                          labelText: 'Password:',
                                          labelStyle: labelTextStyle,
                                          hintText: 'Password...',
                                          hintStyle: hintTextStyle,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _obscurePassword =
                                                    !_obscurePassword;
                                              });
                                            },
                                            icon: Icon(
                                              _obscurePassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 10,
                                  ),
                                  onPressed: () {
                                    authenticatorAcoount(
                                      email: "demo@gmail.com",
                                      password: "12345678",
                                      context: context,
                                    );
                                  },
                                  child: Text('Login', style: buttonTextStyle),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primary,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30,
                                      vertical: 10,
                                    ),
                                    shadowColor: Colors.black,
                                    elevation: 10,
                                  ),
                                  onPressed: () {
                                    navUpDownTransition(
                                      context,
                                      '/sign-up',
                                      false,
                                    );
                                  },
                                  child: Text(
                                    'Sign-Up',
                                    style: buttonTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
