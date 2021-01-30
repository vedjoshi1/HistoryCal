//
//  Event.swift
//  Today2
//
//  Created by Ved Joshi on 12/12/20.
//

import Foundation

class Event{
    let year : String;
    let description : String;
    let lock = NSLock();
    let dayte = Day();
    let type : EventType;
    
    var count = 0;
    
    
    
    
    
    init(year1:String, desc: String,  eventtype:EventType) {
        year = year1 
        description = desc;
   //     count = counts
        type = eventtype
    }
    
    
    func popularityCheck() {
       
        let dayString = (dayte.getPopDate())
        var str = description;
        let name = description;
        var urlString = "''"
        if let index = name.index(of: ","){
            str = String(name[..<index])
           str = str.trimmingCharacters(in: .whitespaces);
            
            urlString =  "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/\(str)/daily/\(dayString)/\(dayString)"
           urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "EOORE"
        //   print(urlString)
        }else if let index = name.index(of: "("){
             str = String(name[..<index])
            str = str.trimmingCharacters(in: .whitespaces);
             
             urlString =  "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/\(str)/daily/\(dayString)/\(dayString)"
            urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "EOORE"
            
            
        }else{
             urlString =  "https://wikimedia.org/api/rest_v1/metrics/pageviews/per-article/en.wikipedia/all-access/all-agents/\(name)/daily/\(dayString)/\(dayString)"
            urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "EOORE"
            
        }
        
        
        performPopRequest(urlString: urlString, name: str);
        
     
        //return testIntA
   }
   
   
    func performPopRequest(urlString: String, name: String){
     //   print(urlString)
        if let url = URL(string: urlString){
           // let lock2 = NSLock();
           
            
            let  session = URLSession(configuration: .default);
           let task = session.dataTask(with: url) { (data, response, error) in
           //   print("task resumed")
               if(error != nil){
                   
                   
               }
              
               if let safedata = data{
                  // lock2.unlock()
               
                    self.parsePopJSON(weather: safedata, name: name)
                
                }
           
           }
           // lock.lock()
            task.resume();
            
            
           
          
           
           
        }else{
            
            print("ELSE")
            print(name)
            
            print("ELSE")
        }
        
   }
   
    
    
    
   
   func parsePopJSON(weather : Data, name: String) {
       let decoder = JSONDecoder();
  //     print("here")
       var content = 0;
       
    
       do {
            let doneData = try decoder.decode(PageViewData.self, from: weather)
            content = doneData.items[0].views;
     
           
       } catch{
        
        
           
       }
   
  //  dict.updateValue(content, forKey: name)
    //Constants.birthPopDict = dict
    print("-------------")
    print(content);
    print(name);
    count = content;
    print("---------------")
 //   lock.unlock()

    
   }
    
    
    
}
