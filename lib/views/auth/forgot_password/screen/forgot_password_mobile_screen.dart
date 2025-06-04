part of 'forgot_password_screen.dart';

class ForgotPasswordMobileScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordMobileScreen({super.key});
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
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          ForgotPasswordHeading(),
          ForgotPasswordInput(
          ),
        ],
      ),
    );
  }
}
