//
//  MenuView.swift
//  SaiKiran-Portfolio
//
//  Created by Sai Kiran on 06/05/25.
//

import SwiftUI

struct MenuView: View {
    
    var menu = menuData
    @Binding var show: Bool
    @State var showSettings = false
    var callback: ((String) -> Void) = { _ in}
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                ForEach(menu) { item in
                    Button {
                        callback(item.title)
                        self.show.toggle()
                    } label: {
                        MenuRow(image: item.icon, text: item.title)
                    }
                }
                Spacer()
            }
            .padding(.top, 20)
            .padding(30)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(Angle(degrees: show ? 0 : 60), axis: (x: 0, y: 10.0, z: 0))
            .animation(.default, value: show)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                self.show.toggle()
            }
            Spacer()
        }
    }
}


#Preview {
    MenuView(show: .constant(true))
}

struct MenuRow: View {
    
    var image: String
    var text: String
    
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .font(.headline)
                .foregroundColor(.primary)
            
            Spacer()
        }
    }
}

struct MenuRight: View {

   @Binding var show: Bool
   @State var showUpdate = false

   var body: some View {
      return ZStack(alignment: .topTrailing) {
         HStack {
            Button(action: { self.show.toggle() }) {
               CircleButton(icon: "person.crop.circle")
            }
            Button(action: { self.showUpdate.toggle() }) {
               CircleButton(icon: "bell")
                  
            }
         }
         Spacer()
      }
   }
}

struct CircleButton: View {

   var icon = "person.crop.circle"

   var body: some View {
      return HStack {
         Image(systemName: icon)
            .foregroundColor(.primary)
      }
      .frame(width: 44, height: 44)
      .background(Color("button"))
      .cornerRadius(30)
      .shadow(color: Color("buttonShadow"), radius: 20, x: 0, y: 20)
   }
}
