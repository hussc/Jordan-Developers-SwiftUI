//
//  WebView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/30/20.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
  @Binding var text: String
   
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
   
  func updateUIView(_ uiView: WKWebView, context: Context) {
    uiView.loadHTMLString(text, baseURL: nil)
  }
}

struct WebView_Previews: PreviewProvider {
  static var previews: some View {
    WebView(text: .constant(""))
  }
}
