import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing/providers/page_provider.dart';
import 'package:vertical_landing/ui/shared/custom_app_menu.dart';
import 'package:vertical_landing/ui/views/about_view.dart';
import 'package:vertical_landing/ui/views/contact_view.dart';
import 'package:vertical_landing/ui/views/home_view.dart';
import 'package:vertical_landing/ui/views/location_view.dart';
import 'package:vertical_landing/ui/views/pricing_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            _HomeBody(),
            Positioned(right: 20, top: 20, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.deepPurple,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      controller: pageProvider.scrollController,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
