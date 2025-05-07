//
//  SkillDataModel.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import Foundation
import SwiftUICore

// MARK: - HOME

struct IosApp: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var color: Color
   var shadowColor: Color
}

let IosAppData = [
    IosApp(title: "Build an app with SwiftUI & UIKit",
          image: "swiftUIKit",
          color: Color("background3"),
          shadowColor: Color("backgroundShadow3")),
    IosApp(title: "Design and animate your UI",
          image: "designUI",
          color: Color("background4"),
          shadowColor: Color("backgroundShadow4")),
    IosApp(title: "Integrate real-world REST APIs",
          image: "restApi",
          color: Color("background7"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    IosApp(title: "Deploy apps to TestFlight",
          image: "testFlight",
          color: Color("background8"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    IosApp(title: "Architect apps with MVVM, MVC & VIPER",
          image: "architecture",
          color: Color("background9"),
          shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]

// MARK: - Menu

struct Menu: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "My Projects", icon: "folder"),
    Menu(title: "Skills", icon: "hammer.fill"),
    Menu(title: "Experience", icon: "briefcase.fill"),
    Menu(title: "LinkedIn", icon: "link"),
    Menu(title: "GitHub", icon: "chevron.left.slash.chevron.right")
]

// MARK: - Skills

let skillData = [
    Menu(title: "Swift", icon: "swift"),
    Menu(title: "UIKit", icon: "uikit"),
    Menu(title: "CoreData", icon: "coreData"),
    Menu(title: "Alamofire", icon: "alamofire"),
    Menu(title: "Firebase", icon: "fireBase"),
    Menu(title: "MapKit", icon: "mapKit")
]

struct Certificate: Identifiable {
   var id = UUID()
   var title: String
   var image: String
   var width: Int
   var height: Int
}

let certificateData = [
   Certificate(title: "UI Design", image: "Certificate1", width: 230, height: 150),
   Certificate(title: "SwiftUI", image: "Certificate2", width: 230, height: 150),
   Certificate(title: "Sketch", image: "Certificate3", width: 230, height: 150),
   Certificate(title: "Framer", image: "Certificate4", width: 230, height: 150)
]
