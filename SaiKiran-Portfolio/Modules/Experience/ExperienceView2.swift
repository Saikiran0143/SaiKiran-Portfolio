//
//  ExperienceView2.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 29/05/25.
//

import SwiftUI

struct ExperienceView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Experience")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(experiences) { exp in
                        experienceCard(exp)
                    }
                }
                .padding()
            }
        }
        .background(Color.black.ignoresSafeArea())
    }

    private func experienceCard(_ exp: Experience) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(exp.role)
                        .font(.headline)
                        .foregroundColor(.white)

                    Text(exp.company)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Text(exp.duration)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Text(exp.description)
                .font(.body)
                .foregroundColor(.white)

            HStack {
                ForEach(exp.techStack, id: \.self) { tech in
                    Text(tech)
                        .font(.caption2)
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.pink.opacity(0.7))
                        .clipShape(Capsule())
                }
            }
        }
        .padding()
        .background(Color(red: 30/255, green: 30/255, blue: 36/255))
        .cornerRadius(15)
        .shadow(radius: 4)
    }
}

#Preview {
    ExperienceView2()
}
