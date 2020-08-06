package com.example.flutter_app;

import android.app.Activity;
import android.util.Log;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class FlutterNativePlugin implements MethodChannel.MethodCallHandler {
    private static String TAG = "weikang";
    public static String CHANNEL = "com.test/name";  // 分析1
    static MethodChannel channel;
    private Activity activity;

    private FlutterNativePlugin(Activity activity) {
        this.activity = activity;
    }

    public static void registerWith(PluginRegistry.Registrar registrar) {
        Log.d(TAG,"registerWith");
        channel = new MethodChannel(registrar.messenger(), CHANNEL);
        FlutterNativePlugin instance = new FlutterNativePlugin(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        Log.d(TAG,"onMethodCall=="+methodCall.method);
        if (methodCall.method.equals("isChinese")) {
            boolean isChinese = true;
            result.success(isChinese);  // 分析3
        }
        else {
            result.notImplemented();
        }
    }
}
