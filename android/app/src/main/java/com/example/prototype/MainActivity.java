package com.example.prototype;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {

    private static final String WorkRate_Channel = "com.example.prototype/workRate_Analyzer";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(),WorkRate_Channel)
                .setMethodCallHandler((call,result)->{
                    if(call.method.equals("WorkingRates")){
                        String date = call.argument("date");
                        String data = "[{\"workRate\":\"2\",\"duration\":\"5\"}]";
                        result.success(data);
                    }else{
                        result.notImplemented();
                    }
                });
    }

}
