package io.oxen.coin

import io.oxen.coin.OxenWalletSyncStatusListener

class OxenApi {
    private var isLoaded = false

    fun load() : Unit {
        if (isLoaded) {
            return
        }

        System.loadLibrary("oxen_coin")
        isLoaded = true
    }

    fun setupListener(listener: OxenWalletSyncStatusListener) {
        setupListenerJNI(listener)
    }

    external fun setupListenerJNI(listener: OxenWalletSyncStatusListener)
}