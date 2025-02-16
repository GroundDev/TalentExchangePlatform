//
//  TalentExchangeApp.swift
//  TalentExchange
//
//  Created by Chanhee Jeong on 2022/04/07.
//

import SwiftUI

enum Screen {
    case home //tab1
    case explore //tab2
    case chat //tab3
    case mypage //tab4
}

// 탭이동
final class TabRouter: ObservableObject {
    
    @Published var screen: Screen = .home //스크린 변화를 듣는 변수
    
    func changes(to screen: Screen) {
        self.screen = screen
    }
}



@main
struct TalentExchangeApp: App {
    @StateObject var router = TabRouter()
    
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $router.screen){ // 라우터의 현재 value에 맞춰 스크린 변함
                HomeView()
//                    .badge(10) => alert 개수 `control
                    .tag(Screen.home)
                    .environmentObject(router)
                    .tabItem{
                        Label("Home", systemImage: "house")
                    }
                ExploreView()
                    .tag(Screen.explore)
                    .environmentObject(router)
                    .tabItem{
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                ChatView()
                    .tag(Screen.chat)
                    .environmentObject(router)
                    .tabItem{
                        Label("Chat", systemImage: "message")
                    }
                MyPageView()
                    .tag(Screen.mypage)
                    .environmentObject(router)
                    .tabItem{
                        Label("Profile", systemImage: "person.crop.circle")
                    }
                
            }
        }
    }
}
