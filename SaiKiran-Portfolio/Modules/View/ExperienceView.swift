//
//  ExperienceView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 07/05/25.
//

import SwiftUI

struct ExperienceView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    let experience1: String = " I worked as an iOS Developer where I developed CricDost, a real-time cricket scoring app in UIKit"
    
    let experience2: String = " Working as iOS Developer Intern, in Frnd app a voice based social and dating platform, involves developing features using SwiftUI, and enhancing the overall app experience."
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            ZStack {
                CardView(company: "Xcel Corp", description: experience1)
                    .background(show ? Color.red : Color("background9"))
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -400 : -40)
                    .scaleEffect(0.85)
                    .rotationEffect(Angle(degrees: show ? 15 : 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.6))
                    .offset(x: viewState.width, y: viewState.height)
                
                CardView(company: "Frnd", description: experience2)
                    .background(show ? Color("background5") : Color("background8"))
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: 0, y: show ? -200 : -20)
                    .scaleEffect(0.9)
                    .rotationEffect(Angle(degrees: show ? 10 : 0))
                    .blendMode(.hardLight)
                    .animation(.easeInOut(duration: 0.4))
                    .offset(x: viewState.width, y: viewState.height)
                
                ExperienceCardView()
                    .offset(x: viewState.width, y: viewState.height)
                    .scaleEffect(0.95)
                    .rotationEffect(Angle(degrees: show ? 10 : 0))
                    .animation(.spring())
                    .onTapGesture {
                        self.show.toggle()
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.viewState = value.translation
                                self.show = true
                            }
                            .onEnded { _ in
                                self.viewState = CGSize.zero
                                self.show = false
                            }
                    )
            }
            .offset(y: 80)
        }
    }
}

#Preview {
    ExperienceView()
    //    ExperienceCardView()
}

struct CardView: View {
    var company: String = "Frnd"
    var description: String = "Frnd"
    
    var body: some View {
        VStack {
            Text("\(company)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.top)
            
            Text("\(description)")
                .font(.pallyVariable(size: 18))
        }
        .frame(width: 340.0, height: 220.0)
    }
}

struct ExperienceCardView: View {
    
    var item = Certificate(title: "UI Design", image: "leaf", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .center, spacing: 10) {
                    Text("My Experience")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    
                    Text("Tap or Drag to Reveal")
                        .foregroundColor(.white)
                }
                Spacer()
                
                Image("appleLogo1")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
            }
            .padding(.horizontal)
            Spacer()
            
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(item.width), height: CGFloat(item.height))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack (spacing: 50){
            HStack {
                Text("Work Experience")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            Image("hurry")
            
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Spacer()
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            
            Text("This certificate is proof that Mithun has achieved UI Design course with approval from a Design+Code instructor.")
                .lineLimit(nil)
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .cornerRadius(30)
        .shadow(radius: 20)
    }
}
