//
//  DataManager.swift
//  today
//
//  Created by Ved Joshi on 10/31/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import Foundation
import UIKit

struct DataManager{
    var popArr : [Int] = [];
    var dict : [String:Int] = [:];


    var dayte = Day();
      let omega = EventDataCleaner();
    let url = "https://en.wikipedia.org/w/api.php?action=query&prop=revisions&rvslots=%2A&rvprop=content&formatversion=2&format=json";
    func fetchData(query: String){
        let urlstring = "\(url)&titles=\(query)";
    //    print(urlstring)
        
       performRequest(urlString: urlstring);
    }
    func performRequest(urlString : String){
     //   print("al")
     
        if let url = URL(string: urlString){
         //   print("beta")
            let session = URLSession(configuration: .default);
            let task = session.dataTask(with: url) { (data, response, error) in
                if(error != nil){
                  //  print("hmmmmm")
                   
                    
                }
               
                if let safedata = data{
                 
                    self.parseJSON(weather: safedata);
                    
                 }
            }
            
            task.resume();
            
            
            
            
        }
        
    //    return true
    }
    
    func parseJSON(weather : Data){
      
        let decoder = JSONDecoder();
        do {
            
             let doneData = try decoder.decode(DayData.self, from: weather)
            let cont = doneData.query.pages[0].revisions[0].slots.main.content;
         //   print(cont);
            if(cont.length < 50){
             //   print(cont)
            }
           
         //   tester(str: interpretData());
            lestor(str: cont)
            nestor(str: cont);
            // print("HEREHREHRE")
          //  print(cont)
            
            
            
            
            
            omega.clean(str: cont);
        //    print(interpretData());
            //  print(cont);
        } catch  {
            print(error);
        }
    }

    func interpretData()-> String{
        let muller =  DataInterpreter();
        if  muller.read() == nil {
            print("error big time");
        }
        
        let thom = muller.read();
        return thom ?? "error";
    }
    
    
    func lestor(str: String){
    
        var final = ""
        var years : [String] = [];
        var text : [String] = [];
       
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
                
                
             
                
                years.append(String(alphaNumericSet));
                text.append(cleanNameString);
            }
            
        }
       
        
        Constants.birthYearArrGS = years;
        Constants.birthArrGS = text;
        
      
        
        let pG = PopularityGetter();

        let dict = pG.getBPopularity(strArr: text)
       
        
    }
    
    
    
    
    
    
    
    
    
    func nestor(str: String){
        var final = "";
        var years : [String] = [];
        var text : [String] = [];
     
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
                
                
                years.append(String(alphaNumericSet));
                text.append(cleanNameString);
            }
            
        }
        
        Constants.deathYearArrGS = years;
        Constants.deathArrGS = text;
        
        
   
        let pG = DPopularityGetter();
       // print("here")
        let dict = pG.getDPopularity(strArr: text)
       
        
    }
    
    
    
    
    
    
    
    
    
  
}
