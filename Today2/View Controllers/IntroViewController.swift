//
//  IntroViewController.swift
//  Today2
//
//  Created by Ved Joshi on 1/18/21.
//

import UIKit

class IntroViewController: UIViewController {
    let d = Day();
    var manager = DataManager();
    var dayString1 = "";
  //  var datePicked = true;
    override func viewWillAppear(_ animated: Bool) {
      //  super.viewDidLoad()
        super.viewWillAppear(animated)
     //   clearAll();
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll();
        
        if !Reachability.isConnectedToNetwork(){
        //    print("Internet Connection not Available!")
            showAlert(self);
          
            
            
        }
        
        
        manager.fetchData(query: getQuesryString(sender: datePicker));
        
        
        
        
    }
    func clearAll(){
        Constants.birthPopDict = [:]
        
            Constants.deathPopDict = [:]
        Constants.eventArrGS = [];
        Constants.deathEventArrGS = [];
        Constants.eventYearArrGS = [];
        Constants.birthEventArrGS = [];
      //  Constants.birthPopCountArr = [];
        
        
    }
    
    @IBAction func datePicked(_ sender: UIDatePicker) {
        clearAll();
        print("this")
        manager = DataManager();
        manager.fetchData(query: getQuesryString(sender: datePicker))
        
        
        
    }
    
    func getQuesryString(sender: UIDatePicker) -> String{
  
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        var string = formatter.string(from: sender.date)
        
        dayString1 = string
        string = String(string.suffix(4))
        var day = string.suffix(2);
        let mon = Int(string.prefix(2)) ?? 0;
        if(Array(day)[0] == "0"){
            day = day.suffix(1);
            
        }
          
        
        let quesryString = ("\(d.getMonth(month: mon))%20\(day)");
    //    datePicked = true;
     //   print(quesryString)
        return quesryString;
      //  manager.fetchData(query: quesryString);
    }
    
   
    func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "PROBLEM:", message:
            "Internet Connection Unavailable!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default) { (result : UIAlertAction) -> Void in
         
            
            if !Reachability.isConnectedToNetwork(){
               // print("Internet Connection not Available!")//
               
                self.showAlert(self);
                
            }else{
                
                self.viewDidLoad();
                
            }
            
        }
        
            
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    

         
        
    }
    @IBAction func eventPressed(_ sender: Any) {
        if(Constants.eventArrGS.count != 0){
            usleep(50);
            self.performSegue(withIdentifier: "goToEvent", sender: self)
        }else{
            manager = DataManager()
            manager.fetchData(query: getQuesryString(sender: datePicker));
            
        }
    }
    
    @IBAction func birthPressed(_ sender: Any) {
        
        
        
            if(Constants.eventArrGS.count != 0){
                usleep(50);
                self.performSegue(withIdentifier: "goToBirth", sender: self)
            }else{
                manager = DataManager()
                manager.fetchData(query: getQuesryString(sender: datePicker));
                
            }
    }
    @IBAction func deathPressed(_ sender: UIButton) {
        
        
        
            if(Constants.eventArrGS.count != 0){
                usleep(50);
                self.performSegue(withIdentifier: "goToDeath", sender: self)
            }else{
                manager = DataManager()
                manager.fetchData(query: getQuesryString(sender: datePicker));
                
            }
    }
}
