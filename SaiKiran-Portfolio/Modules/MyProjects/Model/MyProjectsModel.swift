//
//  MyProjectsModel.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 15/05/25.
//

import Foundation

struct Project: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: [String]
    let description: String
    let techStack: [String]
    let githubURL: URL
}

let myProjectsList: [Project] = [
    Project(
        title: "MovieSearch",
        subtitle: "OMDb + SwiftUI + TCA",
        imageName: ["film"],
        description: "A movie search app using OMDb API with The Composable Architecture.",
        techStack: ["SwiftUI", "TCA", "Combine", "OMDb API"],
        githubURL: URL(string: "https://github.com/yourusername/MovieSearch")!
    ),
    Project(
        title: "Expense Tracker",
        subtitle: "Track your daily expenses",
        imageName: ["chart.pie.fill"],
        description: "iOS app to record daily transactions and view monthly summaries.",
        techStack: ["SwiftUI", "CoreData", "Charts"],
        githubURL: URL(string: "https://github.com/yourusername/ExpenseTracker")!
    ),
    Project(
        title: "WeatherNow",
        subtitle: "Live weather data",
        imageName: ["cloud.sun.fill"],
        description: "Displays real-time weather using OpenWeather API.",
        techStack: ["SwiftUI", "Alamofire", "MVVM"],
        githubURL: URL(string: "https://github.com/yourusername/WeatherNow")!
    ),
    Project(
        title: "TaskMate",
        subtitle: "Simple To-Do App",
        imageName: ["checkmark.circle.fill"],
        description: "A clean, lightweight to-do list app with local storage.",
        techStack: ["SwiftUI", "UserDefaults"],
        githubURL: URL(string: "https://github.com/yourusername/TaskMate")!
    )
]
