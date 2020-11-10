package io.oxen.coin

import java.nio.ByteBuffer

import android.app.Activity
import android.os.Looper
import android.os.Handler

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.*
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

import io.oxen.coin.FlutterMethodHandler


public class OxenCoinPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel : MethodChannel

    companion object {
        var syncListenerChannel: BasicMessageChannel<ByteBuffer>? = null
        val oxenApi = OxenApi()
        val main = Handler(Looper.getMainLooper());
        val handlers = listOf(FlutterMethodHandler("setupSyncStatusListener", { call: MethodCall, result: Result ->
            oxenApi.setupListener(OxenWalletSyncStatusListener({ block: Long ->
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(9)
                    buffer.put(0.toByte())
                    buffer.putLong(block)
                    syncListenerChannel?.send(buffer)
                }
            }, {
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(1)
                    buffer.put(1.toByte())
                    syncListenerChannel?.send(buffer)
                }
            }, {
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(1)
                    buffer.put(2.toByte())
                    syncListenerChannel?.send(buffer)
                }
            }, {
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(1)
                    buffer.put(3.toByte())
                    syncListenerChannel?.send(buffer)
                }
            }, {
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(1)
                    buffer.put(4.toByte())
                    syncListenerChannel?.send(buffer)
                }
            }, {
                main.post() {
                    val buffer = ByteBuffer.allocateDirect(1)
                    buffer.put(5.toByte())
                    syncListenerChannel?.send(buffer)
                }
            }))

            result.success(true)
        }))

        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "oxen_coin")
            syncListenerChannel = syncListenerChannel ?: BasicMessageChannel<ByteBuffer>(registrar.messenger(), "oxen_coin.sync_listener", BinaryCodec.INSTANCE)
            channel.setMethodCallHandler(OxenCoinPlugin())
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "oxen_coin")
        syncListenerChannel = syncListenerChannel ?: BasicMessageChannel<ByteBuffer>(flutterPluginBinding.getBinaryMessenger(), "oxen_coin.sync_listener", BinaryCodec.INSTANCE)
        channel.setMethodCallHandler(this);
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        oxenApi.load()

        handlers.forEach {
            it.handle(call, result)
        }
    }
}
