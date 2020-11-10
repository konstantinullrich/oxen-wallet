import Flutter
import UIKit

public class SwiftOxenCoinPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "oxen_coin", binaryMessenger: registrar.messenger())
        syncListenerChannel = FlutterBasicMessageChannel(name: "oxen_coin.sync_listener", binaryMessenger: registrar.messenger(), codec: FlutterBinaryCodec())
        let instance = SwiftOxenCoinPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    private static var syncListenerChannel: FlutterBasicMessageChannel?
    private static var oxenWalletListener: OxenWalletListener?
    private let handlers = [FlutterMethodHandler(name: "setupSyncStatusListener", handler: { (call, result) in
        let listener = OxenWalletListener()
        listener.onNewBlock = { block in
            var _block = block.bigEndian
            let blockAsData = Data(bytes: &_block, count: MemoryLayout.size(ofValue: _block))
            var message = Data()
            message.append(0)
            message.append(blockAsData)
            syncListenerChannel?.sendMessage(message)
        }
        listener.onRefreshed = { _ in
            var message = Data()
            message.append(1)
            syncListenerChannel?.sendMessage(message)
        }
        listener.onUpdated = { _ in
            var message = Data()
            message.append(2)
            syncListenerChannel?.sendMessage(message)
        }
        listener.onMoneyReceived = { _, _ in
            var message = Data()
            message.append(3)
            syncListenerChannel?.sendMessage(message)
        }
        listener.onMoneySpent = { _, _ in
          var message = Data()
          message.append(4)
          syncListenerChannel?.sendMessage(message)
        }
        listener.onUnconfirmedMoneyReceived = { _, _ in
            var message = Data()
            message.append(5)
            syncListenerChannel?.sendMessage(message)
        }
        
        listener.setup()
        oxenWalletListener = listener
        result(true)
    })]
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        handlers.forEach { $0.handle(call, result: result) }
    }
}
