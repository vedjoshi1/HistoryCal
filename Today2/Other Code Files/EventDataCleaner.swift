//
//  EventDataCleaner.swift
//  Today2
//
//  Created by Ved Joshi on 12/24/20.
//
import Foundation
struct EventDataCleaner {
    
    
   
    
    
     func clean(str: String){
        //first get rid of all of the non-event bits of the string
        var string = "";
        var text : [String] = [];
        var years : [String] = [];
        if let index = str.index(of: "==Events==") {
            
            let substring = String(str[index...])   // ab
           
            if let index1 = substring.index(of: "==Births=="){
           //     print("hre")
               string = (String(substring[..<index1]));
                
                
            }
          
        }else  if let index = str.index(of: "== Events ==") {
            
            let substring = String(str[index...])   // ab
           
            if let index1 = substring.index(of: "== Births =="){
           //     print("hre")
               string = (String(substring[..<index1]));
                
                
            }
          
        }
        
   //     print(string);
        
        
        
        if string.index(of: "&ndash") != nil {
            string = string.replacingOccurrences(of: "&ndash;", with: "++")
        }else{
            
            
                string = string.replacingOccurrences(of: " – ", with: "++")
            
            
        }
        for word in string.components(separatedBy: "*"){
            
            if let index3 = word.index(of: "++") {
                let info = String(word[index3...])   // ab
                
                let year = String(word[..<index3])
           //     print("here2")
                years.append(year.removeCharacters(from: " []"))
            //    print("this is working as well")
             //   print(info)
            //    print("----------")
                text.append(addToArr(str: fixBrackets(str: info)))
              //  print("this set is good")
            }
        }
        
     //   print("hmmmm")
        //print(text.count)
       // print(years)
      //  print(years.count)
        Constants.eventYearArrGS = years;
        Constants.eventArrGS = text;
    }
    
    
    func fixBrackets(str:String)->String{
        var final = str
        if let index = final.index(of: "<ref"){
            final = String(final[..<index])
            
            
            
        }
        if let index = final.index(of: "<!--"){
            final = String(final[..<index])
            
            
            
        }
        
        if let index = final.index(of: "|"){
            let holder = String(final[..<index])
       //     print(holder)
            let index2 = final.index(after: index);
            let chill = String(final[index2...]);
            
            
            if let bracketIndex = holder.lastIndex(of: "["){
                let doneTing = String(holder[..<bracketIndex]);
         //       print(holder)
                
                final = doneTing+chill
               
            }else{
                final = holder + chill.suffix(chill.count-1);
                
                
            }
        }
        
    //    print(final);
        if final.index(of: "|") != nil{
            if(final.index(of: "[") != nil){
                return fixBrackets(str: final);
            }
        }
        
        
        
        
        
        return final;
        
    }
    
    
    
    
    
    
    func addToArr(str: String)->String{
        
        let cleanNameString = str.removeCharacters(from: "[]|+{}");
      //  print(cleanNameString)
       return cleanNameString
        
    }
    
    
    
    
    
}
