# Keep Flutter Local Notifications classes
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# Keep scheduled notification receiver class
-keep class com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver { *; }

# Keep type signatures
-keepattributes Signature

# If you are using Gson or other libraries with generics, preserve their types too
-keep class com.google.gson.** { *; }
-keep class com.google.firebase.** { *; }
-keep class io.flutter.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**