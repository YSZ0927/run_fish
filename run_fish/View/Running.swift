//
//  Running.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/10/13.
//

import SwiftUI

struct Running: View {
    var body: some View {
        ZStack {
            AMapView()
        }.frame( maxHeight: .infinity)
    }
}

struct Running_Previews: PreviewProvider {
    static var previews: some View {
        Running()
    }
}
