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
  
    static var deathYearArr : [(String)] = [];
    static var deathArr : [(String)] = [];
    static var deathYearArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            deathYearArr = newValue;
    //        print("left here")
        }
        get {
            if(deathYearArr.count == 1){
                
                return ["nobody died???"];
            }else{
                return deathYearArr
            
            }
        }
      }
    
    static var deathArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            deathArr = newValue;
    //        print("left here")
        }
        get {
            if(deathArr.count == 1){
                
                return ["nobody died today :)"];
            }else{
                return deathArr
            
            }
        }
      }
  
    
    
    
    
    
    
    
    
    
    
    static var birthYearArr : [(String)] = [];
    static var birthArr : [(String)] = [];
    static var birthYearArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            birthYearArr = newValue;
    //        print("left here")
        }
        get {
            if(birthYearArr.count == 1){
                
                return ["nobody important born???"];
            }else{
                return birthYearArr
            
            }
        }
      }
    
    static var birthArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            birthArr = newValue;
    //        print("left here")
        }
        get {
            if(birthArr.count == 1){
                
                return ["nobody died today :)"];
            }else{
                return birthArr
            
            }
        }
      }
    
    
    
    
    
    
    
    static var birthPopDict : [String:Int] = [:]
    static var deathPopDict : [String:Int] = [:]
    
    
    
    
    
    
    static var birthPopArr : [(Int)] = [];
    static var birthPopNameArr : [(String)] = [];
    static var birthPopArrGS : [(Int)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            birthPopArr = newValue;
    //        print("left here")
        }
        get {
            if(birthYearArr.count == 1){
                
                return [0];
            }else{
                return birthPopArr
            
            }
        }
      }
    
    static var birthPopNameArrGS : [(String)]{
        set{
        //    print("arrived here")
      //      print(newValue)
            birthPopNameArr = newValue;
    //        print("left here")
        }
        get {
            if(birthArr.count == 1){
                
                return ["nobody died today :)"];
            }else{
                return birthPopNameArr
            
            }
        }
      }
   
    
    
    
    
    


}
