//
//  Onboarding.swift
//  Love&Care
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/05/2022.
//

import SwiftUI

struct Onboarding: View {
    
    //properties
    @AppStorage("isOnboarding") var isOnboarding:Bool = true
    @State var isAnimation: Bool = false
    @State var imageOffset: CGSize = CGSize()
    @State var buttonOffset: CGFloat = 0.0
    @State var buttonWidth: Double = UIScreen.main.bounds.width - 80
    let feedback = UINotificationFeedbackGenerator() 
    
    //Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all)
            VStack {
                //MARK: - Header
                VStack {
                    Text(abs(imageOffset.width) > 0 ? "Love" : "Care.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("Life Doesnot Come with a manua, it comes with A Mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10 )
                        .multilineTextAlignment(.center)
                    
                }//VStack
                .offset(y: isAnimation ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimation )
                Spacer()//Push Up all item in first of screen.
                
                //MARK: - Center
                ZStack {
                    CircleGroupView(CircleGroupColor: .white)
                        .offset(x: imageOffset.width * -1 )
                        .blur(radius: abs(imageOffset.width) / 5, opaque: false)
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width, y: 0)
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .scaleEffect(isAnimation ? 1 : 0.8)
                        .animation(.easeOut(duration: 0.5), value: isAnimation)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.5), radius: 8, x: 3, y: 30)
                        .overlay(
                            Image(systemName:"arrow.left.and.right.circle")
                                .font(.system(
                                    size: 40,
                                    weight: .ultraLight,
                                    design: .rounded))
                                .foregroundColor(.white)
                                .opacity(abs(imageOffset.width) > 0 ? 0: 1)
                            , alignment: .bottom
                        )//overlay : Item on Item
                        .frame(width: 300, alignment: .center)
                        .gesture(DragGesture()
                                    .onChanged({ gesture in
                            if abs(gesture.translation.width) <= 200 {
                                imageOffset = gesture.translation
                            }
                        })
                                    .onEnded({ _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                imageOffset = .zero
                            }
                        })
                        )
                }//ZStack
                Spacer()
                
                //MARK: - Footer
                ZStack {
                    //1.Background
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding()
                    
                    //2.Text
                    Text("Start")
                        .font(.system(size: 30, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    //3.Capsule Dynamic
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }
                    //4.Dragable Cricle
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                            //SFSymles same like font and can have modefieries
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }//: ZStack(End of Dragable circale)
                        .frame(width: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(DragGesture()
                                    .onChanged({ gesture in
                            if gesture.translation.width > 0.0 && buttonOffset < buttonWidth - 80 {
                                buttonOffset = gesture.translation.width
                            }
                        })
                                    .onEnded({ _ in
                            withAnimation(.easeOut(duration: 0.5)) {
                                if buttonOffset >= buttonWidth / 2 {
                                    isOnboarding = false
                                    playSound(soundFile: "chimeup", soundType: "mp3")
                                    feedback.notificationOccurred(.success)
                                } else {
                                    buttonOffset = 0
                                    feedback.notificationOccurred(.error)
                                }
                            }
                        })
                        )
                        Spacer()
                    }//:HStack
                }//:ZStack(End of Footer)
                .frame( height: 80, alignment: .center)
                .padding(.horizontal, 40) // right and left = horizontal
                .offset(y: isAnimation ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimation)
            }//VStack
            .padding(.vertical)
        } //ZStack
        .onAppear {
            isAnimation.toggle()
        }
    }
}

//Preview
struct Onbording_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
