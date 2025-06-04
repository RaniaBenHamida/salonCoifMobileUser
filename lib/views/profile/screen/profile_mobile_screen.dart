part of 'profile_screen.dart';

class ProfileMobileScreen extends GetView<ProfileController> {
  const ProfileMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        Strings.profile,
        showBackButton: false,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        color: CustomColor.primary,
        onRefresh: () async {},
        child: CustomScrollView(
          /// wrap with SliverToBoxAdapter() in every child in slivers
          slivers: [
            SliverToBoxAdapter(child: NavProfileWidget()),
            // SliverToBoxAdapter(child: Buttons()),
            // SliverToBoxAdapter(child: SalonInfo()),
            SliverToBoxAdapter(child: ListTiles()),
          ],
        ),
      ),
    );
  }
}
