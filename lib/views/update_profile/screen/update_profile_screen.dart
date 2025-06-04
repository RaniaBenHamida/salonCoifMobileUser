import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../base/utils/basic_import.dart';
import '../../../base/utils/loader.dart';
import '../../../base/widgets/added/custom_cached_image_widget.dart';
import '../../../base/widgets/added/custom_dialog_widget.dart';
import '../../auth/login/controller/login_controller.dart';
import '../controller/update_profile_controller.dart';
import '../model/profile_info_model.dart';
part 'update_profile_tablet_screen.dart';
part 'update_profile_mobile_screen.dart';
part '../widget/update_profile_widget.dart';
part '../widget/input_field.dart';
part '../widget/button.dart';
part '../widget/delete_button,.dart';


class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobile: UpdateProfileMobileScreen(),
      tablet: UpdateProfileTabletScreen(),
    );
  }
}
