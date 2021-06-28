//
//  BottomBarViewModel.swift
//  UI-247
//
//  Created by nyannyan0328 on 2021/06/28.
//

import SwiftUI

class BottomBarViewModel: ObservableObject {
   
    
    @Published var searhTF = "Enter"
    @Published var offset : CGFloat = 0
    @Published var lastOffset : CGFloat = 0
    
    
    @Published var tabstate : BottomState = .floting
    
    
    
}



enum BottomState{
    
    case exPand
    
    case floting
}
