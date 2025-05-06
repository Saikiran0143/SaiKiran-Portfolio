//
//  RootView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import Foundation
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NavigationStack {
                Home()
            }
            .tabItem {
               
            }
            .tag(1)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#Preview {
    RootView()
}
