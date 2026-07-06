import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pos/core/app_property/app_properties.dart';
import 'package:flutter_pos/shared/widget/common_widget/widget_animatePage.dart';
import 'package:flutter_pos/features/partner/presentation/widget/partner_form.dart';
import 'package:flutter_pos/features/partner/presentation/widget/partner_header.dart';
import 'package:flutter_pos/features/partner/presentation/widget/partner_list.dart';
import 'package:flutter_pos/core/data_user/data_user_repository_cache.dart';
import 'package:flutter_pos/features/partner/logic/partner_bloc.dart';
import 'package:flutter_pos/features/partner/logic/partner_event.dart';
import 'package:flutter_pos/features/partner/logic/partner_state.dart';
import 'package:flutter_pos/shared/widget/template/dynamic_layout_top_bottom.dart';

class PagePartner extends StatefulWidget {
  const PagePartner({super.key});

  @override
  State<PagePartner> createState() => _PagePartnerState();
}

class _PagePartnerState extends State<PagePartner> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTopBottom(
      layoutTop: layoutTop(),
      layoutBottom: layoutBottom(),
      widgetNavigation: null,
      refreshIndicator: _onRefresh,
      title: "Data Kontak",
      color: context.colorPartner,
      contentAppBar: GestureDetector(
        onTap: () {
          context.read<PartnerBloc>().add(PartnerStatusPartner());
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 123,
          height: 27,
          child: BlocSelector<PartnerBloc, PartnerState, bool>(
            selector: (state) {
              if (state is PartnerLoaded) {
                return state.isCustomer;
              }
              return true;
            },
            builder: (context, state) {
              return WidgetAnimatePage(
                change: state,
                text1: "Pelanggan",
                text2: "Pemasok",
                showAt1: 0,
                showAt2: 13,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget layoutTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 5),
        PartnerHeader(),
        Expanded(child: PartnerList()),
      ],
    );
  }

  Widget layoutBottom() {
    return PartnerForm();
  }

  Future<void> _onRefresh() async {
    await context.read<DataUserRepositoryCache>().initPartner();
    context.read<PartnerBloc>().add(PartnerGetData());
  }
}
