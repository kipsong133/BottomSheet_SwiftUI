//
//  ContentView.swift
//  BottomSheet_SwiftUI
//
//  Created by 김우성 on 2022/02/06.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowing = false
    
    
    var heightFactor: CGFloat {
        UIScreen.main.bounds.height > 800 ? 3.6 : 3
    }
    
    var offset: CGFloat {
        isShowing ? 0 : UIScreen.main.bounds.height / heightFactor
    }
    
    
    var body: some View {
        
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                self.isShowing.toggle()
            }) {
                HStack {

                    Text("BottomSheet 호출")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.black)
                        .padding(20)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.black, lineWidth: 1)
                )
                
            }
            
            // BottomSheet
            GeometryReader { proxy in
                VStack {
                    Spacer()
                    Color.blue
                        .frame(
                            width: proxy.size.width,
                            height: proxy.size.height / heightFactor,
                            alignment: .center
                        )
                        .offset(y: offset)
                        .animation(.easeInOut(duration: 0.49), value: self.isShowing)
                        
                }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
