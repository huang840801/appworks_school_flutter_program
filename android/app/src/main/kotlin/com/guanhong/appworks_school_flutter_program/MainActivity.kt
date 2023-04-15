package com.guanhong.appworks_school_flutter_program

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private lateinit var channel: MethodChannel
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "yourpackageName/channelName")
        channel.setMethodCallHandler { _, _ ->
            startActivity(Intent(this, TapPayActivity::class.java))
        }
    }
}
