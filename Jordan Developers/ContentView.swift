//
//  ContentView.swift
//  Jordan Developers
//
//  Created by Hussein The Area on 10/15/20.
//

import SwiftUI
import Resolver

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.monospacedSystemFont(ofSize: 16, weight: .bold)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.font: UIFont.monospacedSystemFont(ofSize: 28, weight: .heavy)]
    }
    
    var body: some View {
        JobsListView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
    register { JobsAPIRepository() as JobRepository }.scope(application)
  }
}
