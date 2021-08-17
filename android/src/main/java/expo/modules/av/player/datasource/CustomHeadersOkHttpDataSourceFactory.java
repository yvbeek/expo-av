package expo.modules.av.player.datasource;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.google.android.exoplayer2.ext.okhttp.OkHttpDataSource;
import com.google.android.exoplayer2.upstream.DataSource;
import com.google.android.exoplayer2.upstream.HttpDataSource;
import com.google.android.exoplayer2.upstream.TransferListener;

import java.net.HttpCookie;
import java.util.HashMap;
import java.util.Map;

import okhttp3.CacheControl;
import okhttp3.Call;

// Mainly a copy of com.google.android.exoplayer2.ext.okhttp.OkHttpDataSourceFactory,
// because it's declared as final :(
public class CustomHeadersOkHttpDataSourceFactory extends HttpDataSource.BaseFactory {
  @NonNull
  private final Call.Factory mCallFactory;
  @Nullable
  private final String mUserAgent;
  @Nullable
  private final CacheControl mCacheControl;

  public CustomHeadersOkHttpDataSourceFactory(@NonNull Call.Factory callFactory, @Nullable String userAgent, @Nullable Map<String, Object> requestHeaders) {
    super();
    mCallFactory = callFactory;
    mUserAgent = userAgent;
    mCacheControl = null;

    if (requestHeaders != null) {
      Map<String, String> headers = convertRequestHeaders(requestHeaders);
      setDefaultRequestProperties(headers);
    }
  }

  @NonNull
  protected Map<String, String> convertRequestHeaders(@NonNull Map<String, Object> requestHeaders) {
    Map<String, String> headers = new HashMap<>(1);

    for (Map.Entry<String, Object> headerEntry : requestHeaders.entrySet()) {
      if (headerEntry.getValue() instanceof String) {
        headers.put(headerEntry.getKey(), (String) headerEntry.getValue());
      }
    }

    return headers;
  }

  @NonNull
  protected OkHttpDataSource createDataSourceInternal(@NonNull HttpDataSource.RequestProperties defaultRequestProperties) {
    Map<String, String> requestProperties = defaultRequestProperties.getSnapshot();

    return new OkHttpDataSource.Factory(mCallFactory)
            .setUserAgent(mUserAgent)
            .setCacheControl(mCacheControl)
            .setDefaultRequestProperties(requestProperties)
            .createDataSource();
  }
}
