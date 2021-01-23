//
//  DayData.swift
//  today
//
//  Created by Ved Joshi on 11/7/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import Foundation
import UIKit

struct DayData : Decodable{
    /*
     
    
     */
    let query : Query;
    
    
    struct Query : Decodable{
        
        let pages : [S];
        
    }
    struct S : Decodable{
        let title : String;
        let pageid : Int;
        let revisions : [Revisions];
        
        
    }
    struct Revisions : Decodable{
        
        let slots : Slots;
        
        
    }
    
    struct Slots : Decodable{
        let main : Main;
        
        
        
        
    }
    
    
    struct Main : Decodable{
        
        
        let content : String;
        
        
       
    }
}

