import 'package:flutter/material.dart';

class ToggleButtonBar extends StatefulWidget{
  
  
  @override
  State<StatefulWidget> createState() {
    return _ToggleButtonBar();
  }

  
}

class _ToggleButtonBar extends State<ToggleButtonBar>{

  //Toggle Bar List
  List<String> toggleItems = [
    'Menu',
    'Today',
    'Review'
  ];

  //Toggle Bar select state
  List<bool> selectedState = [false,true,false];

  @override
  Widget build(BuildContext context) {
    /*Button Bar*/
    return Column(
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
              );
  }

}