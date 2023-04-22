package com.guanhong.appworks_school_flutter_program

import android.app.Activity
import android.content.Intent
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.TextView
import tech.cherri.tpdirect.api.TPDCard
import tech.cherri.tpdirect.api.TPDServerType
import tech.cherri.tpdirect.api.TPDSetup

class TapPayActivity : Activity() {

    private lateinit var tapPayCard: TPDCard
    private var isTapPayCanGetPrime = false

    companion object {
        const val GET_PRIME_SUCCESS = 1
        const val MY_PRIME = "MY_PRIME"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tap_pay)

        val tpdForm = findViewById<tech.cherri.tpdirect.api.TPDForm>(R.id.tPDForm)
        val button = findViewById<Button>(R.id.button)
        val statusTextView = findViewById<TextView>(R.id.status)

        button.setOnClickListener {
            Log.d("Huang", "getPrime")
            tapPayCard.getPrime()
        }

        TPDSetup.initInstance(
            this,
            128440,
            "app_zmKrS6E5uYovLqElf5AawqRJ9wFJ6rXXUdxDiad8A4OqyTXpsjdzTRtvs5aT",
            TPDServerType.Sandbox
        )

        tpdForm.setTextErrorColor(Color.RED)
        tpdForm.setOnFormUpdateListener { tpdStatus ->

            Log.d("Huang", " isCanGetPrime456=" + tpdStatus.isCanGetPrime)
            isTapPayCanGetPrime = tpdStatus.isCanGetPrime
        }
        tapPayCard = TPDCard.setup(tpdForm).onSuccessCallback { prime, cardInfo, cardIdentifier, merchantReferenceInfo ->
            Log.d("Huang", " success prime=" + prime)
            Log.d("Huang", " success cardInfo=" + cardInfo)
            Log.d("Huang", " success cardIdentifier=" + cardIdentifier)
            Log.d("Huang", " success merchantReferenceInfo=" + merchantReferenceInfo)

            setResult(GET_PRIME_SUCCESS, Intent().apply {
                putExtra(MY_PRIME, prime)
            })
            finish()
        }.onFailureCallback { status, reportMsg ->
            Log.d("Huang", " fail status=" + status)
            Log.d("Huang", " fail reportMsg=" + reportMsg)
            statusTextView.text = reportMsg
        }
    }
}