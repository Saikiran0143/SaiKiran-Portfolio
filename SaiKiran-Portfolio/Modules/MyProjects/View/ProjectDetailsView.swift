//
//  ProjectDetailsView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 15/05/25.
//

import SwiftUI

struct ProjectDetailsView: View {
    let project: Project
    @State private var currentImageIndex = 0
    @Environment(\.presentationMode) var presentationMode
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                topDismissButton()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        imageCarousel()
                        pageIndicator()
                        projectContent(minHeight: geometry.size.height * 0.5)
                    }
                }
                bottomActionBar()
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
            .onReceive(timer) { _ in
                withAnimation {
                    currentImageIndex = (currentImageIndex + 1) % project.imageName.count
                }
            }
        }
    }

    // MARK: - Top Dismiss Button
    private func topDismissButton() -> some View {
        HStack {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.white)
                .frame(width: 35, height: 35)
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .frame(height: 100)
        .background(Color(red: 24/255, green: 24/255, blue: 28/255))
    }

    // MARK: - Auto-Scrolling Image Carousel
    private func imageCarousel() -> some View {
        TabView(selection: $currentImageIndex) {
            ForEach(Array(project.imageName.enumerated()), id: \.offset) { index, image in
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 210)
                    .clipped()
                    .cornerRadius(20)
                    .padding(.horizontal, 16)
                    .tag(index)
            }
        }
        .frame(height: 230)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }

    // MARK: - Page Indicator Dots
    private func pageIndicator() -> some View {
        HStack(spacing: 8) {
            ForEach(0..<project.imageName.count, id: \.self) { index in
                Circle()
                    .fill(index == currentImageIndex ? Color.white : Color.gray)
                    .frame(width: 8, height: 8)
            }
        }
        .padding(.top, 8)
    }

    // MARK: - Title + TechStack + Description
    private func projectContent(minHeight: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(project.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(project.techStack, id: \.self) { tech in
                        Text(tech)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Capsule())
                    }
                }
            }

            Text(project.description)
                .font(.body)
                .foregroundColor(.white)
                .padding(.top, 4)

            Spacer(minLength: 40)
        }
        .padding()
        .frame(minHeight: minHeight)
        .background(Color(red: 24/255, green: 24/255, blue: 28/255))
        .cornerRadius(20)
        .padding(.top)
    }

    // MARK: - Bottom Button Bar
    private func bottomActionBar() -> some View {
        HStack(spacing: 16) {
            Button(action: {
                UIApplication.shared.open(project.githubURL)
            }) {
                Text("View Project")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .background(Color.black)
    }
}

#Preview {
    ProjectDetailsView(project: Project(
        title: "Weather App",
        subtitle: "Weather details",
        imageName: ["architecture", "appleLogo1"],
        description: "Simple app to show current weather using SwiftUI and OpenWeather API.",
        techStack: ["SwiftUI", "Swift", "API"],
        githubURL: URL(string: "https://github.com/yourusername/MovieSearch")!
    ))
}
