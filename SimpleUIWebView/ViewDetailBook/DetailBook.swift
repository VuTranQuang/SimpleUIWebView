//
//  DetailBook.swift
//  SimpleUIWebView
//
//  Created by RTC-HN154 on 10/11/19.
//  Copyright © 2019 RTC-HN154. All rights reserved.
//

import UIKit

class DetailBook: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    
    @IBOutlet weak var btnShowDate: UIButton!
    var urlString: String!
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = urlString
        self.webView.delegate = self
        self.myActive.startAnimating()
        var urlPath = "default"
        
        switch type {
        case "PDF":
            urlPath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
            btnShowDate.isHidden = true
        case "DOCX":
            urlPath = Bundle.main.path(forResource: urlString, ofType: "docx")!
            btnShowDate.isHidden = true
        case "HTML":
            urlPath = Bundle.main.path(forResource: urlString, ofType: "html")!
        default:
            break
        }
        let url = URL(fileURLWithPath: urlPath)
        let urlRequest = URLRequest(url: url)
        self.webView.loadRequest(urlRequest)
    }
    
    @IBAction func onClickBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Sử dụng 1 vài đoạn mã cơ bản của java
    @IBAction func getCurrentTime(_ sender: UIButton) {
        self.webView.stringByEvaluatingJavaScript(from: "hello();")
    }
    
   

}

extension DetailBook: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActive.isHidden = true
        myActive.stopAnimating()
    }
}
