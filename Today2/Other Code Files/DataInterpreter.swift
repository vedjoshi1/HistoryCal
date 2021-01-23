//
//  DataInterpreter.swift
//  today
//
//  Created by Ved Joshi on 11/11/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import Foundation
import UIKit


class DataInterpreter{
    var string = "";
    var dict = [Int : String]();
    init() {
        //string = str;
      //  print(string);
    }
    
    
    func read() -> String?{
        let filepath = Bundle.main.path(forResource: "05-18", ofType: "txt")
    //   print(filepath)
        if let filepath = Bundle.main.path(forResource: "05-18", ofType: "txt"){
        
  //      main.path(forResource: "05/18", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
        //        print(contents);
                return contents;
            } catch {
                // contents could not be loaded
            }
        }
        
        return nil;
        
        
        
        
    }
    
    
    
    
    
}
