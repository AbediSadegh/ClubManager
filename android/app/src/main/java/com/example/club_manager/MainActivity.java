package com.example.club_manager;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.zarinpal.ewallets.purchase.HttpRequest;
import com.zarinpal.ewallets.purchase.HttpRequestListener;
import com.zarinpal.ewallets.purchase.OnCallbackRequestPaymentListener;
import com.zarinpal.ewallets.purchase.OnCallbackVerificationPaymentListener;
import com.zarinpal.ewallets.purchase.PaymentRequest;
import com.zarinpal.ewallets.purchase.ZarinPal;

import org.json.JSONException;
import org.json.JSONObject;

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
        payment.setDescription("پرداخت شهریه شرکت در دوره مدرسه فوتبال شهرخودرو");
        payment.setCallbackURL("app://amirhosen");
        payment.setEmail("amirhosen.ebrahimi@gmail.com");
        payment.setMobile("09196675357");

        ZarinPal.getPurchase(MainActivity.this).startPayment(payment, new OnCallbackRequestPaymentListener() {
            @Override
            public void onCallbackResultPaymentRequest(int status, String authority, Uri paymentGatewayUri, Intent intent) {
                startActivity(intent);
            }
        });


    }

}
