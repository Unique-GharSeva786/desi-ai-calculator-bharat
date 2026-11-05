# Desi AI Calculator — Android Studio 100% Ready Setup Guide

Aapka project Android Studio ke liye 100% ready hai. Isme Real AdMob IDs, Offline WebView assets, Audio permission bridge, aur Release Signing support pehle se configured hai.

---

## 1. Project Information & Verified IDs
- **App Name**: Desi AI Calculator
- **Package / Application ID**: `com.desiaicalculator.app`
- **Target SDK**: 34 (Android 14) / Min SDK: 21 (Android 5.0 Lollipop)
- **Google AdMob App ID**: `ca-app-pub-4132634485810878~7856856901`
- **Google AdMob Banner Ad Unit ID**: `ca-app-pub-4132634485810878/6060771539`

---

## 2. Android Studio me Project Kaise Kholein
1. **Android Studio** open karein.
2. **File > Open...** par click karein.
3. Is project ka **`android`** folder select karein aur **OK** dabayein.
4. Android Studio automatically Gradle sync karega aur project build ke liye ready ho jayega.

---

## 3. APK Kaise Banayein (Testing / Direct Install)
1. Android Studio ke top menu me **Build > Build Bundle(s) / APK(s) > Build APK(s)** par click karein.
2. Build complete hone par notification aayegi `APK(s) generated successfully`.
3. **locate** par click karein. Aapko `app-debug.apk` mil jayega jise aap kisi bhi Android phone me install kar sakte hain.

---

## 4. Play Store ke liye Signed AAB / APK Kaise Banayein

### Option A: Android Studio GUI Wizard se (Sabse aasan)
1. Top menu me **Build > Generate Signed Bundle / APK...** par click karein.
2. **Android App Bundle** select karein aur **Next** dabayein.
3. Agar aapke paas keystore nahi hai to **Create new...** par click karke apna keystore banayein (Path aur password yaad rakhein).
4. Destination folder select karein aur build variant **release** choose karein.
5. **Finish** dabayein. Aapka Play Store ready `.aab` file generate ho jayega.

### Option B: Keystore File & Command Line se
1. `android` folder me terminal open karein aur execute karein:
   ```bash
   ./generate_keystore.sh
   ```
   (Ya manual command run karein:)
   ```bash
   keytool -genkey -v -keystore release.keystore -alias desi_calculator_key -keyalg RSA -keysize 2048 -validity 10000
   ```
2. `android/keystore.properties` file me password set karein:
   ```properties
   storeFile=release.keystore
   storePassword=your_password
   keyAlias=desi_calculator_key
   keyPassword=your_password
   ```
3. Terminal me command run karein:
   ```bash
   ./gradlew bundleRelease   # Google Play Store AAB
   ./gradlew assembleRelease # Signed Release APK
   ```
4. Output file location:
   - AAB: `android/app/build/outputs/bundle/release/app-release.aab`
   - APK: `android/app/build/outputs/apk/release/app-release.apk`
