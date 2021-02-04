//
//  LoadEvents.swift
//  Today2
//
//  Created by Ved Joshi on 1/29/21.
//

import Foundation
class LoadEvents{
    let lock = NSLock();
    static func loadEvents(type:EventType, str:String){
        
        if(type == EventType.birth){
           
            birthEvent(str: str)
           
            
        }else if(type == EventType.death){
            deathEvent(str: str)
            
        }
    }
    
    static func deathEvent(str: String){
        
        var final = "";
        var events : [Event] = [];
     
        if let index = str.index(of: "==Deaths==") {
       //     print("heeeeem")
            let substring = String(str[index...])   // ab
         //  print(substring)
            if let index1 = substring.index(of: "==Holidays and observances=="){
           //     print("folsknem")
                final = String(substring[..<index1]);
                
                
            }else  if let index1 = substring.index(of: "== Holidays and observances =="){
                
                final = String(substring[..<index1]);
                
                
            }
          
        }else  if let index = str.index(of: "== Deaths ==") {
            let substring = String(str[index...])   // ab
           
            if let index1 = substring.index(of: "== Holidays and observances =="){
                
                final = String(substring[..<index1]);
                
                
            }
          
        }
        
        
        
        
   //     print(final)
        
        if final.index(of: "&ndash") != nil {
           // print("this is the issua")
            final = final.replacingOccurrences(of: "&ndash;", with: "++")
        }else{
            
                final = final.replacingOccurrences(of: " – ", with: "++")
            
            
        }
        
        
        
        for string in final.components(separatedBy: "*"){
     //      print(string)
            
            
            if let index = string.index(of: "++") {
                var name = String(string[index...])   // ab
                
                let year = String(string[..<index])
             //   print(year);
                let alphaNumericSet = year.removeCharacters(from: CharacterSet.decimalDigits.inverted)
         //       print(alphaNumericSet)
                
                
             //   print(name)
                if let index = name.index(of: "<ref"){
                    name = String(name[..<index])
               //     print(name)
                    
                    
                }
                
                if let index = name.index(of: "<!--"){
                    name = String(name[..<index])
                    
                    
                    
                }
                
                
                
              
                
            
                if let index = name.index(of: "|"){
                    let holder = String(name[..<index])
                  //  print(holder)
                    let index2 = name.index(after: index);
                    let chill = String(name[index2...]);
                    
                    
                    if let bracketIndex = holder.lastIndex(of: "["){
                        let doneTing = String(holder[..<bracketIndex]);
                 //       print(holder)
                        
                        name = doneTing+chill
                       
                    }
                    
                    
                }
          
                
            //    print(name)
                
                let cleanNameString = name.removeCharacters(from: "[]+");
            //    print(cleanNameString);
                
                let eve = Event(year1: alphaNumericSet, desc: cleanNameString, eventtype: EventType.death)
                eve.popularityCheck();
                events.append(eve)
                
            }
            
        }
        
        Constants.deathEventArrGS = events;
        
        
   
        
        
    }
    
    
    
    
    
    
    static func birthEvent(str:String){
        
        
        var final = ""
        var events : [Event] = [];
       
    //    var pops : [Int] = [];
        if let index = str.index(of: "==Births==") {
         
            let substring = String(str[index...])   // ab
           
            if let index1 = substring.index(of: "==Deaths=="){
               
                final = String(substring[..<index1]);
                
                
            }
          
        }else if let index = str.index(of: "== Births =="){
       
            let substring = String(str[index...])   // ab
           
            if let index1 = substring.index(of: "== Deaths =="){
               
                final = String(substring[..<index1]);
                
                
            }
        }
        
        
        
        
        if final.index(of: "&ndash") != nil {
            final = final.replacingOccurrences(of: "&ndash;", with: "++")
         
        }else{
            
            
                final = final.replacingOccurrences(of: " – ", with: "++")
            
            
        }
        
        for string in final.components(separatedBy: "*"){
     //      print(string)
            
            
            if let index = string.index(of: "++") {
                var name = String(string[index...])   // ab
                
                let year = String(string[..<index])
             //   print(year);
                let alphaNumericSet = year.removeCharacters(from: CharacterSet.decimalDigits.inverted)
         //       print(alphaNumericSet)
                
                
                
                if let index = name.index(of: "<ref"){
                    name = String(name[..<index])
                    
                    
                    
                }
                if let index = name.index(of: "<!--"){
                    name = String(name[..<index])
                    
                    
                    
                }
                
                if let index = name.index(of: "{{c"){
                    
                    name = String(name[..<index])
                  
                    
                }
                
                    if let index = name.index(of: "|"){
                        let holder = String(name[..<index])
                      //  print(holder)
                        let index2 = name.index(after: index);
                        let chill = String(name[index2...]);
                        
                        
                        if let bracketIndex = holder.lastIndex(of: "["){
                            let doneTing = String(holder[..<bracketIndex]);
                     //       print(holder)
                            
                            name = doneTing+chill
                           
                        }
                        
                        
                    }
              
                let cleanNameString = name.removeCharacters(from: "[]+");
        //        print(cleanNameString);
                
             //   print("--------------")
                
                
                let eve = Event(year1: alphaNumericSet, desc: cleanNameString, eventtype: EventType.birth)
                eve.popularityCheck()
                
                
                events.append(eve);
              //  print(events.last?.year)
            }
            
        }
       
        
        Constants.birthEventArrGS = events;
        
       print("ere")
        
        
    }
    
    
    
    
    
    
    
}
