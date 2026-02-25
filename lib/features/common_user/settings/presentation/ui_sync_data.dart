import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/app_property/app_properties.dart';
import 'package:flutter_pos/common_widget/widget_custom_button_icon.dart';
import 'package:flutter_pos/common_widget/widget_custom_text_border.dart';
import 'package:flutter_pos/enum/enum.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_bloc.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_event.dart';
import 'package:flutter_pos/features/common_user/settings/logic/settings_state.dart';
import 'package:flutter_pos/style_and_transition_text/style/style_font_size.dart';

class UiSyncData extends StatelessWidget {
  final ScrollController controller;
  const UiSyncData({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPropertyColor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:
            BlocSelector<
              SettingsBloc,
              SettingsState,
              (Map<ListForDatabase, bool>, bool, double, String)
            >(
              selector: (state) {
                if (state is SettingsSyncDataLoaded) {
                  return (
                    state.dataSyncData,
                    state.isSyncing,
                    state.progress,
                    state.currentStep,
                  );
                }
                return ({}, false, 0, "");
              },
              builder: (context, state) {
                return ListView(
                  controller: controller,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: customTextBorder(
                        "Sinkron Data",
                        lv2TextStyleWhite,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: AppPropertyColor.grey,
                      height: 1,
                      width: double.infinity,
                    ),

                    if (state.$2)
                      Column(
                        children: [
                          LinearProgressIndicator(value: state.$3),
                          const SizedBox(height: 8),
                          Text("Sinkron: ${state.$4}"),
                          customButtonIcon(
                            backgroundColor: AppPropertyColor.white,
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: AppPropertyColor.red,
                            ),
                            label: Text("Batalkan", style: lv05TextStyleBold),
                            onPressed: () {
                              context.read<SettingsBloc>().add(
                                SettingCancelSync(),
                              );
                            },
                          ),
                        ],
                      )
                    else
                      ...ListForDatabase.values.map((syncData) {
                        return CheckboxListTile(
                          dense: true,
                          activeColor: AppPropertyColor.primary,
                          checkboxScaleFactor: 0.8,
                          title: Text(
                            syncData.name.replaceAll("_", " "),
                            style: lv05TextStyle,
                          ),
                          value: state.$1[syncData] ?? false,
                          onChanged: (val) {
                            context.read<SettingsBloc>().add(
                              SettingsSelectedSyncData(
                                selectedData: {...state.$1, syncData: val!},
                              ),
                            );
                          },
                        );
                      }).toList(),

                    const SizedBox(height: 10),
                    customButtonIcon(
                      backgroundColor: AppPropertyColor.primary,
                      icon: const Icon(
                        Icons.download_rounded,
                        color: AppPropertyColor.white,
                      ),
                      label: Text("Ambil Data", style: lv05TextStyleWhite),
                      onPressed: () =>
                          context.read<SettingsBloc>().add(SettingGetData()),
                    ),
                    const SizedBox(height: 10),
                    customButtonIcon(
                      backgroundColor: AppPropertyColor.primary,
                      icon: const Icon(
                        Icons.publish_rounded,
                        color: AppPropertyColor.white,
                      ),
                      label: Text("Kirim Data", style: lv05TextStyleWhite),
                      onPressed: () =>
                          context.read<SettingsBloc>().add(SettingPushData()),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
