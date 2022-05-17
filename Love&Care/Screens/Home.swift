//
//  Home.swift
//  Love&Care
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/05/2022.
//

import SwiftUI

struct Home: View {
    //properties
    @AppStorage("isOnboarding") var isOnboarding:Bool = false
    @State var isAnimation: Bool = false
    let feedback = UINotificationFeedbackGenerator()
    
    //Body
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            //MARK: - Header
            Spacer()
            ZStack() {
                CircleGroupView(CircleGroupColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, alignment: .center)
                    .offset(y: isAnimation ? 30 : -30)
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true), value: isAnimation)
            }//: ZStack
            .scaleEffect(isAnimation ? 1 : 0.8)
            .animation(.easeOut(duration: 0.5), value: isAnimation)
            //MARK: - Center
            Text("Having childern just puts the whole word into perspecrive. everything else just disappers")
                .padding()
                .multilineTextAlignment(.center)
                .font(.title3)
                .foregroundColor(.gray)
            Spacer()
            if #available(iOS 15.0, *) {
                Button {
                    isOnboarding.toggle()
                    playSound(soundFile: "success", soundType: "m4a")
                    feedback.notificationOccurred(.success)
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(size: 25, design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            } else{
                //
            }
            Spacer()
        }//"VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                isAnimation.toggle()
            }
        }
    }
}

//Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
