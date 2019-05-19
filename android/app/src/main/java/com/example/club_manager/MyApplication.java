package dev.hydra.club_manager;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.support.annotation.CallSuper;
import android.support.multidex.MultiDex;
import android.support.multidex.MultiDexApplication;

import io.flutter.view.FlutterMain;

public class MyApplication extends MultiDexApplication  {
    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
        MultiDex.install(this);
    }
    private Activity mCurrentActivity = null;

    public MyApplication() {
    }

    @CallSuper
    public void onCreate() {
        super.onCreate();
        FlutterMain.startInitialization(this);
    }

    public Activity getCurrentActivity() {
        return this.mCurrentActivity;
    }

    public void setCurrentActivity(Activity mCurrentActivity) {
        this.mCurrentActivity = mCurrentActivity;
    }
}
