package com.guanhong.appworks_school_flutter_program

import android.content.Intent
import com.guanhong.appworks_school_flutter_program.TapPayActivity.Companion.GET_PRIME_SUCCESS
import com.guanhong.appworks_school_flutter_program.TapPayActivity.Companion.MY_PRIME
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private lateinit var channel: MethodChannel

    companion object {
        const val TO_TAP_PAY = 1
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "MyChannel")
        channel.setMethodCallHandler { methodCall, result ->
            startActivityForResult(Intent(this, TapPayActivity::class.java), TO_TAP_PAY)
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == TO_TAP_PAY && resultCode == GET_PRIME_SUCCESS) {
            if (data != null) {
                val prime = data.getStringExtra(MY_PRIME)
                channel.invokeMethod("getPrimeCallback", prime)
            }
        }
    }
}
