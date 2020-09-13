//
//  MacRoot.swift
//  Discussion busket
//
//  Created by 18391981 on 05.09.2020.
//

import SwiftUI

struct iOSRoot: View {
    
    let pageCount: Int = 3
    
    @State var currentIndex = 1
    
    @State var  positionHeight = CGSize.zero
    
    @GestureState private var translation: CGFloat = 0
    
    @State var isShowMenu = false
    
    
    var body: some View {

        GeometryReader { geometry in
            
            ZStack {

                PagesSliderView(pageCount: pageCount, currentIndex: $currentIndex) {
                    
                    LeftMenu().frame(width: geometry.size.width)
                    
                    
                    
                    VStack {
                        
                        HeadButtons(menuAction: { menuShowAction()},
                                    nameAction: { listButtonsShowAction()},
                                    chatAction: { chatShowAction()})
                        
                        
                        
                        if isShowMenu {
                            
                            Divider()
                            
                            ListMenuButtons()
                            
                        }
                        
                        
                        
                        ListView()
                            .frame(maxHeight: currentIndex != 1 ? geometry.size.height - 80 : .infinity )
                            
                        
                        
                    
                    }
                    ChatView().frame(width: geometry.size.width)
                    
                }
                .padding(.trailing, geometry.safeAreaInsets.trailing)
                .padding(.leading, geometry.safeAreaInsets.leading)
                .padding(.top, geometry.safeAreaInsets.top)
                .onAppear() {
                    print("dfsd" + "\(geometry.safeAreaInsets.top)")
                }

                
            
            .background(Color(UIColor.systemGroupedBackground))
       
            
        }.ignoresSafeArea(edges: .all)
            
        }
    }
    
    private func menuShowAction() {
        
        currentIndex = 0
        print(currentIndex)
    }
    
    private func listButtonsShowAction() {
        
        isShowMenu.toggle()
        
        
    }
    
    private func chatShowAction() {
        
        currentIndex = 2
        print(currentIndex)
    }
}

struct iOSRoot_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            iOSRoot()
            iOSRoot()
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
