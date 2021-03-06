//
//  UserProfileButton.swift
//  Discussion busket (iOS)
//
//  Created by Alexander Romanov  on 07.09.2020.
//

import SwiftUI
import M7Native

struct UserProfileButton: View {
    
    let firstName: String
    
    let lastName: String
    
    let email: String
    
    let action: () -> Void
    
    private struct Constans {
        static var textSpasing: CGFloat { return 4 }
    }
    
    init(firstName: String, lastName: String, email: String, action: @escaping () -> Void) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.action = action
    }
    
    var body: some View {
        
        Button(action: action, label: {
            
            HStack {
                
                M7AvatarView(firstName: "A", lastName: "R", size: .m)
                
                VStack(alignment: .leading, spacing: Constans.textSpasing) {
                    M7Text("\(firstName)" + " " + "\(lastName)", style: .subtitle1)
                    M7Text(email, style: .caption, color: .onBackgroundMediumEmphasis)
                }
                
                Spacer()
                
                M7Icon(.chevronDown)
                
            }
        })
    }
}

struct UserProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileButton(firstName: "Ivan", lastName: "Ivanov", email: "mail@mail.com", action: { print(#function) })
            .previewLayout(.fixed(width: 375.0, height: 100.0))
    }
}
