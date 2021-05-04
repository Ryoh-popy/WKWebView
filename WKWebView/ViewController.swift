//
//  ViewController.swift
//  WKWebView
//
//  Created by Ryoh on 2021/05/04.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate{

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var toolBar: UIToolbar!
    
    var webView = WKWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.isHidden = true
        
        //大きさを決めていく
        webView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - toolBar.frame.size.height)
        
        // viewにWebViewを加える
        view.addSubview(webView)
        
        
        webView.navigationDelegate = self
        
        //URLロード URLにキャスト
        let url = URL(string: "https://github.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // レイヤーを手前に
        indicator.layer.zPosition = 2
        
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // ロードが完了した時に呼ばれるデリゲートメソッド
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        // 読み込みが開始した時に呼ばれるデリゲートメソッド
        indicator.isHidden = false
        indicator.startAnimating()
    }

    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    
    
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
}

