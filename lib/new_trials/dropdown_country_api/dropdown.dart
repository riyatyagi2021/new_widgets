import 'package:flutter/material.dart';
import 'package:trying_widgetss/new_trials/dropdown_country_api/repo.dart';
import 'package:trying_widgetss/new_trials/dropdown_country_api/reposi.dart';
//import 'package:google_fonts/google_fonts.dart';

class Country extends StatefulWidget {
  const Country({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Country>with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isChanged=false;

  CountryListModal? _selectedMenuItem;
  static List<CountryListModal> _countryListModal=[];

  @override
  void initState()  {
    super.initState();
    initJson();
    controller=AnimationController(vsync:this,duration: Duration(seconds: 10) );
  }

  void dispose(){
    super.dispose();
    controller.dispose();
  }

  Future initJson() async {
    _countryListModal = await getSWData();
setState(() {

});
  }


  DropdownMenuItem<CountryListModal> buildDropdownMenuItem(CountryListModal item) {
    return DropdownMenuItem(
      value: item, // you must provide a value
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(item.name ?? ""),
      ),
    );
  }


  Widget buildDropdownButton() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: DropdownButton<CountryListModal>(
          elevation: 1,
          hint: Text("Select one"),
          isExpanded: true,
          underline: Container(
            height: 2,
            color: Colors.black12,
          ),
          items: _countryListModal.map((item) => buildDropdownMenuItem(item)).toList(),
          value: _selectedMenuItem, // values should match
          onChanged: ( item) {
            setState(() => _selectedMenuItem = item );
          },
        ),
      ),
    );
  }

  void trigger(){
    setState(() {
      // isChanged==!isChanged;
      // isChanged?controller.forward():controller.reverse();
      controller.forward();
      controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {





    return  Scaffold(
        appBar: AppBar(
          title: Text("Hospital Management"),
        ),
        body:Column(
          children: [
            buildDropdownButton(),
            Text(_countryListModal.length==0?"serdfthuyj":_countryListModal[1].name.toString()),
            SelectableText(
              "fghjkljhgfdsdfghjkjhgfds",
              enableInteractiveSelection: true,
              toolbarOptions: ToolbarOptions(copy: true,paste: true,cut: true,selectAll: true),
            ),

            CircleAvatar(
              backgroundColor: Colors.red,
              radius: 50,
              child: Icon(Icons.adaptive.share,size: 80,),
            ),
            Container(
              height: 130,
              width: 230,
              child: FittedBox(
                child:Icon(Icons.adaptive.share,size: 80,) ,
              ),
            ),
          //  Text('Testing google fonts',style: GoogleFonts.alata().copyWith(color: Colors.red),),
            
            IconButton(
              iconSize: 50,
                onPressed:(){
                trigger();
                },
                icon: AnimatedIcon(
              icon: AnimatedIcons.home_menu,
              progress: controller,
              
            )),

            AspectRatio(
                aspectRatio: 8/3,
              child: Image.asset('assets/images/pic.jpg'),
            )
            
          ],
        )
    );
  }
}