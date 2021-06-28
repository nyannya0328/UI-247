//
//  CrouSelMainView.swift
//  UI-247
//
//  Created by nyannyan0328 on 2021/06/28.
//

import SwiftUI

struct CrouSelMainView: View {
    @State var currentTab = "p1"
    var body: some View {
        ZStack{
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                Image(currentTab)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .cornerRadius(1)
                
                
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            .colorScheme(.dark)
            
            TabView(selection:$currentTab){
                
                ForEach(1...7,id:\.self){index in
                    
                    CurouselBodyView(index: index)
                    
                    
                    
                }
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            
        }
    }
}

struct CrouSelMainView_Previews: PreviewProvider {
    static var previews: some View {
        CrouSelMainView()
    }
}
