//
//  Day.swift
//  today
//
//  Created by Ved Joshi on 9/20/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import Foundation
import UIKit
struct Day{
    var mon = 0 ;
    let date = Date()
    var dayString = ""
 //   var day = 0
    let formatter = DateFormatter()
    mutating func getDate(dates : Date) -> String{
        
      //  print("true");
        var str = "";
        formatter.dateFormat = "MM";
        let month = formatter.string(from: dates)
        
        formatter.dateFormat = "dd";
         dayString = formatter.string(from: dates)
       /*
        let test = formatter.string(from: dates);
        let hyphen = CharacterSet(charactersIn: "/")

        // 2.
        let scanner = Scanner(string: test)
        scanner.charactersToBeSkipped = hyphen

        // 3.
        var month, day, year: NSString?

        scanner.scanUpToCharacters(from: hyphen, into: &month)          // A
        scanner.scanUpToCharacters(from: hyphen, into: &day)  // B
        scanner.scanUpToCharacters(from: hyphen, into: &year)    // C
        mon = Int(month as! String) ?? 0;
         dayString = String(day!);
         
        */
        
        
        
        
        
        
        
        if dayString.prefix(1) == "0"{
            
            dayString = String(dayString.suffix(1));
            
        }

        let monthString = getMonth(month: Int(month as! String) ?? 0);
        str = monthString + " " + dayString + getSuffix(day: Int(dayString) ?? 0);
        
       // print(str);
        return str;
    }
    
    
    
    
    func getSuffix(day : Int)->String{
        if(day == 0) {
            return "ERROR"
        }
        
        if (day%100 > 10 && day%100 < 14){
            return "th";
            
        }
        switch (day%10) {
               case 1:  return "st";
               case 2:  return "nd";
               case 3:  return "rd";
               default: return "th";
           }
        
  //      let mod = day%10;
        
    return "ERROR"
        
        
        
    }
    func getMonth(month: Int)->String{
        let arr = ["January", "February", "March", "April", "May", "June", "July", "August", "September","October", "November", "December"];
     //   print(month)
        return arr[month-1];
       // return "December"
        
        
    }
    
    
    
    
    
    
    func getPopDate() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let string = formatter.string(from: Date())
        let intString = Int(string) ?? 0
        return String(intString-1);
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    func getColor() -> UIColor{
        if(mon < 1){
            
            return UIColor.white;
            
            
        }else if(mon == 1){
            return #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
            
            
            
        }else if(mon == 2){
            return #colorLiteral(red: 0.3047282579, green: 0.1638121791, blue: 0.5003574346, alpha: 1)
        }else if(mon == 3){
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }else if(mon == 4){
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else if(mon == 5){
            return #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        }else if(mon == 6){
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }else if(mon == 7){
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }else if(mon == 8){
            return #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        }else if(mon == 9){
            return #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        }else if(mon == 10){
            return #colorLiteral(red: 1, green: 0.1884055049, blue: 0.9700336046, alpha: 1)
        }else if(mon == 11){
            return #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        }else if(mon == 12){
            return #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }else{
            return UIColor.white;
        
        }
        
    }
    
    
    
    
}
