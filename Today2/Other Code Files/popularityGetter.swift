
//
//  PopularityGetter.swift
//  Today2
//
//  Created by Ved Joshi on 1/23/21.
//
import Foundation
class PopularityGetter{
    
    
    let lock = NSLock();
    let dayte = Day();
    var intArr : [Int] = []
    var stringArr : [String] = []
    var dict : [String:Int] = [:]
    
    func getBPopularity(strArr: [(String)])-> [String:Int]{
        
      //  print(strArr.count)
        for str in strArr {
            
                
                self.popularityCheck(name: str);
            
           
            
        }
        
        
        
        if dict.count >= 4{
           // print(dict)
            Constants.birthPopDict = dict
       
            return dict
        }else {
            print("hereh we")
            print(dict)
            return getBPopularity(strArr: strArr)
            
        }
        
    }
   
    
    
    
    func popularityCheck(name: String) {
       
        let dayString = (dayte.getPopDate())
        var str = name;
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
            lock.lock()
            task.resume();
            
            
           
          
           
           
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
   
    dict.updateValue(content, forKey: name)
    //Constants.birthPopDict = dict
   // print("-------------")
   // print(content);
   // print(name);
  //  print("---------------")
    lock.unlock()

    
   }
   
   
    
}

