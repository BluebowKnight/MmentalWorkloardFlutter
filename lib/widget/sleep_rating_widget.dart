import 'package:flutter/material.dart';
import 'package:prototype/bloc/data_provider/sleep_data_provider.dart';
import 'package:prototype/bloc/selected_date/picked_date_provider.dart';
import 'package:provider/provider.dart';

class SleepRatingWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('Previous',
                style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),),
              // Text('5',
              //   style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 32, fontWeight: FontWeight.w500, letterSpacing: 0.1)),
              loadSleepRatingImage(
                context.watch<SleepDataProvider>().previousDayRating(
                  context.watch<PickedDate>().formattedSelectedDate)?.Rating),
            ],
          ),
          Text('Sleep \nRating',
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.1,height: 1),textAlign: TextAlign.center,),
          Padding(padding: EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Text('Next',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),),
                // Text('5',
                //     style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 32, fontWeight: FontWeight.w500, letterSpacing: 0.1)),
                loadSleepRatingImage(context.watch<SleepDataProvider>().nextDayRating(
                  context.watch<PickedDate>().formattedSelectedDate)?.Rating),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loadSleepRatingImage(String? rate){
    switch(rate){
      case '1':
        return Image.asset('assets/images/Sleep_Rating_1.png',scale: 28,);
      case '2':
        return Image.asset('assets/images/Sleep_Rating_2.png',scale: 28,);
      case '3':
        return Image.asset('assets/images/Sleep_Rating_3.png',scale: 28,);
      case '4':
        return Image.asset('assets/images/Sleep_Rating_4.png',scale: 28,);
      case '5':
        return Image.asset('assets/images/Sleep_Rating_5.png',scale: 28,);
      default:
        return Image.asset('assets/images/Sleep_Rating_unkown.png',scale: 28,);
    }
  }
}

