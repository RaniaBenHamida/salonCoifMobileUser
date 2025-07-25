part of 'registration_screen.dart';

class RegistrationMobileScreen extends GetView<RegistrationController> {
  RegistrationMobileScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        '',
        backgroundColor: CustomColor.background,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.defaultHorizontalSize.edgeHorizontal,
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
              child: const BrandLogo(),
            ),
            const ReqHeadLineWidget(),
            RegInputWidget(),
            Visibility(
                visible: BasicServices.basicSettingsModel.data.basicSettings.agreePolicy == 1,
                child: const AgreeWidget()),
            const RegButton(),
            const AlreadyAccountWidget(),
          ],
        ),
      ),
    );
  }
}
