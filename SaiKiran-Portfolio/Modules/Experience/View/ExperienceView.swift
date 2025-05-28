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
    let experience: [Experience] = experiences
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            header
                .blur(radius: show ? 20 : 0)
                .animation(.default, value: show)
            
            ZStack {
                experienceCard(experiences.first!)
                    .background(show ? Color.clear : Color("background9"))
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: show ? -70 : 0, y: show ? -355 : -40)
                    .scaleEffect(0.85)
                    .rotationEffect(Angle(degrees: show ? 15 : 0))
                    .blendMode(.hardLight)
                    .offset(x: viewState.width, y: viewState.height)
                    .animation(.easeInOut(duration: 0.6), value: show)
                    .animation(.easeInOut(duration: 0.6), value: viewState)
                
                experienceCard(experience.last!)
                    .background(show ? Color.clear : Color("background8"))
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .offset(x: show ? -20 : 0, y: show ? -150 : -20)
                    .scaleEffect(0.9)
                    .rotationEffect(Angle(degrees: show ? 10 : 0))
                    .blendMode(.hardLight)
                    .offset(x: viewState.width, y: viewState.height)
                    .animation(.easeInOut(duration: 0.4), value: show)
                    .animation(.easeInOut(duration: 0.4), value: viewState)
                
                experienceRevealCard()
                    .offset(x: viewState.width, y: show ? viewState.height + 50 : viewState.height)
                    .scaleEffect(0.95)
                    .rotationEffect(Angle(degrees: show ? 10 : 0))
                    .animation(.spring(), value: show)
                    .animation(.spring(), value: viewState)
                    .onTapGesture {
                        withAnimation {
                            self.show.toggle()
                        }
                    }
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.viewState = value.translation
                                withAnimation {
                                    self.show = true
                                }
                            }
                            .onEnded { _ in
                                withAnimation {
                                    self.viewState = .zero
                                    self.show = false
                                }
                            }
                    )
            }
            .offset(y: 80)
        }
    }
    
}

extension ExperienceView {
    
    private var header: some View {
        VStack (spacing: 50){
            HStack {
                backButtonView()
                Text("Work Experience")
                    .font(.title)
                    .fontWeight(.heavy)
                
                Spacer()
            }
            Image("hurry")
            
            Spacer()
        }.padding()
    }
    
    private func backButtonView() -> some View {
        HStack(spacing: 16) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                    Image(.back)
                        .resizable()
                        .frame(width: 40, height: 40)
                }
            }
        }
        .cornerRadius(40)
    }
    
    private func experienceRevealCard() -> some View {
        VStack {
            HStack {
                VStack(alignment: .center, spacing: 10) {
                    Text("iOS Developer")
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
            
            Image("leaf")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 50)
        }
        .frame(width: CGFloat(340), height: CGFloat(220))
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
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
            
            ScrollView(.horizontal) {
                HStack(spacing: 16) {
                    ForEach(exp.techStack, id: \.self) { tech in
                        Text(tech)
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.pink.opacity(0.7))
                            .clipShape(Capsule())
                    }
                }
            }
            .frame(height: 50)
        }
        .padding()
        .background(Color(red: 30/255, green: 30/255, blue: 36/255))
        .cornerRadius(15)
        .shadow(radius: 4)
        .frame(width: 340.0, height: 220.0)
    }
}


#Preview {
    ExperienceView()
}
