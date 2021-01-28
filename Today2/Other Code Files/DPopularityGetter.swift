
//
//  PopularityGetter.swift
//  Today2
//
//  Created by Ved Joshi on 1/23/21.
//
import Foundation
class DPopularityGetter{
    
    
    let lock = NSLock();
    let dayte = Day();
    var intArr : [Int] = []
    var stringArr : [String] = []
    var dict : [String:Int] = [:]
    
    
    func getDPopularity(strArr: [(String)])-> [String:Int]{
      // print("here")
     
        for str in strArr {
            
            popularityCheck(name: str);
            
        }
        
       
        if dict.count >= 4{
            Constants.deathPopDict = dict
       //   print(dict)
            return dict
        }else {
            return getDPopularity(strArr: strArr)
            
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
       
        if let url1 = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url1){(data, response, error) in
                if error != nil{
                    return;
                    
                }
                
                
                if let safedata = data{
                    
                    
                    
                    self.parsePopJSON(weather: safedata, name: name)
                }
                
            }
            lock.lock()
            task.resume()
            
           
            
            
            
        }
        
   }
   
    
    
    
   
   func parsePopJSON(weather : Data, name: String) {
       let decoder = JSONDecoder();
 //   print("this checkpoint")
       var content = 0;
       
    
       do {
            let doneData = try decoder.decode(PageViewData.self, from: weather)
            content = doneData.items[0].views;
     
           
       } catch{
            
           
       }
 //   print("arrived")
    
    dict.updateValue(content, forKey: name)
  //  Constants.deathPopDict = dict
 /*
    print("-------------")
    print(content);
    print(name);
    print("---------------")
*/
 lock.unlock()

    
   }
   
   
    
}

