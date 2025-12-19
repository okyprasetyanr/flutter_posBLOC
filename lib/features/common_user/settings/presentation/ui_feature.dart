import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/colors.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/icon_size.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiFeature extends StatelessWidget {
  final ScrollController controller;
  const UiFeature({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          controller: controller,
          children: [
            Center(child: Text("Fitur", style: titleTextStyle)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("FIFO", style: lv1TextStyleBold),
                BlocSelector<SettingsBloc, SettingsState, bool>(
                  selector: (state) {
                    if (state is SettingsFeatureLoaded) {
                      return state.isFifo;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        context.read<SettingsBloc>().add(SettingsFeatureFIFO());
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: 100,
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: state
                              ? AppPropertyColor.primary
                              : Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: (state ? Colors.black : Colors.green)
                                  .withValues(alpha: 0.4),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                              curve: Curves.easeInOut,
                              left: state ? -50 : 5,
                              top: 1,
                              duration: Duration(milliseconds: 500),
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                size: lv2IconSize,
                              ),
                            ),
                            AnimatedPositioned(
                              curve: Curves.easeInOut,
                              left: state ? 75 : 150,
                              top: 1,
                              duration: Duration(milliseconds: 500),
                              child: Icon(
                                Icons.check_circle_outline_rounded,
                                size: lv2IconSize,
                                color: Colors.white,
                              ),
                            ),
                            AnimatedPositioned(
                              curve: Curves.easeInOut,
                              top: 3,
                              left: state ? -100 : 33,
                              duration: Duration(milliseconds: 500),
                              child: Text("Nonaktif", style: lv05TextStyle),
                            ),
                            AnimatedPositioned(
                              curve: Curves.easeInOut,
                              left: state ? 10 : 150,
                              top: 3,
                              duration: Duration(milliseconds: 500),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("Aktif", style: lv05TextStyleWhite),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
