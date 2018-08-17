package oauth.bo;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import oauth.model.NaverLoginApi;

public class NaverLoginBO {

	private final static String CLIENT_ID = "4LYyTJe4x9KNcDetQBAQ";
	private final static String CLIENT_SECRET = "A4e97xDj6F";
	private final static String REDIRECT_URI = "http://localhost:8090/moons/loginProNaver.do";
	private final static String SESSION_STATE = "oauth_state";
	
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	/* 네아로 인증 URL 생성 Method */
	public String getAuthorizationUrl(HttpSession session) {
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());

		return oauthService.getAuthorizationUrl();
	}
	
	/* 네아로 Callback 처리 및  AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		if(StringUtils.equals(sessionState, state)){
		
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
					
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);		
	}

	/* http session에서 데이터 가져오기 */	
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	/* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{
		OAuth20Service oauthService =new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI).build(NaverLoginApi.instance());
    	
    		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	public URL getUnLinkURL(OAuth2AccessToken oauthToken) throws IOException {	
		StringBuilder url = new StringBuilder("https://nid.naver.com/oauth2.0/token");
		url.append("?" + URLEncoder.encode("client_id", "UTF-8") + "=" + URLEncoder.encode(CLIENT_ID, "UTF-8"));
		url.append("&" + URLEncoder.encode("client_secret", "UTF-8") + "=" + URLEncoder.encode(CLIENT_SECRET, "UTF-8"));
		url.append("&" + URLEncoder.encode("grant_type", "UTF-8") + "=" + URLEncoder.encode("delete", "UTF-8"));
		url.append("&" + URLEncoder.encode("access_token", "UTF-8") + "=" + URLEncoder.encode(oauthToken.getAccessToken(), "UTF-8"));
		url.append("&" + URLEncoder.encode("service_provider", "UTF-8") + "=" + URLEncoder.encode("NAVER", "UTF-8"));
		URL urlL = new URL(url.toString());
		return urlL;
	}

	public static String getClientId() {
		return CLIENT_ID;
	}

	public static String getClientSecret() {
		return CLIENT_SECRET;
	}
}