package android.com.flutter_design_demo

import android.content.Context

import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {
    override fun attachBaseContext(base: Context) {
        super.attachBaseContext(base)
        // MultiDex.install(this);
    }
}