//
//  MyLinkedlnView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 14/05/25.
//

import SwiftUI

struct LinkedInProfileView: View {
    
    @Environment(\.presentationMode) var popScreen
    
    var body: some View {
        VStack(spacing: 16) {

            HStack(spacing: 1) {
                backButtonView
                Image(.lindelnLogo)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                Spacer()
            }

            // Profile Picture
            Image("profile_photo")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .shadow(radius: 4)

            // Name
            Text("Sai Kiran")
                .font(.title2)
                .fontWeight(.semibold)

            Text("iOS Developer \n Swift | SwiftUI | UIKit | CoreData")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            // Location & Experience
            HStack(spacing: 8) {
                Label("Bengaluru, Karnataka", systemImage: "mappin.and.ellipse")
                Spacer()
            }
            .font(.subheadline)
            .padding(.horizontal)

            HStack(spacing: 8) {
                Label("IOS Developer @Frnd", systemImage: "briefcase")
                Spacer()
            }
            .font(.subheadline)
            .padding(.horizontal)

            // LinkedIn Button
            Button(action: {
                if let url = URL(string: "https://www.linkedin.com/in/e-sai-kirankumar-gowd-98540b277/") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Connect")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top, -10)
        .padding([.leading, .trailing], 16)
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
}

#Preview {
    LinkedInProfileView()
}
