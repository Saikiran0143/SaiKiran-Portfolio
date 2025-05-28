//
//  ExperienceDTO.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 29/05/25.
//

import Foundation

struct Experience: Identifiable {
    let id = UUID()
    let role: String
    let company: String
    let duration: String
    let description: String
    let techStack: [String]
}

let experiences: [Experience] = [
    Experience(role: "iOS Developer", company: "Xcel Corp", duration: " March 2024 – feb 2025", description: "Worked as an iOS Developer where I developed CricDost, a real-time cricket scoring app in UIKit", techStack: ["UIKit", "Swift", "Alamofire","Firebase","MapKit","ObjectMapper","SwiftyJson","MVVM"]),
    Experience(role: "iOS Developer Intern", company: "Frnd", duration: "March 2025 – Present", description: "Working as iOS Developer Intern, in Frnd app a voice based social and dating platform, involves developing features using SwiftUI, and enhancing the overall app experience.", techStack: ["SwiftUI","UIKit", "Swift","Firebase", "MVVM", "AgoraKit"])
]
