package com.example.flutter_app;

import android.os.Bundle;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    /*@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
    }*/

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine){
        GeneratedPluginRegistrant.registerWith(flutterEngine);
    }
}