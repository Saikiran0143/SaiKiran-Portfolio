//
//  MyProfileView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 29/05/25.
//

import SwiftUI

struct MyProfileView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // MARK: - Profile Header
                VStack(spacing: 12) {
                    HStack {
                        backButtonView()
                        Spacer()
                    }
                    .padding(.bottom, -60)
                    Image("profilePhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 10)

                    Text("Sai Kiran")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("iOS Developer • Swift • SwiftUI")
                        .font(.subheadline)
                        .foregroundColor(.gray)

                    Button(action: {
                        openResume()
                    }) {
                        Text("Download Resume")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }

                Divider()

                // MARK: - About Me
                VStack(alignment: .leading, spacing: 8) {
                    Text("About Me")
                        .font(.headline)

                    Text("""
                    I'm an iOS developer with a strong passion for building elegant, user-friendly mobile experiences. I specialize in Swift and SwiftUI, and love turning ideas into clean, functional apps.
                    """)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)

                // MARK: - Skills
                VStack(alignment: .leading, spacing: 8) {
                    Text("Skills")
                        .font(.headline)

                    SkillsCapsuleView(skills: ["Swift", "SwiftUI", "Combine", "UIKit", "Firebase", "MVVM", "TCA"])
                }
                .padding(.horizontal)

                // MARK: - Social Links
                VStack(alignment: .leading, spacing: 12) {
                    Text("Find Me Online")
                        .font(.headline)

                    VStack(alignment: .leading, spacing: 10) {
                        SocialLinkView(platform: "GitHub", icon: "logo.github", url: "https://github.com/your-username")
                        SocialLinkView(platform: "LinkedIn", icon: "logo.linkedin", url: "https://linkedin.com/in/your-profile")
                        SocialLinkView(platform: "Mail", icon: "logo.twitter", url: "https://twitter.com/your-handle")
                    }
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
    }

    // MARK: - Resume Open Function
    func openResume() {
        if let url = URL(string: "https://yourdomain.com/resume.pdf") {
            UIApplication.shared.open(url)
        }
    }
    
    private func backButtonView() -> some View {
        HStack(spacing: 16) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(.back)
                        .resizable()
                        .frame(width: 38, height: 38)
                }
            }
        }
        .background(Color.background)
        .cornerRadius(40)
    }
}

// MARK: - Social Link View
struct SocialLinkView: View {
    let platform: String
    let icon: String
    let url: String

    var body: some View {
        Button(action: {
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(platform)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 6)
        }
    }
}

// MARK: - Skills Capsule View (Fixed Layout)
struct SkillsCapsuleView: View {
    let skills: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(chunked(skills, into: 4), id: \.self) { row in
                HStack(spacing: 12) {
                    ForEach(row, id: \.self) { skill in
                        Text(skill)
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.pink.opacity(0.15))
                            .foregroundColor(.pink)
                            .clipShape(Capsule())
                    }
                    Spacer()
                }
            }
        }
    }

    // Helper to chunk array into rows
    func chunked<T>(_ array: [T], into size: Int) -> [[T]] {
        stride(from: 0, to: array.count, by: size).map {
            Array(array[$0..<min($0 + size, array.count)])
        }
    }
}

// MARK: - Preview
#Preview {
    MyProfileView()
}
