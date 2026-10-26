package com.axon.productivity

import android.accessibilityservice.AccessibilityService
import android.content.Context
import android.content.Intent
import android.graphics.PixelFormat
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.view.Gravity
import android.view.LayoutInflater
import android.view.View
import android.view.WindowManager
import android.view.accessibility.AccessibilityEvent
import android.widget.Button
import android.widget.TextView

class AppBlockerAccessibilityService : AccessibilityService() {

    private var windowManager: WindowManager? = null
    private var overlayView: View? = null
    private val handler = Handler(Looper.getMainLooper())
    
    companion object {
        val blockedPackages = mutableSetOf("com.instagram.android", "com.google.android.youtube", "com.zhiliaoapp.musically")
        val temporaryAllowedUntil = mutableMapOf<String, Long>()
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (event?.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            val packageName = event.packageName?.toString() ?: return

            if (blockedPackages.contains(packageName)) {
                val allowedTime = temporaryAllowedUntil[packageName] ?: 0L
                val currentTime = System.currentTimeMillis()

                if (currentTime < allowedTime) {
                    return
                }

                handler.post {
                    showBlockOverlay(packageName)
                }
            }
        }
    }

    private fun showBlockOverlay(pkgName: String) {
        if (overlayView != null) return

        windowManager = getSystemService(Context.WINDOW_SERVICE) as WindowManager
        val layoutType = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
        } else {
            WindowManager.LayoutParams.TYPE_PHONE
        }

        val params = WindowManager.LayoutParams(
            WindowManager.LayoutParams.MATCH_PARENT,
            WindowManager.LayoutParams.MATCH_PARENT,
            layoutType,
            WindowManager.LayoutParams.FLAG_NOT_TOUCH_MODAL or WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN,
            PixelFormat.TRANSLUCENT
        ).apply {
            gravity = Gravity.CENTER
        }

        val inflater = LayoutInflater.from(this)
        overlayView = inflater.inflate(R.layout.native_block_overlay, null)

        val appNameTitle = overlayView?.findViewById<TextView>(R.id.tvAppName)
        val btn2Min = overlayView?.findViewById<Button>(R.id.btn2Min)
        val btn5Min = overlayView?.findViewById<Button>(R.id.btn5Min)
        val btn10Min = overlayView?.findViewById<Button>(R.id.btn10Min)
        val btn20Min = overlayView?.findViewById<Button>(R.id.btn20Min)
        val btnClose = overlayView?.findViewById<Button>(R.id.btnClose)

        appNameTitle?.text = if (pkgName.contains("youtube")) "YouTube" else "Instagram"
        btnClose?.text = "Close ${appNameTitle?.text}"

        fun grantExtension(minutes: Int) {
            temporaryAllowedUntil[pkgName] = System.currentTimeMillis() + (minutes * 60 * 1000L)
            removeOverlay()
        }

        btn2Min?.setOnClickListener { grantExtension(2) }
        btn5Min?.setOnClickListener { grantExtension(5) }
        btn10Min?.setOnClickListener { grantExtension(10) }
        btn20Min?.setOnClickListener { grantExtension(20) }

        btnClose?.setOnClickListener {
            val homeIntent = Intent(Intent.ACTION_MAIN).apply {
                addCategory(Intent.CATEGORY_HOME)
                flags = Intent.FLAG_ACTIVITY_NEW_TASK
            }
            startActivity(homeIntent)
            removeOverlay()
        }

        windowManager?.addView(overlayView, params)
    }

    private fun removeOverlay() {
        overlayView?.let {
            windowManager?.removeView(it)
            overlayView = null
        }
    }

    override fun onInterrupt() {}
}
