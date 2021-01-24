//
//  PopularityGetter.swift
//  Today2
//
//  Created by Ved Joshi on 1/23/21.
//

import Foundation
class PopularityGetter{
    
    
    
    let dayte = Day();
    var intArr : [Int] = []
    var stringArr : [String] = []
    
    
    func getBPopularity(strArr: [(String)])-> [String:Int]{
        
     //   print(strArr.count)
   //     print("\n\n\n\n\n\n\n\n\\n\n")
        for str in strArr {
            
            popularityCheck(name: str);
            
        }
        
        
        //print(intArr)
      //  print(stringArr)
        if(intArr.count == stringArr.count){
            let dict =  Dictionary.init(keys: stringArr, values: intArr)
            Constants.birthPopDict = dict
       //     print(dict["Subhas Chandra Bose"])
            return dict
        }else{
            
            return getBPopularity(strArr: strArr);
        }
        
    }
    func getDPopularity(strArr: [(String)])-> [String:Int]{
        
     //   print(strArr.count)
   //     print("\n\n\n\n\n\n\n\n\\n\n")
        for str in strArr {
            
            popularityCheck(name: str);
            
        }
        
        
        //print(intArr)
      //  print(stringArr)
        if(intArr.count == stringArr.count){
            let dict =  Dictionary.init(keys: stringArr, values: intArr)
            Constants.deathPopDict = dict
            return dict
        }else{
            
            return getDPopularity(strArr: strArr);
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
     
        if let url = URL(string: urlString){

           let  session = URLSession(configuration: .default);
           let task = session.dataTask(with: url) { (data, response, error) in
              
               if(error != nil){
                   
                   
               }
              
               if let safedata = data{
                   self.parsePopJSON(weather: safedata, name: name)
                
                
                }
           }
           
           task.resume();
           
           
       }
        
   }
   
    
    
    
   
   func parsePopJSON(weather : Data, name: String) {
       let decoder = JSONDecoder();
    //   print("here")
       var content = 0;
       var nameP = "";
       do {
            let doneData = try decoder.decode(PageViewData.self, from: weather)
            content = doneData.items[0].views;
           nameP = String(doneData.items[0].article)
           nameP = name.replacingOccurrences(of: "_", with: " ");
           
       } catch{
            
           nameP = name
       }
    /*
    print("-------------")
    print(content);
    print(name);
    print("---------------")
    */
    intArr.append(content)
    stringArr.append(name)
  
    
   }
   
   
    
}
