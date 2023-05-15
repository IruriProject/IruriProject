package spring.mvc.controller.kakaoApi;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KakaoOAuthApi extends DefaultApi20 {

	protected KakaoOAuthApi() {
		
	}
	
	private static class InstanceHolder{
		private static final KakaoOAuthApi INSTANCE=new KakaoOAuthApi();
	}
	
	public static KakaoOAuthApi instance() {
		return InstanceHolder.INSTANCE;
	}
	
	
	@Override
	public String getAccessTokenEndpoint() {
		// TODO Auto-generated method stub
		return "https://kauth.kakao.com/oauth/token";
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		// TODO Auto-generated method stub
		return "https://kauth.kakao.com/oauth/authorize";
	}
	
	
}