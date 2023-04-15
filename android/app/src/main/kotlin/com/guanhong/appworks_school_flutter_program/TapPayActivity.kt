package com.guanhong.appworks_school_flutter_program

import android.app.Activity
import android.os.Bundle

import android.graphics.Color
import android.util.Log
import android.widget.Button
import tech.cherri.tpdirect.api.TPDCard
import tech.cherri.tpdirect.api.TPDServerType
import tech.cherri.tpdirect.api.TPDSetup
import tech.cherri.tpdirect.callback.TPDCardGetPrimeSuccessCallback
import tech.cherri.tpdirect.callback.TPDGetPrimeFailureCallback
import tech.cherri.tpdirect.callback.dto.TPDCardInfoDto
import tech.cherri.tpdirect.callback.dto.TPDMerchantReferenceInfoDto
import tech.cherri.tpdirect.model.TPDStatus

class TapPayActivity : Activity() {

    lateinit var tapPayCard: TPDCard
    var isTapPayCanGetPrime = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tap_pay)

        val tpdForm = findViewById<tech.cherri.tpdirect.api.TPDForm>(R.id.tPDForm)
        val button = findViewById<Button>(R.id.button)

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

            if (tpdStatus.cardNumberStatus != TPDStatus.STATUS_OK ||
                tpdStatus.expirationDateStatus != TPDStatus.STATUS_OK ||
                tpdStatus.ccvStatus != TPDStatus.STATUS_OK
            ) {
            }
            Log.d("Huang", " isCanGetPrime=" + tpdStatus.isCanGetPrime)
            isTapPayCanGetPrime = tpdStatus.isCanGetPrime
        }
        tapPayCard = TPDCard.setup(tpdForm).onSuccessCallback(object :
            TPDCardGetPrimeSuccessCallback {
            override fun onSuccess(
                p0: String?,
                p1: TPDCardInfoDto?,
                p2: String?,
                p3: TPDMerchantReferenceInfoDto?
            ) {
                Log.d("Huang", " success p0 = " + p0)
                Log.d("Huang", " success p1 = " + p1)
                Log.d("Huang", " success p2 = " + p2)
                Log.d("Huang", " success p3 = " + p3)
            }

        }).onFailureCallback(object : TPDGetPrimeFailureCallback {
            override fun onFailure(p0: Int, p1: String?) {
                Log.d("Huang", " fail p0 = " + p0)
                Log.d("Huang", " fail p1 = " + p1)
            }
        })
    }
}