//
//  CurouselBodyView.swift
//  UI-247
//
//  Created by nyannyan0328 on 2021/06/28.
//

import SwiftUI

struct CurouselBodyView: View {
    var index : Int
    
    @State var offset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            ZStack{
                
                
                
                Image("p\(index)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 10, height: size.height / 1.2)
                    .cornerRadius(20)
                
                
                VStack{
                    
                    VStack(alignment:.leading,spacing: 5){
                        
                        
                        Text("Human Intergation Super Visor")
                            .font(.title.italic())
                            
                        
                        Text("Animal is amainzing")
                            .font(.footnote.bold())
                        
                    }
                    .foregroundStyle(.white)
                    .padding(.top,15)
                    
                    Spacer(minLength: 0)
                    
                    
                    VStack(alignment:.leading){
                        
                        
                        HStack{
                            
                            
                            
                            Image("p7")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                
                                Text("Girl")
                                    .font(.callout.monospacedDigit())
                                
                                Text("Amazing Girl!")
                                    .font(.footnote.italic())
                                
                                
                            }
                            .foregroundStyle(.black)
                            
                        }
                        
                        
                        
                        HStack{
                            
                            VStack(spacing:5){
                                
                                Text("1500")
                                    .font(.title3)
                                
                                Text("Posts")
                                    .font(.footnote.italic())
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing:5){
                                
                                Text("30000")
                                    .font(.title3)
                                
                                Text("Following")
                                    .font(.footnote.italic())
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            
                            VStack(spacing:5){
                                
                                Text("100")
                                    .font(.title3)
                                
                                Text("Followers")
                                    .font(.footnote.italic())
                                
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                    }
                    .padding(20)
                    .padding(.horizontal,20)
                    .background(.white,in:RoundedRectangle(cornerRadius: 10))
                    
                    
                }
                
            }
            .frame(width: size.width - 10, height: size.height / 1.2)
            .frame(width:size.width, height: size.height)
            
            
            
        }
        .tag("p\(index)")
        
        .rotation3DEffect(.init(degrees: getIndex() * 90), axis: (x: 0, y: 1, z: 0), anchor: offset < 0 ? .trailing : .leading, anchorZ: 0, perspective: 0.8)
        .modifier(ScrollViewOffsetModifier(offset: $offset, anchoranchorpoint: .leading))
        
    }
    func getIndex()->CGFloat{
        
        
        let progress = -offset / UIScreen.main.bounds.width
        
        return progress
    }
}

struct CurouselBodyView_Previews: PreviewProvider {
    static var previews: some View {
        CrouSelMainView()
    }
}
