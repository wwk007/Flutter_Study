package com.example.flutter_app;

import android.util.Log;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private String TAG = "weikang";
    //通讯名称,回到手机桌面
    private final String chanel = "back/desktop";
    //返回手机桌面事件
    static final String eventBackDesktop = "backDesktop";

   /* @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }*/

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine){
        Log.d(TAG,"configureFlutterEngine");
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        initBackTop();
    }

    //注册返回到手机桌面事件
    private void initBackTop() {
       /* new MethodChannel(getFlutterView(), chanel).setMethodCallHandler(
                (methodCall, result) -> {
                    if (methodCall.method.equals(eventBackDesktop)) {
                        moveTaskToBack(false);
                        result.success(true);
                    }
                }
        );*/
    }





  /*  private void registerCustomPlugin(PluginRegistry registrar) {
        FlutterNativePlugin.registerWith(registrar.registrarFor(FlutterNativePlugin.CHANNEL));
    }

    @Override
    public Registrar registrarFor(String s) {
        Log.d(TAG,"registrarFor");
        return null;
    }

    @Override
    public boolean hasPlugin(String s) {
        Log.d(TAG,"hasPlugin");
        return false;
    }

    @Override
    public <T> T valuePublishedByPlugin(String s) {
        Log.d(TAG,"valuePublishedByPlugin");
        return null;
    }*/
}
