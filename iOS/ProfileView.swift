//
//  ProfileView.swift
//  Discussion busket (iOS)
//
//  Created by Alexander Romanov on 13.09.2020.
//

import SwiftUI
import M7Native
import M7NativeFirebase

struct ProfileView: View {
    
    @EnvironmentObject var auth: M7AuthFlowViewModel
    
    @EnvironmentObject var authenticationService: AuthenticationService
    
    var body: some View {
        
        ZStack {
            
            VStack(spacing: M7Space.m) {
                
                Spacer().frame(height: M7Space.xl)
                
                
                M7AvatarView(firstName: authenticationService.userData.firstName, lastName:  authenticationService.userData.lastName, size: .l)
                
                VStack(spacing: M7Space.xxs) {
                    
                    M7Text(authenticationService.userData.firstName +  authenticationService.userData.lastName, style: .title3, color: .onBackgroundHighEmphasis)
                    
                    M7Text( authenticationService.uid, style: .paragraph1, color: .onBackgroundMediumEmphasis)
                }
                
                
                M7List(style: .insetGroupedListStyle) {
                    Section {
                        
                        Text("Имя и email")
                        Text("Список контактов")
                        
                    }
                    
                    Section {
                        Button("Выйти") {
                            print("exit")
                            
                            auth.logOut()
                        }
                        
                    }
                }
                
                Spacer()
            }
            
        }.background(Color(UIColor.systemGroupedBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
