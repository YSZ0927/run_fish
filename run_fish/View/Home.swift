//
//  Home.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/1.
//

import SwiftUI

struct Home: View {
    @State private var isShow: Bool = false
    @State private var startTiming: Int = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init () {
        print("0000000000000:")
        print(CLLocation().horizontalAccuracy);
    }
    
    var body: some View {
        ScrollView {
//        Stack 视图 布局容器 使用 HStack (英文) 可以将视图置于水平线上，使用 VStack (英文) 可以将视图置于垂直线上，而使用 ZStack (英文) 则可以将视图相互叠放。
            if #available(iOS 15.0, *) {
                VStack{
                    HStack{
                        Text("即刻开跑！").font(.system(size: 24))
                    }.frame(width: UIScreen.screenWidth - 40, height: 80, alignment: Alignment.leading)
                    //            当在一个ZStack 中放置多个视图时，它们（默认）是从后往前渲染的，第一个视图被放置在后面。
                    ZStack {
                        AMapView()
                        RadialGradient(gradient: Gradient(colors: [.white.opacity(0), UITheme.backgroundColor]), center: .center, startRadius: 2, endRadius: 150)
                        
                    }.frame(height: 400)
                    HStack{
                        Button(action: {
                            print("点击了按钮")
                        }) {
                            Image("Found")
                        }
                        Button(action: {
                            print("点击了按钮")
                            startTiming = 3
                            withAnimation{
                                isShow = !isShow
                            }
                        }) {
                            Text("Go!")
                                .font(.system(size: 28))
                                .padding()
                                .background(UITheme.mainColor)
                                .foregroundColor(.red)
                                .cornerRadius(50)
                        }
                        Button(action: {
                            print("点击了按钮")
                        }) {
                            Image("My")
                        }
                    }.frame(width: UIScreen.screenWidth - 40, height: 80, alignment: Alignment.center)
                   
                }
                .frame(minHeight: UIScreen.screenHeight - 100, alignment: .topTrailing)
                .background(UITheme.backgroundColor)
                .fullScreenCover(isPresented: $isShow) {
                    Text("\(startTiming)s")
                        .onReceive(timer, perform: { _ in
                            if startTiming > 1 {
                                startTiming -= 1
                            } else {
                                isShow = false
                            }
                        })
                }
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

