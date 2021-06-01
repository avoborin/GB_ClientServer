//
//  VKAuthorizationViewController.swift
//  UILesson01HT
//
//  Created by Антон Оборин on 31.05.2021.
//

import UIKit
import WebKit
import Alamofire

class VKAuthorizationViewController: UIViewController {

    let fromVKAuthorizationToVKMethodSegue = "vkMethod"
    
    
    
    @IBOutlet weak var vkAuthWebView: WKWebView! {
        didSet {
            vkAuthWebView.navigationDelegate = self
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //performSegue(withIdentifier: self.fromVKAuthorizationToVKMethodSegue, sender: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var urlComponents = URLComponents()
                urlComponents.scheme = "https"
                urlComponents.host = "oauth.vk.com"
                urlComponents.path = "/authorize"
                urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7868463"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.68")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
        vkAuthWebView.load(request)
        
    }

}

extension VKAuthorizationViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
                    decisionHandler(.allow)
                    return
                }
                
                let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in
                        var dict = result
                        let key = param[0]
                        let value = param[1]
                        dict[key] = value
                        return dict
                }
                
                let token = params["access_token"]
        
        if let token = token {
            Session.shared.token = token
        }
        
        print("TOKEN")
        print(token!)
                
        getfriends()
        getUsersPhoto()
        getUsersGroups()
        getGroupSearch()
        
        decisionHandler(.cancel)
        
    }
}
