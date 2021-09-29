package com.example.plugin_hello

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** PluginHelloPlugin */
class PluginHelloPlugin : FlutterPlugin, MethodCallHandler,PigeonDemoMessage.PigeonDemoApi {

    private lateinit var channel: MethodChannel

    private var delegate: FlutterChannelDelegate? = null

    fun setDelegate(delegate: FlutterChannelDelegate) {
        this.delegate = delegate
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugin_hello")
        channel.setMethodCallHandler(this)

        //pigeon 生成的api进行初始化
        PigeonDemoMessage.PigeonDemoApi.setup(flutterPluginBinding.binaryMessenger, this);
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "getDeviceId" -> {
                result.success("Android ${android.os.Build.ID}")
            }
            "onChannelMessage" -> {
                result.success(
                    delegate?.onAction(
                        call.argument<Int>("actionCategory") as Int,
                        call.argument<String>("actionType") as String,
                        call.argument("actionParams") as Map<String, Any>?
                    )
                )
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun getMessage(arg: PigeonDemoMessage.DemoRequest?): PigeonDemoMessage.DemoReply {
        return PigeonDemoMessage.DemoReply().apply {
            result = "Android ${android.os.Build.ID}"
        }
    }

    override fun getDeviceId(): PigeonDemoMessage.DemoReply {
        return PigeonDemoMessage.DemoReply().apply {
            result = "from pigeon Android ${android.os.Build.ID}"
        }
    }
}
