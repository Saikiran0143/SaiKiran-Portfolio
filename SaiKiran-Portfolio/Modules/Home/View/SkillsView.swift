//
//  SkillsView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import SwiftUI

struct SkillsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                backButtonView()
                Spacer()
            }
            .padding(.leading, 30)
            .padding(.bottom, 8)

            ScrollView {
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(skillData) { skill in
                        skillsCard(title: skill.title, image: skill.icon)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .background(Color.background)
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
                    Text("Skills")
                        .font(.system(size: 40).bold())
                        .fontWeight(.bold)
                        .foregroundColor(.skillDarkMode)
                }
            }
        }
        .frame(width: 150, height: 48)
        .background(Color.background)
        .cornerRadius(40)
    }
}

#Preview {
    SkillsView()
}

struct skillsCard: View {
    
    var title: String = "SWIFT"
    var image: String = "Swift"
    
    var body: some View {
        VStack {
            VStack {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor( title == "SwiftUI" ? .blue : .skillDarkMode)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 100)
                    .offset(y: 40)
                
                Spacer()
                
                Text(title)
                    .font(.system(size: 28).bold())
                    .fontWeight(.bold)
                    .foregroundColor(.skillDarkMode)
                    .padding(30)
            }
            .frame(
                width: (UIScreen.main.bounds.width / 2) - 10,
                height: 250
            )
        }
        .background(Color.skillsBackground)
        .cornerRadius(30)
    }
}
