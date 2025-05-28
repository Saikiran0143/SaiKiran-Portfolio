//
//  ProjectListView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 15/05/25.
//

import SwiftUI


struct ProjectWorkView: View {

    @Environment(\.presentationMode) var popScreen
    @State var openProjectDetails: Bool = false
    @State private var selectedProject: Project?
    
    var body: some View {
        VStack {
            HStack {
                backButtonView
                Text("My Projects")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: -20) {
                    ForEach(myProjectsList) { project in
                        MyProjectCardView(projectDetails: project) 
                            .onTapGesture {
                                selectedProject = project
                                openProjectDetails = true
                                // see zomato ui to open details page
                            }
                    }
                }
            }
            popOvers()
        }
    }
    
    private var backButtonView: some View {
        Button(action: {
            popScreen.wrappedValue.dismiss()
        }) {
            Image(.back)
                .resizable()
                .frame(width: 38, height: 38)
        }
    }
    
    private func popOvers() -> some View {
        VStack {
        }
        .fullScreenCover(isPresented: Binding(
            get: { selectedProject != nil },
            set: { newValue in
                if !newValue {
                    selectedProject = nil
                }
            })
        ) {
            if let project = selectedProject {
                ProjectDetailsView(project: project)
            }
        }
//        .popover(isPresented: $openProjectDetails, content: {
//            if let selectedProject {
//                ProjectDetailsView(project: selectedProject)
//            } else {
//                Text("No project selected.")
//            }
//        })
    }
}

#Preview {
    ProjectWorkView()
}
