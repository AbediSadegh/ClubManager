package com.example.club_manager;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
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

import java.io.IOException;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

import static javax.xml.transform.OutputKeys.MEDIA_TYPE;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "pay";
    private static final String CHECk = "check";
    String price;
    OnCallbackRequestPaymentListener listener = new OnCallbackRequestPaymentListener() {
        @Override
        public void onCallbackResultPaymentRequest(int status, String authority, Uri paymentGatewayUri, Intent intent) {
            startActivity(intent);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);


        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        price = call.method;
                        startActivity(new Intent(MainActivity.this, Main2Activity.class).putExtra("price",price));
                    }
                });

        new MethodChannel(getFlutterView(), CHECk).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        if (Data.isSucsses)
                            result.success(1);
                        else result.success(0);
                    }
                });


    }

    @SuppressLint("StaticFieldLeak")
    public class Payment extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        @Override
        protected Void doInBackground(Void... arg0) {
            OkHttpClient client = new OkHttpClient();

            MediaType MEDIA_TYPE = MediaType.parse("application/json");
            String url = "http://185.213.166.42:8000/api/zarinpal/request/";


            JSONObject postData = new JSONObject();
            try {
                postData.put("amount", price);
                postData.put("mobile", "09196675357");
                postData.put("callback_url", "app://app");
            } catch (JSONException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            RequestBody body = RequestBody.create(MEDIA_TYPE, postData.toString());

            Request request = new Request.Builder()
                    .url(url)
                    .post(body)
                    .build();
            try {
                Response response = client.newCall(request).execute();
                assert response.body() != null;
                String data = response.body().string();
                JSONObject jsonObj = new JSONObject(data);
                Uri uri = Uri.parse(jsonObj.getString("url"));
                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                listener.onCallbackResultPaymentRequest(1, "a", uri, intent);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (JSONException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);

        }

    }

}
