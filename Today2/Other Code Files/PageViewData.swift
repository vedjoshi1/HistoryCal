//
//  PageViewData.swift
//  Today2
//
//  Created by Ved Joshi on 1/13/21.
//

import Foundation
struct PageViewData:Decodable{
    let items : [Items];
    struct Items:Decodable{
        
        let views : Int;
        let article : String;
        
    }
    
    
    
    
    
    
    
}
