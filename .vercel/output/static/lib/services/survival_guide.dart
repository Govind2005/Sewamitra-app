import 'package:flutter/material.dart';

class SurvivalGuidePage extends StatelessWidget {
  const SurvivalGuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disaster Survival Guide'),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.blue.shade50],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Be Prepared for Any Disaster',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tap on a card to learn more about survival techniques',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      DisasterCard(
                        title: 'Cyclone',
                        icon: Icons.cyclone,
                        color: Color(0xFF1565C0),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Check the house for repairs',
                            'Switch off the electrical mains',
                            'Remove dead branches or dying trees',
                            'Keep your mobile phones charged for emergency communication',
                            'Listen to radio, watch TV, read newspapers for weather updates',
                            'Keep your documents and valuables in water-proof containers',
                            'Prepare an emergency kit with essential items for safety'
                          ],
                          donts: [
                            'Do not venture out',
                            'Do not enter damaged building',
                            'Do not go near flooded area'
                          ],
                          beforeTips: [
                            'Ignore rumors, Stay calm, Don\'t panic',
                            'Keep your mobile phones charged for emergency communication, use SMS',
                            'Listen to radio, watch TV, read newspapers for weather updates',
                            'Keep your documents and valuables in water-proof containers',
                            'Try staying in an inner room, keep movable items securely tied',
                            'Prepare an emergency kit with essential items for safety',
                            'Secure your house, especially the roof; carry out repairs, don tie sharp objects loose',
                            'Keep cattle/animals untied to ensure their safety',
                            'In case of a storm surge/tide warning, or flooding, know your nearest high ground/safe shelter and the safest access route to it',
                            'Store adequate ready-to-eat food and water to last at least a week',
                            'Conduct mock drills for your family and children',
                            'Cut trees and branches near your house with permission from the local authority'
                          ],
                          duringTipsIndoor: [
                            'Switch off electrical mains, unplug all electrical appliances and gas connection',
                            'Keep doors and windows shut',
                            'If your house is unsafe, leave early before the onset of a cyclone. Reach a safe shelter',
                            'Listen to radio; rely only on official warnings',
                            'Drink boiled/chlorinated water',
                            'If the building starts to collapse, protect yourself with mattresses, rugs or blankets, or by getting under a strong table or bench or by holding fast onto a solid fixture, such as a water pipe'
                          ],
                          duringTipsOutdoor: [
                            'Do not enter damaged buildings',
                            'Seek a safe shelter as soon as possible',
                            'Never stand under a tree, electric pole',
                            'Beware the calm \'eye\'. If the wind drops, don\'t assume the cyclone is over; violent winds may soon resume from another direction'
                          ],
                          afterTips: [
                            'Drink boiled/chlorinated water',
                            'Do not go out until officially advised; it is unsafe to go outside',
                            'Watch out for broken electric poles and loose wires, and other sharp objects',
                            'Do not enter damaged buildings',
                            'Do not use damaged electrical equipment. Get them checked by an electrician first'
                          ],
                          specialGroupTips: {
                            'Fishermen should': [
                              'Ignore rumors, Stay calm, Don\'t panic',
                              'Keep mobile phones charged for emergency communication, use SMS',
                              'Write down important numbers on a paper and keep it safely',
                              'Keep a radio set with extra batteries handy',
                              'Listen to radio, watch TV, read newspapers for weather updates',
                              'Keep boats/rafts tied up in a safe place',
                              'Don\'t venture out in the sea'
                            ]
                          },
                        ),
                      ),
                      DisasterCard(
                        title: 'Earthquake',
                        icon: Icons.vibration,
                        color: Color(0xFF0D47A1),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Drop, cover, and hold on',
                            'Stay away from windows and furniture that may fall',
                            'If outdoors, stay in an open area away from buildings',
                            'If in a vehicle, pull over and stay inside'
                          ],
                          donts: [
                            'Don\'t run outside during shaking',
                            'Don\'t use elevators',
                            'Don\'t stand in doorways (modern doorways are no stronger than any other part of the house)'
                          ],
                          beforeTips: [
                            'Secure heavy furniture to walls',
                            'Know where and how to shut off utilities',
                            'Keep emergency supplies ready',
                            'Identify safe spots in each room (under sturdy tables, against inside walls)',
                            'Have a family emergency plan and practice it'
                          ],
                          duringTipsIndoor: [
                            'Drop to the ground before the earthquake drops you',
                            'Take cover under a sturdy table or desk',
                            'Hold on until the shaking stops',
                            'Stay away from glass, windows, outside doors, and walls',
                            'Stay in bed if you are there when the earthquake strikes, protect your head with a pillow'
                          ],
                          duringTipsOutdoor: [
                            'Stay away from buildings, streetlights, and utility wires',
                            'Once in the open, stay there until the shaking stops',
                            'If you\'re in a vehicle, stop as quickly as safety permits',
                            'Avoid stopping near or under buildings, trees, overpasses, and utility wires'
                          ],
                          afterTips: [
                            'Expect aftershocks',
                            'Check yourself and others for injuries',
                            'Look for and extinguish small fires',
                            'Inspect your home for damage',
                            'Use phone only for emergencies',
                            'Listen to battery-operated radio for emergency information'
                          ],
                          specialGroupTips: {},
                        ),
                      ),
                      DisasterCard(
                        title: 'Floods',
                        icon: Icons.water,
                        color: Color(0xFF0277BD),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Move to higher ground immediately',
                            'Listen to radio/TV for emergency information',
                            'Disconnect electrical appliances',
                            'Keep emergency supplies ready'
                          ],
                          donts: [
                            'Don\'t walk through flowing water',
                            'Don\'t drive through flooded areas',
                            'Don\'t touch electrical equipment if wet',
                            'Don\'t return home until authorities say it\'s safe'
                          ],
                          beforeTips: [
                            'Know your area\'s flood risk',
                            'Prepare an emergency kit',
                            'Make a family emergency plan',
                            'Elevate the furnace, water heater, and electric panel',
                            'Consider installing check valves to prevent floodwater from backing up into drains'
                          ],
                          duringTipsIndoor: [
                            'Turn off utilities if instructed to do so',
                            'Move essential items to an upper floor',
                            'Fill bathtubs, sinks, and containers with clean water',
                            'Stay tuned to emergency broadcasts',
                            'If told to evacuate, do so immediately'
                          ],
                          duringTipsOutdoor: [
                            'Don\'t walk through moving water',
                            'Six inches of water can make you fall',
                            'If you must walk in water, walk where the water is not moving',
                            'Use a stick to check the firmness of the ground in front of you',
                            'Avoid flooded areas'
                          ],
                          afterTips: [
                            'Return home only when authorities say it\'s safe',
                            'Be aware of areas where floodwaters have receded and watch out for debris',
                            'Don\'t attempt to drive through flooded areas',
                            'Clean and disinfect everything that got wet',
                            'Be aware of the risk of electrocution'
                          ],
                          specialGroupTips: {},
                        ),
                      ),
                      DisasterCard(
                        title: 'Drought',
                        icon: Icons.wb_sunny,
                        color: Color(0xFF01579B),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Conserve water by fixing leaks',
                            'Use water-efficient appliances',
                            'Collect and use rainwater if legal',
                            'Reuse water when possible'
                          ],
                          donts: [
                            'Don\'t waste water on non-essential activities',
                            'Don\'t ignore water restrictions',
                            'Don\'t leave taps running',
                            'Don\'t overlook even small leaks'
                          ],
                          beforeTips: [
                            'Install water-efficient devices',
                            'Create a drought-tolerant garden',
                            'Know your local water sources',
                            'Store emergency water supplies',
                            'Develop a family water conservation plan'
                          ],
                          duringTipsIndoor: [
                            'Take shorter showers',
                            'Use dishwashers and washing machines only when full',
                            'Turn off the water while brushing teeth or shaving',
                            'Use a bucket instead of a hose to wash cars',
                            'Check and repair all leaks'
                          ],
                          duringTipsOutdoor: [
                            'Water plants early in the morning or late in the evening',
                            'Use mulch around plants to reduce evaporation',
                            'Adjust sprinklers to avoid watering pavements',
                            'Let grass grow longer to reduce water needs',
                            'Use a broom instead of a hose to clean driveways'
                          ],
                          afterTips: [
                            'Continue conservation practices',
                            'Replenish emergency water supplies',
                            'Evaluate water usage and improve efficiency',
                            'Support water conservation initiatives',
                            'Consider permanent landscaping changes'
                          ],
                          specialGroupTips: {
                            'Farmers should': [
                              'Use drip irrigation',
                              'Plant drought-resistant crops',
                              'Implement crop rotation',
                              'Maintain soil health to improve water retention',
                              'Use mulching to reduce evaporation'
                            ]
                          },
                        ),
                      ),
                      DisasterCard(
                        title: 'Landslide',
                        icon: Icons.terrain,
                        color: Color(0xFF0288D1),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Stay alert and awake',
                            'Listen for unusual sounds',
                            'Evacuate if instructed to do so',
                            'Watch for changes in landscape'
                          ],
                          donts: [
                            'Don\'t ignore evacuation orders',
                            'Don\'t return to a landslide area',
                            'Don\'t approach a landslide zone',
                            'Don\'t sleep in high-risk buildings during heavy rain'
                          ],
                          beforeTips: [
                            'Learn about landslide risk in your area',
                            'Create an evacuation plan',
                            'Install flexible pipe fittings to avoid gas or water leaks',
                            'Plant ground cover on slopes',
                            'Build retaining walls or channels to direct flows around buildings'
                          ],
                          duringTipsIndoor: [
                            'Move to a second story if possible',
                            'Hold on to sturdy furniture',
                            'Curl into a tight ball and protect your head if escape is not possible',
                            'Listen for unusual sounds that might indicate moving debris',
                            'Evacuate immediately if safe to do so'
                          ],
                          duringTipsOutdoor: [
                            'Move away from the path of a landslide as quickly as possible',
                            'Run to the highest nearby spot',
                            'If escaping is not possible, curl into a tight ball and protect your head',
                            'Be alert for flooding that may follow a landslide',
                            'Watch for trees cracking or boulders knocking together'
                          ],
                          afterTips: [
                            'Stay away from the slide area',
                            'Check for injured or trapped people near the slide without entering the slide area',
                            'Report broken utility lines to appropriate authorities',
                            'Check building foundations, chimneys, and surrounding land for damage',
                            'Replant damaged ground as soon as possible'
                          ],
                          specialGroupTips: {},
                        ),
                      ),
                      DisasterCard(
                        title: 'Lightning',
                        icon: Icons.flash_on,
                        color: Color(0xFF039BE5),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Seek shelter in a building or car',
                            'Unplug electronic equipment',
                            'Stay off corded phones and computers',
                            'Wait 30 minutes after the last thunder before going outside'
                          ],
                          donts: [
                            'Don\'t stand under tall trees',
                            'Don\'t lie flat on the ground',
                            'Don\'t use a corded phone',
                            'Don\'t touch electrical equipment or cords'
                          ],
                          beforeTips: [
                            'Check the weather forecast',
                            'Plan to move to a safe location if thunderstorms are expected',
                            'Install surge protectors',
                            'Ensure everyone knows lightning safety guidelines',
                            'Identify the safest places in your home'
                          ],
                          duringTipsIndoor: [
                            'Stay off corded phones and computers',
                            'Avoid plumbing, including washing hands or taking showers',
                            'Stay away from windows and doors',
                            'Unplug electronic equipment',
                            'Don\'t touch concrete floors or walls'
                          ],
                          duringTipsOutdoor: [
                            'Get inside a building or hard-topped vehicle immediately',
                            'If you can\'t get to shelter, stay away from tall objects like trees',
                            'If no shelter is available, squat low with minimal contact with the ground',
                            'Stay away from water and metal objects',
                            'Move to low ground, away from high areas'
                          ],
                          afterTips: [
                            'Wait at least 30 minutes after the last thunder before going outside',
                            'Call 911 immediately if someone is struck by lightning',
                            'Check your property for damage',
                            'Check on vulnerable people and animals',
                            'Inspect and reset breakers and GFCIs if the power went out'
                          ],
                          specialGroupTips: {},
                        ),
                      ),
                      DisasterCard(
                        title: 'Tsunami',
                        icon: Icons.waves,
                        color: Color(0xFF03A9F4),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Move inland and to higher ground immediately',
                            'Follow evacuation orders',
                            'Stay away from the coast',
                            'Keep battery-powered radio handy'
                          ],
                          donts: [
                            'Don\'t stay in low-lying coastal areas after a strong earthquake',
                            'Don\'t return to coastal areas until authorities allow',
                            'Don\'t go to the beach to watch a tsunami',
                            'Don\'t assume the danger is over after the first wave'
                          ],
                          beforeTips: [
                            'Know if your home, school, or workplace is in a tsunami hazard area',
                            'Know evacuation routes to higher ground',
                            'Practice your evacuation route',
                            'Prepare a disaster supplies kit',
                            'Learn the warning signs: strong earthquakes, sudden water level changes'
                          ],
                          duringTipsIndoor: [
                            'If you feel a strong coastal earthquake, drop, cover, and hold on',
                            'When the shaking stops, move quickly inland and to higher ground',
                            'Follow evacuation orders from authorities',
                            'Take your emergency kit if readily available',
                            'Don\'t wait for official warnings if you notice warning signs'
                          ],
                          duringTipsOutdoor: [
                            'If you\'re at the beach and notice the water receding unusually far, move to higher ground immediately',
                            'Follow clearly marked tsunami evacuation routes',
                            'If you can\'t get to higher ground, go to an upper level of a sturdy building',
                            'Stay away from the coast and low-lying areas',
                            'Help those who need special assistance'
                          ],
                          afterTips: [
                            'Stay out of flooded and damaged areas until officials say it\'s safe',
                            'Help injured or trapped people',
                            'Use text messages or social media to communicate with family',
                            'Return home only when authorities say it\'s safe',
                            'Be aware that tsunamis often come in multiple waves over hours or days'
                          ],
                          specialGroupTips: {
                            'Boat owners should': [
                              'Plan how to respond to a tsunami for your specific situation',
                              'If there\'s time and deep water access, boats may be safer in deep water',
                              'If there\'s not enough time, secure your boat and move inland',
                              'Don\'t risk your life to save your boat',
                              'Never go to the shore to watch for a tsunami'
                            ]
                          },
                        ),
                      ),
                      DisasterCard(
                        title: 'Avalanche',
                        icon: Icons.landscape,
                        color: Color(0xFF29B6F6),
                        disasterInfo: DisasterInfo(
                          dos: [
                            'Carry avalanche safety equipment',
                            'Move diagonally to escape an avalanche\'s path',
                            'Create an air pocket if buried',
                            'Stay on marked trails in snow areas'
                          ],
                          donts: [
                            'Don\'t travel alone in avalanche-prone areas',
                            'Don\'t make loud noises in high-risk areas',
                            'Don\'t panic if caught in an avalanche',
                            'Don\'t remove avalanche safety gear to save weight'
                          ],
                          beforeTips: [
                            'Check avalanche forecasts before going to mountains',
                            'Carry essential safety equipment: beacon, probe, and shovel',
                            'Get proper avalanche safety training',
                            'Tell someone your plans and expected return time',
                            'Recognize warning signs: recent avalanches, cracking sounds, heavy snowfall'
                          ],
                          duringTipsIndoor: [
                            'Stay inside buildings if an avalanche is approaching',
                            'Move to the upper floor if possible',
                            'Stay away from windows',
                            'Get under sturdy furniture',
                            'Listen to emergency broadcasts'
                          ],
                          duringTipsOutdoor: [
                            'Try to move to the side of the avalanche\'s path',
                            'Grab onto anything solid',
                            'Swim with the avalanche to stay on top',
                            'Create space around your face for breathing if buried',
                            'Keep one hand in front of your face to create an air pocket'
                          ],
                          afterTips: [
                            'If buried, try to create an air pocket in front of your face',
                            'Conserve energy and oxygen by breathing slowly',
                            'Try to push your hand upward through the snow',
                            'If you\'re not buried, mark the spot where you last saw victims',
                            'Search for victims immediately - survival chances decrease rapidly after 15 minutes'
                          ],
                          specialGroupTips: {
                            'Skiers should': [
                              'Always carry a beacon, probe, and shovel',
                              'Consider wearing an avalanche airbag pack',
                              'Travel one at a time through high-risk areas',
                              'Continuously assess snow conditions',
                              'Learn to recognize dangerous terrain'
                            ]
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DisasterCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final DisasterInfo disasterInfo;

  const DisasterCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.color,
    required this.disasterInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showDetailsDialog(context);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.7)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 48,
                  color: Colors.white,
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.play_circle_fill,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'View Tips',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DisasterInfoDialog(
        title: title,
        color: color,
        disasterInfo: disasterInfo,
      ),
    );
  }
}

class DisasterInfo {
  final List<String> dos;
  final List<String> donts;
  final List<String> beforeTips;
  final List<String> duringTipsIndoor;
  final List<String> duringTipsOutdoor;
  final List<String> afterTips;
  final Map<String, List<String>> specialGroupTips;

  const DisasterInfo({
    required this.dos,
    required this.donts,
    required this.beforeTips,
    required this.duringTipsIndoor,
    required this.duringTipsOutdoor,
    required this.afterTips,
    required this.specialGroupTips,
  });
}

class DisasterInfoDialog extends StatefulWidget {
  final String title;
  final Color color;
  final DisasterInfo disasterInfo;

  const DisasterInfoDialog({
    Key? key,
    required this.title,
    required this.color,
    required this.disasterInfo,
  }) : super(key: key);

  @override
  _DisasterInfoDialogState createState() => _DisasterInfoDialogState();
}

class _DisasterInfoDialogState extends State<DisasterInfoDialog> {
  String _currentSection = 'overview';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            Flexible(
              child: SingleChildScrollView(
                child: _buildContent(),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [widget.color, widget.color.withOpacity(0.8)],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 40), // Balance the close button
            ],
          ),
          SizedBox(height: 16),
          if (_currentSection == 'overview')
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Do's & Don'ts",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSectionButton('overview', 'Overview'),
                SizedBox(width: 12),
                _buildSectionButton('before', 'Before'),
                SizedBox(width: 12),
                _buildSectionButton('during', 'During'),
                SizedBox(width: 12),
                _buildSectionButton('after', 'After'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionButton(String section, String label) {
    final isActive = _currentSection == section;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _currentSection = section;
          });
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: isActive ? widget.color : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.grey.shade50,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: _buildCurrentSectionContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentSectionContent() {
    switch (_currentSection) {
      case 'overview':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDosSection(),
            SizedBox(height: 24),
            _buildDontsSection(),
            SizedBox(height: 24),
            _buildKnowMoreButton(),
          ],
        );
      case 'before':
        return _buildBeforeSection();
      case 'during':
        return _buildDuringSection();
      case 'after':
        return _buildAfterSection();
      default:
        return Container();
    }
  }

  Widget _buildDosSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text(
                  "Do's",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...widget.disasterInfo.dos
                .map((tip) => _buildTipItem(tip, true))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDontsSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.cancel, color: Colors.red, size: 24),
                SizedBox(width: 8),
                Text(
                  "Don'ts",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...widget.disasterInfo.donts
                .map((tip) => _buildTipItem(tip, false))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String tip, bool isDo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isDo ? Colors.green.shade100 : Colors.red.shade100,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                isDo ? Icons.check : Icons.close,
                color: isDo ? Colors.green : Colors.red,
                size: 16,
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              tip,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKnowMoreButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _currentSection = 'before';
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Learn More',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward, size: 20, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildBeforeSection() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.warning_amber_rounded,
                    color: widget.color, size: 24),
                SizedBox(width: 8),
                Text(
                  "Before ${widget.title}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: widget.color,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...widget.disasterInfo.beforeTips
                .map((tip) => _buildBulletPoint(tip))
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildDuringSection() {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.home, color: widget.color, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Indoors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: widget.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ...widget.disasterInfo.duringTipsIndoor
                    .map((tip) => _buildBulletPoint(tip))
                    .toList(),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.landscape, color: widget.color, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "Outdoors",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: widget.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ...widget.disasterInfo.duringTipsOutdoor
                    .map((tip) => _buildBulletPoint(tip))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAfterSection() {
    return Column(
      children: [
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.restore, color: widget.color, size: 24),
                    SizedBox(width: 8),
                    Text(
                      "After ${widget.title}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: widget.color,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                ...widget.disasterInfo.afterTips
                    .map((tip) => _buildBulletPoint(tip))
                    .toList(),
              ],
            ),
          ),
        ),
        if (widget.disasterInfo.specialGroupTips.isNotEmpty) ...[
          SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.group, color: widget.color, size: 24),
                      SizedBox(width: 8),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "Special Instructions",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: widget.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ...widget.disasterInfo.specialGroupTips.entries
                      .map((entry) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                decoration: BoxDecoration(
                                  color: widget.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  entry.key,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: widget.color,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              ...entry.value
                                  .map((tip) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 8,
                                              height: 8,
                                              margin: EdgeInsets.only(
                                                  top: 8, right: 12),
                                              decoration: BoxDecoration(
                                                color: widget.color,
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                tip,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  height: 1.4,
                                                ),
                                                softWrap: true,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                              SizedBox(height: 8),
                            ],
                          ))
                      .toList(),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: EdgeInsets.only(top: 8, right: 12),
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Close',
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
