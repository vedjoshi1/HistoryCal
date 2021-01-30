//
//  Constants.swift
//  Today2
//
//  Created by Ved Joshi on 12/12/20.
//

struct Constants{

    static let CellIdentifier = "Cell";
    static let CellNibName = "EventCell"
    
   
    
    
    static var eventYearArr : [(String)] = [];
    static var eventArr : [(String)] = [];
    static var eventYearArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            eventYearArr = newValue;
    //        print("left here")
        }
        get {
            if(eventYearArr.count == 1){
                
                return ["0"];
            }else{
                return eventYearArr
            
            }
        }
      }
    
    static var eventArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            eventArr = newValue;
    //        print("left here")
        }
        get {
            if(eventArr.count == 1){
                
                return ["not much happened on this day"];
            }else{
                return eventArr
            
            }
        }
      }
  
   
    
    
    
    
    
    
    static var deathEvent : [Event] = [];
    static var deathEventArrGS : [Event]{
        set{
            deathEvent = newValue
            
        }get{
            
            
            return deathEvent
        }
        
        
    }
    
    
    
    static var birthEvent : [Event] = [];
    static var birthEventArrGS : [Event]{
        set{
            
            birthEvent = newValue
            
        }get{
            
                return birthEvent
            
            
            
        }
        
        
        
    }
   
    
    
    
    
    
    
    
    static var birthPopDict : [String:Int] = [:]
    static var deathPopDict : [String:Int] = [:]
    
    
    
    
    
   
      
   
    
    
    
    
    


}
