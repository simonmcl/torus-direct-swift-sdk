import UIKit
import Foundation
import PromiseKit

// MARK: - login providers
public enum LoginProviders : String {
    case google = "google"
    case facebook = "facebook"
    case twitch = "twitch"
    case reddit = "reddit"
    case discord = "discord"
    case apple = "apple"
    case github = "github"
    case linkedin = "linkedin"
    case kakao = "kakao"
    case twitter = "twitter"
    case weibo = "weibo"
    case line = "line"
    case wechat = "wechat"
    case email_password = "Username-Password-Authentication"
    case jwt = "jwt"
    
	func getHandler(loginType: SubVerifierType, clientID: String, redirectURL: String, browserRedirectURL: String?,  extraQueryParams: [String:String], jwtParams: [String: String], session: URLSession) -> AbstractLoginHandler {
        switch self {
            case .google:
                return GoogleloginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, extraQueryParams: extraQueryParams, session: session)
            case .facebook:
                return FacebookLoginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, extraQueryParams: extraQueryParams, session: session)
            case .twitch:
                return TwitchLoginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, extraQueryParams: extraQueryParams, session: session)
            case .reddit:
                return RedditLoginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, extraQueryParams: extraQueryParams, session: session)
            case .discord:
                return DiscordLoginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, extraQueryParams: extraQueryParams, session: session)
            case .apple, .github, .linkedin, .twitter, .weibo, .kakao, .line, .wechat, .email_password, .jwt:
                return JWTLoginHandler(loginType: loginType, clientID: clientID, redirectURL: redirectURL, browserRedirectURL: browserRedirectURL, jwtParams: jwtParams, extraQueryParams: extraQueryParams, connection: self, session: session)
        }
    }
}

