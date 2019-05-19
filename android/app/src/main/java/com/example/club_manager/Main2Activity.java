package dev.hydra.club_manager;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.zarinpal.ewallets.purchase.OnCallbackRequestPaymentListener;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Main2Activity extends Activity {
    String price;
    String userName;
    String token = "Token b893d1e8672b62c6c1507e4b2841f1030a6a173d";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);
        price = getIntent().getStringExtra("price");
        if (price != null) {
            userName = price.substring(0, 11);
            price = price.substring(11);
            Data.userName=userName;
            Data.price = price;
        }

        if (getIntent().getData() != null) {
            if (getIntent().getData().getQueryParameter("Status").equals("NOK")) {
                Data.isSucsses = false;
            } else {
                Data.isSucsses = true;
            }
            new Payment().execute();

        } else {
            new Payment().execute();
        }


    }

    OnCallbackRequestPaymentListener listener = new OnCallbackRequestPaymentListener() {
        @Override
        public void onCallbackResultPaymentRequest(int status, String authority, Uri paymentGatewayUri, Intent intent) {
            startActivity(intent);
        }
    };


    @SuppressLint("StaticFieldLeak")
    public class Payment extends AsyncTask<Void, Void, Void> {

        @Override
        protected void onPreExecute() {
            super.onPreExecute();
        }

        @Override
        protected Void doInBackground(Void... arg0) {
            if (getIntent().getData() == null) {

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
            } else {
                OkHttpClient client = new OkHttpClient();

                MediaType MEDIA_TYPE = MediaType.parse("application/json");
                String url = "http://185.213.166.42:8000/api/accounting/cash-create/";


                JSONObject postData = new JSONObject();
                try {
                    postData.put("amount", Data.userName);
                    postData.put("username", Data.price);
                } catch (JSONException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
                RequestBody body = RequestBody.create(MEDIA_TYPE, postData.toString());

                Request request = new Request.Builder()
                        .url(url)
                        .post(body).addHeader("Authorization", token)
                        .build();
                try {
                    Response response = client.newCall(request).execute();
                    assert response.body() != null;
                    startActivity(new Intent(Main2Activity.this, MainActivity.class));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void result) {
            super.onPostExecute(result);

        }

    }


}
