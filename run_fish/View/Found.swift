//
//  Found.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/8.
//

import SwiftUI

@available(iOS 14.0, *)
struct Found: View {
    var body: some View {
        ZStack {
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()

                    Text("by Sundell")
                        .foregroundColor(.white)
                        .font(.title)
            Text("jsjsjjsjsl")
                .foregroundColor(.black)
                .font(.title)
                }

    }
}

@available(iOS 14.0, *)
struct Found_Previews: PreviewProvider {
    static var previews: some View {
        Found()
    }
}
