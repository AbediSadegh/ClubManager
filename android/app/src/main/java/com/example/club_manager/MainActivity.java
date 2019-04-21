package com.example.club_manager;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.zarinpal.ewallets.purchase.OnCallbackRequestPaymentListener;
import com.zarinpal.ewallets.purchase.OnCallbackVerificationPaymentListener;
import com.zarinpal.ewallets.purchase.PaymentRequest;
import com.zarinpal.ewallets.purchase.ZarinPal;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "pay";
    String price;
    MethodChannel.Result resultt;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        if (getIntent().getData() != null) {

            ZarinPal.getPurchase(this).verificationPayment(getIntent().getData(), new OnCallbackVerificationPaymentListener() {
                @Override
                public void onCallbackResultVerificationPayment(boolean isPaymentSuccess, String refID, PaymentRequest paymentRequest) {
                    if (isPaymentSuccess) {
                        resultt.success("s");
                    } else {
                        resultt.error("f","f", null);
                    }
                }
            });
        }

        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        Toast.makeText(MainActivity.this,"amirhosen",Toast.LENGTH_LONG).show();
                        price = call.method;
                        resultt = result;
                        payment();
                    }
                });

    }

    private void payment() {

        PaymentRequest payment = ZarinPal.getPaymentRequest();


        payment.setMerchantID("d5dac2a0-5ce0-11e9-bfa0-000c295eb8fc");
        payment.setAmount(10);
        payment.setDescription("In App Purchase Test SDK");
        payment.setCallbackURL("app://amirhosen");


        ZarinPal.getPurchase(MainActivity.this).startPayment(payment, new OnCallbackRequestPaymentListener() {
            @Override
            public void onCallbackResultPaymentRequest(int status, String authority, Uri paymentGatewayUri, Intent intent) {

                startActivity(intent);
            }
        });


    }
}
