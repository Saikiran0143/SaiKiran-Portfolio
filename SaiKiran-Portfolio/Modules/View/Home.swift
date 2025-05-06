//
//  Home.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import SwiftUI

struct Home: View {
    
    @State var show = false
    @State var showProfile = false
    @State var showProjectScreen: Bool = false
    @State var showSkillsScreen: Bool = false
    
    var body: some View {
        
        NavigationStack {
            ZStack(alignment: .top) {
                HomeList()
                    .blur(radius: show ? 10 : 0)
                HStack {
                    MenuButton(show: $show)
                        Spacer()
                    MenuRight(show: $show)
                        .offset(x: 30)
                }
                .offset(x: -40)
                MenuView(show: $show) { selectedItem in
                    print("\(selectedItem)")
                    handleMenuSelect(selectedItem: selectedItem)
                }
                navigations()
            }
        }
    }
    
    private func navigations() -> some View {
        VStack{
        }
        .navigationDestination(isPresented: $showProjectScreen) {
            
        }
        .navigationDestination(isPresented: $showSkillsScreen) {
            SkillsView(showSkills: $showSkillsScreen)
        }
    }
    
    private func handleMenuSelect(selectedItem: String) {
        switch(selectedItem) {
        case "My Projects" :
            break
        case "Skills" :
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                showSkillsScreen = true
            }
        case "Experience" :
            break
        case "LinkedIn" :
            break
        case "GitHub" :
            break
        default :
            break
        }
    }
}

#Preview {
    Home()
}

struct HomeList: View {

   var courses = IosAppData
   @State var showContent = false

   var body: some View {
      ScrollView {
         VStack {
            HStack {
               VStack(alignment: .leading) {
                  Text("Sai Kiran")
                     .font(.largeTitle)
                     .fontWeight(.heavy)

                  Text("IOS Developer")
                     .foregroundColor(.gray)
               }
               Spacer()
            }
            .padding(.leading, 60.0)

            ScrollView(.horizontal, showsIndicators: false) {
               HStack(spacing: 30.0) {
                  ForEach(courses) { item in
                     Button(action: { self.showContent.toggle() }) {
                        GeometryReader { geometry in
                           CourseView(title: item.title,
                                      image: item.image,
                                      color: item.color,
                                      shadowColor: item.shadowColor)
                              .rotation3DEffect(Angle(degrees:
                                 Double(geometry.frame(in: .global).minX - 30) / -40), axis: (x: 0, y: 10.0, z: 0))
                        }
                        .frame(width: 246, height: 360)
                     }
                  }
               }
               .padding(.leading, 30)
               .padding(.top, 30)
               .padding(.bottom, 70)
               Spacer()
            }
         }
         
      }
   }
}


struct CourseView: View {

    var title: String
    var image: String
    var color: Color
    var shadowColor: Color

   var body: some View {
    VStack(alignment: .leading) {
         Text(title)
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(30)
            .lineLimit(4)

         Spacer()

         Image(image)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fit)
            .frame(width: 246, height: 150)
            .padding(.bottom, 30)
      }
      .background(color)
      .cornerRadius(30)
      .frame(width: 246, height: 360)
      .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
   }
}

struct MenuButton: View {
   @Binding var show: Bool

   var body: some View {
      return ZStack(alignment: .topLeading) {
          Button(action: {
              self.show.toggle()
              print("Hello")
          }) {
            HStack {
               Spacer()

               Image(systemName: "list.dash")
                  .foregroundColor(.primary)
            }
            .padding(.trailing, 18)
            .frame(width: 90, height: 60)
            .background(Color("button"))
            .cornerRadius(30)
            .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
         }
         Spacer()
      }
   }
}
