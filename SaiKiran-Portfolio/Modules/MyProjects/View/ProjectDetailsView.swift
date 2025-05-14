//
//  ProjectDetailsView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 15/05/25.
//

import SwiftUI

struct ProjectDetailsView: View {
    let project: Project
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    if let data = myProjectsList.first {
        ProjectDetailsView(project: data)
    }
}
