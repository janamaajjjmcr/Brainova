package com.example.brainova

import android.app.AppOpsManager
import android.app.usage.UsageStats
import android.app.usage.UsageStatsManager
import android.content.Context
import android.content.Intent
import android.os.Process
import android.provider.Settings
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "brainova/usage_stats"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->

                when (call.method) {

                    "checkPermission" -> {
                        result.success(hasUsagePermission())
                    }

                    "openUsageSettings" -> {
                        val intent = Intent(Settings.ACTION_USAGE_ACCESS_SETTINGS)
                        startActivity(intent)
                        result.success(true)
                    }

                    "queryUsageStats" -> {
                        val startTime = call.argument<Long>("startTime") ?: 0L
                        val endTime = call.argument<Long>("endTime") ?: 0L
                        val interval = call.argument<Int>("interval") ?: 0

                        val usageStats = queryUsageStats(startTime, endTime, interval)
                        result.success(usageStats)
                    }

                    else -> {
                        result.notImplemented()
                    }
                }
            }
    }

    private fun queryUsageStats(startTime: Long, endTime: Long, interval: Int): List<Map<String, Any>> {
        val usageStatsManager = getSystemService(Context.USAGE_STATS_SERVICE) as UsageStatsManager
        val stats = usageStatsManager.queryUsageStats(interval, startTime, endTime)

        val result = mutableListOf<Map<String, Any>>()
        for (usageStat in stats) {
            if (usageStat.totalTimeInForeground > 0) {
                val map = mutableMapOf<String, Any>()
                map["packageName"] = usageStat.packageName
                map["totalTimeInForeground"] = usageStat.totalTimeInForeground
                map["lastTimeUsed"] = usageStat.lastTimeUsed
                // add other fields if needed by Dart side
                result.add(map)
            }
        }
        return result
    }

    private fun hasUsagePermission(): Boolean {
        val appOps = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = appOps.checkOpNoThrow(
            AppOpsManager.OPSTR_GET_USAGE_STATS,
            Process.myUid(),
            packageName
        )
        return mode == AppOpsManager.MODE_ALLOWED
    }
}
