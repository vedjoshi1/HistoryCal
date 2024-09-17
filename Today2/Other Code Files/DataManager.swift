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
 //   var delegateIVC : IntroViewController;
    var l = LoadEvents();

    var dayte = Day();
      var omega = EventDataCleaner();
   
    
   
    
    
    
    
    
    
    
    
    
    
    
    
    
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
           
      
            birthPopulator(str: cont)
            nestor(str: cont);
            // print("HEREHREHRE")
             
            deathPopulator(str: cont)
            
            
            
            
        //    print(interpretData());
            //  print(cont);
        } catch  {
            print(error);
        }
    }

   
    func deathPopulator(str:String){
        
        
        omega.clean(str: str)
    }
    
    func birthPopulator(str: String){
    
        LoadEvents.loadEvents(type: EventType.birth, str: str)
        
        
    }
    
    
    
    
    
    
    
    
    
    func nestor(str: String){
        LoadEvents.loadEvents(type: EventType.death, str: str);
   
       
     //   let dict = pG.getDPopularity(strArr: text)
       
        
    }
    
    
    
    
    
    
    
    
    
  
}
