//
//  MyprojectCard.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 15/05/25.
//

import SwiftUI

struct PopeyesCardView: View {
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Top Image Section
            ZStack(alignment: .topLeading) {
                Image(.fireBase)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 220)
                    .clipped()
                    .cornerRadius(30, corners: [.topLeft, .topRight])
//                    .overlay(topLeftLabel, alignment: .topLeading)
//                    .overlay(topRightIcons, alignment: .topTrailing)
//                    .overlay(bottomLeftInfo, alignment: .bottomLeading)
//                    .overlay(bottomRightDots, alignment: .bottomTrailing)
            }

            // MARK: - Bottom Info Section
            VStack(alignment: .leading, spacing: 16) {
                titleRow
                badgesRow
                description
            }
            .padding(20)
            .background(Color(red: 26/255, green: 26/255, blue: 35/255))
            .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
        }
        .background(Color(red: 26/255, green: 26/255, blue: 35/255))
        .cornerRadius(30)
        .padding()
        .edgesIgnoringSafeArea(.all)
    }

    // MARK: - Overlays
    private var topLeftLabel: some View {
        HStack(spacing: 4) {
            Text("Popeyes Signature Fri…")
                .lineLimit(1)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
                .truncationMode(.tail)

            Text("· ₹119")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color(red: 58/255, green: 31/255, blue: 10/255))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.top, 16)
        .padding(.leading, 16)
    }

    private var topRightIcons: some View {
        HStack(spacing: 24) {
            Image(systemName: "bookmark")
            Image(systemName: "eye.slash")
        }
        .font(.system(size: 28))
        .foregroundColor(.white)
        .padding(.top, 16)
        .padding(.trailing, 16)
    }

    private var bottomLeftInfo: some View {
        HStack(spacing: 6) {
            Image(systemName: "clock")
            Text("35–40 mins")
            Text("·")
            Text("1.2 km")
        }
        .font(.system(size: 18))
        .foregroundColor(Color(white: 0.8))
        .padding(.leading, 16)
        .padding(.bottom, 12)
    }

    private var bottomRightDots: some View {
        HStack(spacing: 6) {
            ForEach(0..<3) { _ in Circle().fill(Color.white.opacity(0.4)).frame(width: 10, height: 10) }
            Capsule().fill(Color.white).frame(width: 32, height: 10)
            ForEach(0..<5) { _ in Circle().fill(Color.white.opacity(0.4)).frame(width: 10, height: 10) }
        }
        .padding(.trailing, 16)
        .padding(.bottom, 12)
    }

    // MARK: - Bottom Content
    private var titleRow: some View {
        HStack {
            Text("Popeyes")
                .font(.system(size: 32, weight: .heavy))
                .foregroundColor(.white)

            Spacer()

//            HStack(spacing: 6) {
//                Text("4.2")
//                    .font(.system(size: 18, weight: .semibold))
//                Image(systemName: "star.fill")
//            }
//            .padding(.horizontal, 12)
//            .padding(.vertical, 6)
//            .background(Color(red: 31/255, green: 79/255, blue: 46/255))
//            .foregroundColor(.white)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }

    private var badgesRow: some View {
        HStack(spacing: 12) {
            capsuleLabel("Swift")
            capsuleLabel("SwiftUI")
        }
    }

    private func capsuleLabel(_ text: String) -> some View {
        Label(text, systemImage: "checkmark")
            .font(.system(size: 18))
            .foregroundColor(Color(white: 0.7))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(red: 58/255, green: 58/255, blue: 58/255))
            .clipShape(Capsule())
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color(red: 31/255, green: 79/255, blue: 46/255), Color(white: 0.7))
    }

    private var description: some View {
        HStack(spacing: 8) {
            Image(systemName: "percent")
                .font(.system(size: 24))
                .foregroundColor(Color(red: 42/255, green: 61/255, blue: 177/255))

            Text("Description ")
                .font(.system(size: 14, weight: .light))
                .foregroundColor(.white)
        }
    }
}

// MARK: - Corner Radius Utility
fileprivate extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

fileprivate struct RoundedCorner: Shape {
    var radius: CGFloat = 0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

// MARK: - Preview
struct PopeyesCardView_Previews: PreviewProvider {
    static var previews: some View {
        PopeyesCardView()
    }
}
