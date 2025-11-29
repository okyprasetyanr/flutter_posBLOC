import 'package:flutter_pos/model_data/model_operator.dart';
import 'package:flutter_riverpod/legacy.dart';

final permissionProvider =
    StateNotifierProvider<PermissionNotifier, Map<Permission, bool>>(
      (ref) => PermissionNotifier(),
    );

class PermissionNotifier extends StateNotifier<Map<Permission, bool>> {
  PermissionNotifier()
    : super({
        for (var permission in Permission.values) permission: permission.status,
      });

  void toggle(Permission permission) {
    final current = state[permission] ?? false;
    state = {...state, permission: !current};
    permission.status = !current;
  }
}
