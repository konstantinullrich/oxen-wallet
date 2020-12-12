# Oxen Wallet

The Oxen Wallet is a Fork of the Cake Wallet.

## Build

1. Get Dependencies from pub
    ```shell script
    flutter pub get
    ```

2. Run the build_runner
    ```shell script
    flutter pub run build_runner build
    ```

3. Build the Oxen Static Libs and paste them into `oxen_coin/ios/External/android/oxen`\
    `wallet2_api.h` in the folder `/include`\
    `libwallet_api.a` into their abi folder in `/lib`. For example: `/lib/x86`

4. Generate Launcher Icons
    ```shell script
    flutter pub run flutter_launcher_icons:main
    ```

5. Create Encryption Keys (Only needed if .secrets-<env>.json is empty)
    ```shell script
    dart tool/create_secret.dart
    ```

6. Add Key to the application
    ```shell script
    dart tool/secrets.dart
    ```

7. Run the app
    ```shell script
    flutter run
    ```

## Copyright
Copyright (c) 2020 Konstantin Ullrich.\
Copyright (c) 2020 Cake Technologies LLC.
