//
//  CustomerTabBar.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/1.
//

import SwiftUI

struct CustomerTabBar: View {
    @Binding var currentTab : Tab
    // MARK : To Animate Like Curve
    // 动画曲线
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader{ proxy in
            // 获取整体的宽度
//            let width = proxy.size.width
            HStack(spacing:0) {
                ForEach(Tab.allCases, id:\.rawValue){tab in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            currentTab = tab
                            yOffset = -60
                        }
                        withAnimation(.easeInOut(duration: 0.1).delay(0.07)){
                            yOffset = 0
                        }
                    } label: {
                        Image(tab.rawValue)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .red : .gray)
                        
                        // MARK : Little Scaling Effect
                        // 图表一个缩放动画效果
                            .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                    }

                }
            }
            }
            .frame(height:30)
            .padding(.bottom,10)
            .padding([.horizontal,.top])
        }
    func getIndex() -> Int {
        switch currentTab {
        case .home:
            return 0
        case .found:
            return 1
        case .my:
            return 2
        }
    }
}
