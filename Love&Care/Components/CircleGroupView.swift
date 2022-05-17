//
//  CircleGroupView.swift
//  Love&Care
//
//  Created by MOHAMED ABD ELHAMED AHMED on 13/05/2022.
//

import SwiftUI

struct CircleGroupView: View {
    //Proerties
    var CircleGroupColor: Color = .red
    @State var isAnimation: Bool = false
    
    //Body
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(CircleGroupColor .opacity(0.2), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(CircleGroupColor .opacity(0.2), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }//:ZStack
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimation )
        .onAppear {
            isAnimation.toggle()
        }
    }
}

//Prview
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroupView()
    }
}



/*
- to have anmation in swift you need 3 Item :
 1- var : its responsbale for time to when animation happend
 2- should select all item that will make animation ex : scale or ofset
 3- function for how will animation
*/
