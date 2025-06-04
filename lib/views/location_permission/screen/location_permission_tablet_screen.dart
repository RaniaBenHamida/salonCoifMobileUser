part of 'location_permission_screen.dart';

class LocationPermissionTabletScreen extends GetView<LocationPermissionController> {
  const LocationPermissionTabletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('LocationPermission Tablet Screen'),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [],
      ),
    );
  }
}
