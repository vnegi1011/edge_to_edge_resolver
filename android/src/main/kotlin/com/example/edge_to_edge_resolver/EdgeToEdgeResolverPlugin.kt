package com.example.edge_to_edge_resolver

import android.app.Activity
import android.os.Build
import android.view.WindowInsetsController
import androidx.annotation.NonNull
import androidx.core.view.WindowInsetsControllerCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class EdgeToEdgeResolverPlugin: FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var activity: Activity? = null

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "edge_to_edge_resolver")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setNavigationBarColor" -> {
                val color: Int = (call.argument<Number>("color") ?: 0).toInt()
                val darkIcons: Boolean = call.argument<Boolean>("isDark") ?: true
                setNavBarColor(color, darkIcons)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    private fun setNavBarColor(color: Int, darkIcons: Boolean) {
        val window = activity?.window ?: return

        window.navigationBarColor = color

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) { // API 30+
            if (darkIcons) {
                // Light icons OFF → dark icons ON
                window.insetsController?.setSystemBarsAppearance(
                    0,
                    WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS
                )
            } else {
                // Light icons ON → dark icons OFF
                window.insetsController?.setSystemBarsAppearance(
                    WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS,
                    WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS
                )
            }

        } else {
            // Use WindowInsetsControllerCompat for older versions
            WindowInsetsControllerCompat(window, window.decorView).isAppearanceLightNavigationBars = darkIcons
        }
        // Log.d("EdgeToEdgeResolver", "darkIcons value: $darkIcons")
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    // ActivityAware methods
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }
}
