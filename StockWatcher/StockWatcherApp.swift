//
//  StockWatcherApp.swift
//  StockWatcher
//
//  Created by KEVIN DUELLMAN on 11/4/24.
//

import SwiftUI

@main
struct StockWatcherApp: App {

    init() {

       let appearance = UINavigationBarAppearance()
       
       appearance.largeTitleTextAttributes = [
        .font : UIFont.boldSystemFont(ofSize: 20),
           NSAttributedString.Key.foregroundColor : UIColor.black
       ]

       appearance.titleTextAttributes = [
           .font : UIFont.boldSystemFont(ofSize: 20),
           NSAttributedString.Key.foregroundColor : UIColor.black
       ]
       
       UINavigationBar.appearance().scrollEdgeAppearance = appearance
       UINavigationBar.appearance().standardAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            WatchlistView()
                .environmentObject(AuthService.shared)
        }
    }
}
