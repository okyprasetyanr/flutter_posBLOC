import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button.dart';
import 'package:flutter_pos/connection/authentication_account.dart';
import 'package:flutter_pos/connection/firestore_worker.dart';
import 'package:flutter_pos/features/common_user/main_menu/logic/main_menu_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/printer/printer_event.dart';
import 'package:flutter_pos/features/data_user/data_user_repository.dart';
import 'package:flutter_pos/features/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/hive_setup/transaction_saved_hive_adapter.dart';
import 'package:flutter_pos/firebase_options.dart';
import 'package:flutter_pos/function/printer/service_printer.dart';
import 'package:flutter_pos/features/hive_setup/model_transaction_save.dart';
import 'package:flutter_pos/routes/routes.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';
import 'package:flutter_pos/style_and_transition_text/transition_navigator/transition_up_down.dart';
import 'package:flutter_pos/common_widget/widget_custom_spin_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_pos/features/common_user/batch/logic/batch_bloc.dart';
import 'package:flutter_pos/features/common_user/financial/logic/financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_financial/logic/history_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/history_transaction/logic/history_transaction_bloc.dart';
import 'package:flutter_pos/features/common_user/inventory/logic/inventory_bloc.dart';
import 'package:flutter_pos/features/common_user/operator/logic/operator_bloc.dart';
import 'package:flutter_pos/features/common_user/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/common_user/report/logic/report_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/financial/transaction_financial_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/payment/payment_bloc.dart';
import 'package:flutter_pos/features/common_user/transaction/logic/transaction/transaction_bloc.dart';

final DataUserRepository dataUserRepo = DataUserRepository();
final DataUserRepositoryCache repo = DataUserRepositoryCache(dataUserRepo);
final ServicePrinter? printService = kIsWeb ? null : ServicePrinter();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionSavedHiveAdapter());
  await Hive.openBox('firestoreQueue');
  await Hive.openBox<TransactionSavedHive>('saved_transaction');
  if (!kIsWeb) {
    Workmanager().initialize(callbackDispatcher);
    Workmanager().registerPeriodicTask(
      "1",
      "firestoreWorker",
      frequency: Duration(minutes: 15),
    );
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InventoryBloc(repo)),
        BlocProvider(create: (_) => TransactionBloc(repo)),
        BlocProvider(create: (_) => PaymentBloc(repo)),
        BlocProvider(create: (_) => PartnerBloc(repo)),
        BlocProvider(create: (_) => BatchBloc(repo)),
        BlocProvider(create: (_) => HistoryTransactionBloc(repo)),
        BlocProvider(create: (_) => ReportBloc(repo)),
        BlocProvider(create: (_) => FinancialBloc(repo)),
        BlocProvider(create: (_) => TransFinancialBloc(repo)),
        BlocProvider(create: (_) => HistoryFinancialBloc(repo)),
        BlocProvider(create: (_) => OperatorBloc(repo)),
        BlocProvider(create: (_) => DataReportBloc(repo)),
        BlocProvider(
          lazy: false,
          create: (_) => PrinterBloc(ServicePrinter())..add(InitPrinter()),
        ),

        if (!kIsWeb) BlocProvider(create: (_) => SettingsBloc(repo)),
      ],
      child: RepositoryProvider.value(
        value: repo,
        child: MaterialApp(
          initialRoute: '/login',
          routes: routesPage,
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Hive.initFlutter();
    Hive.registerAdapter(TransactionSavedHiveAdapter());

    await Hive.openBox('firestoreQueue');
    await Hive.openBox<TransactionSavedHive>('saved_transaction');
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
  final _obscurePassword = ValueNotifier<bool>(false);
  final _logoTopPosition = ValueNotifier<double>(0);
  final showForm = ValueNotifier<bool>(false);
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

    Future.delayed(const Duration(milliseconds: 2000), () {
      _logoTopPosition.value = -150;
    });

    Future.delayed(const Duration(milliseconds: 2800), () {
      showForm.value = true;
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
    //     }
    //   },
    // );
  }

  Widget _login() {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: _logoTopPosition,
            builder: (context, value, child) => Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 800),
                transform: Matrix4.translationValues(0, value, 0),
                curve: Curves.easeOut,
                child: Image.asset(
                  'assets/logo.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: showForm,
            builder: (context, value, child) => AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: value ? 1.0 : 0.0,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
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
                            "Masuk",
                            style: GoogleFonts.poppins(
                              color: AppPropertyColor.black,
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
                                  const SizedBox(height: 150),
                                  Text(
                                    AppPropertyText.AppName,
                                    style: titleTextStyle,
                                  ),
                                  const SizedBox(height: 10),
                                  Material(
                                    color: AppPropertyColor.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(18),
                                    ),
                                    elevation: 2,
                                    shadowColor: AppPropertyColor.black,
                                    child: TextField(
                                      style: lv1TextStyle,
                                      controller: emailcontroller,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                        labelText: "Email Pengguna",
                                        labelStyle: lv1TextStyle,
                                        hintText: "Email Pengguna...",
                                        hintStyle: lv1TextStyle,
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Material(
                                        color: AppPropertyColor.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(18),
                                        ),
                                        elevation: 2,
                                        shadowColor: AppPropertyColor.black,
                                        child: ValueListenableBuilder(
                                          valueListenable: _obscurePassword,
                                          builder: (context, value, child) =>
                                              TextField(
                                                style: lv1TextStyle,
                                                controller: passcontroller,
                                                obscureText:
                                                    _obscurePassword.value,
                                                decoration: InputDecoration(
                                                  labelText: 'Kata Sandi:',
                                                  labelStyle: lv1TextStyle,
                                                  hintText: 'Kata Sandi...',
                                                  hintStyle: lv1TextStyle,
                                                  floatingLabelBehavior:
                                                      FloatingLabelBehavior
                                                          .always,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                          Radius.circular(14),
                                                        ),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _obscurePassword.value =
                                                            !value;
                                                      });
                                                    },
                                                    icon: Icon(
                                                      value
                                                          ? Icons.visibility
                                                          : Icons
                                                                .visibility_off,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      customButton(
                                        backgroundColor:
                                            AppPropertyColor.primary,
                                        child: Text(
                                          "Masuk",
                                          style: lv2TextStyleWhite,
                                        ),
                                        onPressed: () async {
                                          showDialog(
                                            context: context,
                                            builder: (context) => Center(
                                              child: customSpinKit(
                                                color: AppPropertyColor.white,
                                                size: 30,
                                              ),
                                            ),
                                          );
                                          final result =
                                              await authenticatorAccount(
                                                email: "demo@gmail.com",
                                                password: "123456",
                                                context: context,
                                                signup: false,
                                              );
                                          if (result != null) {
                                            if (mounted) {
                                              navUpDownTransition(
                                                context,
                                                '/mainmenu',
                                                true,
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      customButton(
                                        backgroundColor:
                                            AppPropertyColor.primary,
                                        child: Text(
                                          "Daftar",
                                          style: lv2TextStyleWhite,
                                        ),
                                        onPressed: () {
                                          navUpDownTransition(
                                            context,
                                            '/sign-up',
                                            false,
                                          );
                                        },
                                      ),
                                    ],
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
          ),
        ],
      ),
    );
  }
}
