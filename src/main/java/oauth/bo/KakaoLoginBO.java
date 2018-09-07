package oauth.bo;

import java.net.MalformedURLException;
import java.net.URL;

public class KakaoLoginBO {
	private final static String clientId="98e3d6c2b978895622a5cf46cf1a0f6c"; //카카오에서 받은 REST API 키
	private final static String redirectUri="http://192.168.10.61:8090/moons/loginProKakao.do"; //카카오에 등록한 redirectUri
	private final static String adminKey="9b160e46187a41c4d6274e015fc0bd57"; //카카오에서 받은 Admin 키
	
	public URL getAuthorizationUrl() throws MalformedURLException {
		String url="https://kauth.kakao.com/oauth/authorize?";
		url+="client_id="+clientId;
		url+="&redirect_uri="+redirectUri;
		url+="&response_type=code";
		URL urlL = new URL(url);
		return urlL;
	}
	
	public URL getAccessTokenUrl(String code) throws MalformedURLException {	
		String url="https://kauth.kakao.com/oauth/token?";
		url +="grant_type=authorization_code";
		url +="&client_id="+clientId;
		url +="&redirect_uri="+redirectUri;
		url +="&code="+code;
		URL urlL = new URL(url);
		return urlL;
	}
	
	public URL getAccessProfileUrl() throws MalformedURLException {	
		String url="https://kapi.kakao.com/v1/user/me";
		URL urlL = new URL(url);
		return urlL;
	}
	
	public URL getUnLinkUrl() throws MalformedURLException {	
		String url="https://kapi.kakao.com/v1/user/unlink";
		URL urlL = new URL(url);
		return urlL;
	}
	
	public URL getLogoutUrl() throws MalformedURLException {	
		String url="https://kapi.kakao.com/v1/user/logout";
		URL urlL = new URL(url);
		return urlL;
	}
}