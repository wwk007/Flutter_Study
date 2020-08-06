package com.example.flutter_app;

import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.mtp.MtpConstants;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.util.PrimitiveIterator;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private String TAG = "weikang";
    private String CHANNEL = "com.test/name";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine){
        Log.d(TAG,"configureFlutterEngine");
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        //1.创建MethodChannel
        MethodChannel channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL);

        //2.添加调用方法的回调
        channel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                if(methodCall.method.equals("getBatteryInfo")){
                    int batteryLevel = getBatteryLevel();
                    Log.d(TAG,"batteryLevel:"+batteryLevel);
                    if(batteryLevel != -1) {
                        result.success(batteryLevel);
                    }else {
                        result.error("unAvailable","Battery level not available",null);
                    }
                }else {
                    //没有实现
                    result.notImplemented();
                }
            }
        });

    }

    private int getBatteryLevel() {
        int batterylevel = -1;
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager manager = (BatteryManager)getSystemService(BATTERY_SERVICE);
            batterylevel = manager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY) ;
        }else {
            Intent intent = new ContextWrapper(getApplication()).registerReceiver(null,
                    new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batterylevel =  (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100)
                    / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }
        return batterylevel;
    }

}
