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
    @State private var selectedProject: Project? = nil
    
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
            navigation()
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
    
    private func navigation() -> some View {
        VStack {
        }
        .navigationDestination(isPresented: $openProjectDetails) {
            if let selectedProject {
                ProjectDetailsView(project: selectedProject)
            } else {
                Text("No project selected.")
            }
        }
    }
}

#Preview {
    ProjectWorkView()
}


struct ProjectsListView: View {
    let projects: [Project] = myProjectsList

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(projects) { project in
                        NavigationLink(destination: ProjectDetailView(project: project)) {
                            ProjectCardView(project: project)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .navigationTitle("My Projects")
        }
    }
}

struct ProjectCardView: View {
    let project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: project.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading) {
                    Text(project.title)
                        .font(.headline)
                    Text(project.subtitle)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
}

struct ProjectDetailView: View {
    let project: Project

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(systemName: project.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundColor(.blue)
                    .padding()

                Text(project.title)
                    .font(.title)
                    .fontWeight(.bold)

                Text(project.description)
                    .font(.body)
                    .foregroundColor(.primary)

                Divider()

                Text("Tech Stack")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(project.techStack, id: \.self) { tech in
                        Label(tech, systemImage: "chevron.right")
                            .foregroundColor(.secondary)
                    }
                }

                Divider()

                Button(action: {
                    UIApplication.shared.open(project.githubURL)
                }) {
                    HStack {
                        Image(systemName: "link")
                        Text("View on GitHub")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle(project.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
