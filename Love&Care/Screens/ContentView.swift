//
//  ContentView.swift
//  Love&Care
//
//  Created by MOHAMED ABD ELHAMED AHMED on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Properties
    // if isOnboarding doesnot have value in userDefulat his value will be true .
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    
    //Body
    var body: some View {
        
        switch isOnboarding {
        case true:
            Onboarding()
        case false:
            Home()
        }
    }
    
}

//preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
