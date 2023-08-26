import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/sleep_data_provider.dart';
import 'package:prototype/bloc/data_provider/workload_data_provider.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:prototype/pages/menu_page.dart';
import 'package:prototype/pages/review_page.dart';
import 'package:prototype/pages/today_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  
  //Toggle Bar List
  List<String> toggleItems = [
    'Menu',
    'Today',
    'Review'
  ];

  //Toggle Bar select state
  List<bool> selectedState = [false,true,false];

  //Widgets
  @override
  Widget build(BuildContext context){

    context.read<WorkloadDataProvider>().LoadData('assets/P1_test.json'); // Problem! : everytime reload or renew pages, it will load again.
    context.read<SleepDataProvider>().LoadData('assets/p1_Sleep.json'); // Problem! : everytime reload or renew pages, it will load again.
    if(context.watch<PickedDate>().isToday()){
      toggleItems[1] = 'Today';
    }else{
      toggleItems[1] = 'Previous';
    }
    
    //Scaffold
    return Scaffold(
      //Scaffold Body
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child:ListView(
            children: <Widget>[
              /*Toggle Button Bar*/
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ToggleButtons(
                  borderColor: Theme.of(context).colorScheme.primary,
                  selectedBorderColor: Theme.of(context).colorScheme.primary,
                  selectedColor: Colors.white,
                  fillColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(5.0),
                  borderWidth: 1.5,
                  constraints: BoxConstraints(
                    minHeight: 20.0,
                    minWidth: 110.0,
                    maxHeight: 40.0,
                  ),
                  children: List.generate(
                      toggleItems.length,
                      (index){
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            toggleItems[index],
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: selectedState[index]?FontWeight.bold:FontWeight.w300,
                              color: selectedState[index]?Colors.white:Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        );
                      }),
                  isSelected: selectedState,
                  onPressed: (index){
                    if(selectedState[index] == false){
                      for(int i=0; i<toggleItems.length; i++){
                        selectedState[i] = false;
                      }
                      selectedState[index] = true;
                      setState(() {

                      });
                    }
                  },
                ),]
              ),

              /*Body*/
              selectedState[0]==true?
                  MenuPage()://page: Menu
                selectedState[1]==true?
                    TodayPage()://Page: Today
                      ReviewPage(),//Page: Review
              
            ],
          ),
        ),
      )
    );
  }

}