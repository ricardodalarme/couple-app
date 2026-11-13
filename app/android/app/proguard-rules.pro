# Flutter embedding and generated plugin registrant.
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugin.** { *; }
-dontwarn io.flutter.embedding.**

# home_widget schedules work by class name through WorkManager.
-keep class es.antonborri.home_widget.** { *; }

# Firebase, RevenueCat and AndroidX ship their own consumer rules; keep the
# annotations and generic signatures they read reflectively.
-keepattributes *Annotation*, Signature, InnerClasses, EnclosingMethod, MethodParameters
