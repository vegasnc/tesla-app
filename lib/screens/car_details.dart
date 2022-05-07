import 'package:flutter/material.dart';
import 'package:tesla_mobile_app_concept/components/components.dart';
import 'package:tesla_mobile_app_concept/screens/screens.dart';

class CarDetail extends StatefulWidget {
  const CarDetail({Key? key}) : super(key: key);

  @override
  State<CarDetail> createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> with TickerProviderStateMixin {
  List<int> activeTabs = [0];
  Color inactiveTabColor = const Color(0xFFA4B0BC);
  late TabController _controller;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void proceed() {
    _controller.animateTo(_selectedIndex += 1);
    setState(() {
      activeTabs.add(_selectedIndex);
    });
  }

  void summary() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CarSummary(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        _controller.index = _selectedIndex;
      });
    });
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                if (_selectedIndex != 0) {
                  setState(() {
                    activeTabs.remove(_selectedIndex);
                  });
                  _controller.animateTo(_selectedIndex -= 1);
                } else {
                  Navigator.pop(context);
                }
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black)),
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              TabHeader(
                activeTabs: activeTabs,
                inactiveTabColor: inactiveTabColor,
                label: '1. Car',
                tabIndex: 0,
              ),
              TabHeader(
                activeTabs: activeTabs,
                inactiveTabColor: inactiveTabColor,
                label: '2. Exterior',
                tabIndex: 1,
              ),
              TabHeader(
                activeTabs: activeTabs,
                inactiveTabColor: inactiveTabColor,
                label: '3. Interior',
                tabIndex: 2,
              ),
              TabHeader(
                activeTabs: activeTabs,
                inactiveTabColor: inactiveTabColor,
                label: '4. Autopilot',
                tabIndex: 3,
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: SizedBox(
              height: 18.55,
              width: 112.0,
              child: Image.asset('assets/images/logo_black.png')),
        ),
        backgroundColor: const Color(0xFFf2F5F8),
        body: TabBarView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              CarOption(onPressed: proceed),
              ExteriorOption(onPressed: proceed),
              InteriorOption(onPressed: proceed),
              AutoPilotOption(onPressed: summary),
            ]),
      ),
    );
  }
}
