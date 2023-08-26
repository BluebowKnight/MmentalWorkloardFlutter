import 'package:flutter/material.dart';
import 'package:prototype/bloc/java_analyzer/java_analyzer.dart';

class JavaMethod_Provider extends InheritedWidget{

  final JavaAnalyzers analyzer_Bloc = JavaAnalyzers();

  JavaMethod_Provider({super.key,required super.child});

  static JavaAnalyzers of(BuildContext context){
    return (context.getInheritedWidgetOfExactType<JavaMethod_Provider>() as JavaMethod_Provider).analyzer_Bloc;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }

}