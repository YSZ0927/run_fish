//
//  ContentView.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/8.
//

import SwiftUI

@available(iOS 15.0, *)
struct ContentView: View {
    init(){
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab : Tab = .home
    var body: some View {
            VStack(spacing: 0){
                TabView(selection: $currentTab) {
                    // MARK: Need to Apply BG For Each Tab View
                    // 需要为每个标签视图应用BG
                    Running()
                        .ApplyBG()
                        .tag(Tab.found)
                    Home()
                        .ApplyBG()
                        .tag(Tab.home)
                    Text("My")
                        .ApplyBG()
                        .tag(Tab.my)

                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight - 100)
                CustomerTabBar(currentTab: $currentTab)
            }
        }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    @available(iOS 15.0, *)
    func ApplyBG() -> some View {
        // infinity 无穷的
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color(red: 255, green: 255, blue: 255)
                .ignoresSafeArea()
            }
    }
}

//extension UIScreen{
//   static let screenWidth = UIScreen.main.bounds.size.width
//   static let screenHeight = UIScreen.main.bounds.size.height
//   static let screenSize = UIScreen.main.bounds.size
//}
