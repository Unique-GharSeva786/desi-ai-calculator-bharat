# Proguard rules for Desi AI Calculator

# Google AdMob Rules
-keep public class com.google.android.gms.ads.** { public *; }
-keep class com.google.ads.** { *; }

# WebView & JavaScript Interface Rules
-keepattributes JavascriptInterface
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keepclassmembers class * extends android.webkit.WebViewClient {
    public void *(android.webkit.WebView, java.lang.String);
    public void *(android.webkit.WebView, java.lang.String, android.graphics.Bitmap);
}
-keepclassmembers class * extends android.webkit.WebChromeClient {
    public void *(android.webkit.WebView, java.lang.String);
    public void onPermissionRequest(android.webkit.PermissionRequest);
}
