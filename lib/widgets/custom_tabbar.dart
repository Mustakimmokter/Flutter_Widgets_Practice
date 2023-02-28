import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  CustomTabBar({Key? key}) : super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {

  final PageController _pageController = PageController();

  final List<String> _labels = ['TabOne', 'TabTwo', 'TabThree'];

  final List<Color> _tabColors = [Colors.blue,Colors.red,Colors.green];

  final List<String> _texts = [
    'This is page One and Tab One',
    'This is page Two and Tab Two',
    'This is page Three and Tab Three'
  ];

   int _selectedIndex = 0;

  void _getSelected(int index){
   setState(() {
     _selectedIndex = index;
   });
    _pageController.animateToPage(_selectedIndex, duration: const Duration(milliseconds: 300), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 03,
                  offset: Offset(1, 1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(3, (index) {
                return _tabButton(
                  onTap: (){
                    _getSelected(index);
                  },
                  backgroundColor: _tabColors[index],
                  labelColor: _selectedIndex == index ? Colors.white:Colors.grey.shade400,
                  label: _labels[index],
                );
              }),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _labels.length,
              itemBuilder: (context, index) {
                return _tabPage(
                  refreshColor: _tabColors[index],
                  text: _texts[index],
                  color: _tabColors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabPage({required String text,Color? color,Color? refreshColor}){
    return RefreshIndicator(
      color: refreshColor ?? Colors.red,
      onRefresh: ()async{},
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(left: 20,right: 20,top: 08,bottom: 08),
            color:  color ?? Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(text,style: const TextStyle(color: Colors.white),),
            ),

          );
        },
      ),
    );
  }

  Widget _tabButton({required VoidCallback onTap,required String label,Color? labelColor,Color? backgroundColor}){
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.blue
      ),
      onPressed: onTap,
      child: Text(label,style: TextStyle(color: labelColor ?? Colors.white),),
    );
  }
}
