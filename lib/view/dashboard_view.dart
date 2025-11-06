
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:myapp/view/approval_view.dart';
import 'package:myapp/view/reports_view.dart';
import 'package:myapp/view/settings_view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isLocationEnabled = true;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ApprovalScreen(),
    const ReportsView(),
    const SettingsView(),
  ];

  @override
  void initState() {
    super.initState();
    _checkLocationStatus();
  }

  Future<void> _checkLocationStatus() async {
    final status = await Geolocator.isLocationServiceEnabled();
    setState(() {
      _isLocationEnabled = status;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context,
          List<ConnectivityResult> connectivity, Widget child) {
        final bool connected = connectivity.contains(ConnectivityResult.mobile) ||
            connectivity.contains(ConnectivityResult.wifi);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF008080),
            title:
                Text(_getAppBarTitle(), style: const TextStyle(color: Colors.white)),
            leading: _selectedIndex != 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                  )
                : null,
            bottom: !connected || !_isLocationEnabled
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(40.0),
                    child: Column(
                      children: [
                        if (!connected)
                          Container(
                            color: Colors.amber,
                            width: double.infinity,
                            padding: const EdgeInsets.all(8.0),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.warning, color: Colors.black, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'No internet connection. Please check your network.',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        if (!_isLocationEnabled)
                          GestureDetector(
                            onTap: () async {
                              await Geolocator.openLocationSettings();
                            },
                            child: Container(
                              color: Colors.red,
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_off,
                                      color: Colors.white, size: 20),
                                  SizedBox(width: 8),
                                  Text(
                                    'Your location is off. Please turn it on.',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
                : null,
          ),
          body: _screens[_selectedIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: const Color(0xFF008080),
                  color: Colors.black,
                  tabs: const [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.approval,
                      text: 'Approval',
                    ),
                    GButton(
                      icon: Icons.bar_chart,
                      text: 'Reports',
                    ),
                    GButton(
                      icon: Icons.settings,
                      text: 'Settings',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: _onItemTapped,
                ),
              ),
            ),
          ),
        );
      },
      child: const Center(child: Text('No internet connection')),
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Approval List';
      case 2:
        return 'Reports';
      case 3:
        return 'Settings';
      default:
        return 'Dashboard';
    }
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008080),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: <Widget>[
            _buildTimeCard('Punch In', '08:30 AM'),
            _buildTimeCard('Punch Out', '05:30 PM'),
            _buildIconCard(context, 'Attendance', Icons.calendar_today),
            _buildIconCard(context, 'Providers', Icons.people_outline),
            _buildIconCard(context, 'Tour Plan', Icons.location_on_outlined),
            _buildIconCard(context, 'Checklist', Icons.playlist_add_check),
            _buildIconCard(context, 'Providers', Icons.list_alt),
            _buildIconCard(context, 'Training', Icons.model_training),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeCard(String title, String time) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCard(BuildContext context, String title, IconData icon) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: const Color(0xFF008080)),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
