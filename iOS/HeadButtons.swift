//
//  HeadButtons.swift
//  Discussion busket
//
//  Created by 18391981 on 30.08.2020.
//

import SwiftUI
import M7Native

struct HeadButtons: View {
    
    let menuAction: () -> Void
    
    let nameAction: () -> Void
    
    let chatAction: () -> Void
    
    public init(menuAction: @escaping () -> Void,
                nameAction: @escaping () -> Void,
                chatAction: @escaping () -> Void) {
        
        self.menuAction = menuAction
        self.nameAction = nameAction
        self.chatAction = chatAction
        
    }
    
    var body: some View {
        
        HStack {
            
            Button(action: menuAction) {
                M7Icon(.menuLine2)
            }
            
            Spacer()
            
            Button(action: nameAction) {
                M7Text("Для дома", style: .title3).accentColor(M7Colors.onBackground.highEmphasis)
            }
            
            Spacer()
            
            Button(action: chatAction) {
                M7Icon(.send)
            }
            
        }.padding()
    }
}

struct HeadButtons_Previews: PreviewProvider {
    static var previews: some View {
        HeadButtons(menuAction: { print(#function)},
                    nameAction: { print(#function)},
                    chatAction: { print(#function)})
    }
}
