//
//  Home.swift
//  UI-247
//
//  Created by nyannyan0328 on 2021/06/28.
//

import SwiftUI

struct Home: View {
    var proxy : GeometryProxy
    
    @StateObject var model = BottomBarViewModel()
    
    @FocusState var showKey : Bool
    
    @Environment(\.colorScheme) var schemer
    var body: some View {
        ZStack {
            
            let bottomEge = proxy.safeAreaInsets.bottom
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing: 15){
                    
                    ForEach(1...7,id:\.self){index in
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width - 30, height: 250)
                            .cornerRadius(10)
                        
                        
                        
                    }
                    
                    
                }
                .padding()
                .padding(.bottom,70)
                .modifier(BottomModifier())
                .environmentObject(model)
                
                
            }
            .coordinateSpace(name: "TABSCROLL")
            
            
            VStack{
                
                HStack{
                    
                    
                    Image(systemName: "book.fill")
                        .font(.title.italic())
                        .foregroundColor(.blue)
                    
                    
                    Spacer(minLength: 0)
                    
                    
                    Button("CANCEL"){
                        
                        
                        
                        showKey.toggle()
                    }
                    .foregroundColor(.primary)
                
                }
                .frame(height: 50)
                .padding(.bottom,70)
                
                
                
                if showKey{
                    
                    
                    
                   
                }
                
                
                
                
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(schemer == .dark ? .black : .white)
            .opacity(showKey ? 1 : 0)
            
            
            BottmContent(showKey: _showKey, bottomEge: bottomEge)
                .environmentObject(model)
                .offset(y: model.tabstate == .floting ? 0 : (bottomEge == 0 ? 15 : bottomEge))
                .padding(.top,60)
                .padding(.bottom,bottomEge == 0 ? 15 : 0)
                
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}

struct BottmContent:View{
    @EnvironmentObject var model : BottomBarViewModel
    
    @Namespace var animation
    
    @FocusState var showKey : Bool
    
    var bottomEge : CGFloat
    
    
    var body: some View{
        
        
        ZStack{
            
            RoundedRectangle(cornerRadius: model.tabstate == .exPand ? 15 : 0)
                .fill(.regularMaterial)
                .colorScheme(model.tabstate == .exPand ? .light : .dark)
            
            HStack{
                
                
                if model.tabstate == .floting{
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    
                    }
                    .padding(.trailing)
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.primary)
                    
                    }
                }
                
                
                HStack{
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title2)
                            .foregroundColor(.primary)
                    
                    
                    }
                    
                    
                    if model.tabstate == .floting{
                        
                        TextField("", text: $model.searhTF)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .focused($showKey)
                            .submitLabel(.go)
                    }
                    
                    else{
                        
                        Text(model.searhTF)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                        
                        
                    }
                    
                    
                    
                    Image(systemName: "lock.fill")
                }
                .offset(y: model.tabstate == .floting ? 0 : (bottomEge == 0 ? 0 : -10))
                .frame(maxWidth:model.tabstate == .floting ? nil : 200)
                
               
                
                
                if model.tabstate == .floting{
                    
                    
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.primary)
                    
                    
                    }
                    
                    Button {
                        
                            
                            
                           
                        
                        
                    } label: {
                        
                        Image(systemName: "bookmark.square.fill")
                            .font(.title2)
                            .foregroundColor(.primary)
                    
                    
                    }
                }
                


                
            }
            .padding(.horizontal)
            .colorScheme(model.tabstate == .exPand ? .light : .dark)
                
        
        }
        .frame(height: 60)
        .padding([.horizontal],model.tabstate == .floting ? 15 : 0)
        
        .frame(maxHeight: .infinity, alignment: showKey ? .top : .bottom)
        
        .animation(.easeInOut, value: showKey)
        
    }
}

struct BottomModifier : ViewModifier{
    @EnvironmentObject var model : BottomBarViewModel
    
    func body(content: Content) -> some View {
        content
            .overlay(
            
                GeometryReader{proxy ->Color in
                
                let minY = proxy.frame(in: .named("TABSCROLL")).minY
                
                
                DispatchQueue.main.async {
                    
                    let durationoffset : CGFloat = 35
                    
                    if model.offset < 0{
                        
                        
                        if minY < model.offset && -minY > (model.lastOffset + durationoffset){
                            
                            
                            print("UP")
                            
                            
                            withAnimation(.easeOut.speed(1.5)){
                                
                                
                                
                                model.tabstate = .exPand
                            }
                            model.lastOffset = -model.offset
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                    }
                    
                    if minY > model.offset && -minY < (model.lastOffset - durationoffset){
                        
                        print("Down")
                        
                        withAnimation(.easeOut.speed(1.5)){
                            
                            
                            
                            model.tabstate = .floting
                        }
                        model.lastOffset = -model.offset
                        
                        
                        
                    }
                    
                    model.offset = minY
                    
                    
                }
                
                
                
                
                return Color.clear
            }
            
            )
    }
}
