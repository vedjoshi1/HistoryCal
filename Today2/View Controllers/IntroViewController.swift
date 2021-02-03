//
//  IntroViewController.swift
//  Today2
//
//  Created by Ved Joshi on 1/18/21.
//

import UIKit

class IntroViewController: UIViewController {
    let d = Day();
    var dayString1 = "";
 var manager = DataManager()
    override func viewWillAppear(_ animated: Bool) {
      //  super.viewDidLoad()
        super.viewWillAppear(animated)
     //   clearAll();
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        if !Reachability.isConnectedToNetwork(){
        //    print("Internet Connection not Available!")
            showAlert(self);
          
            
            
        }

        clearAll();
        
        
        
        
        
        manager.fetchData(query: getQuesryString(sender: datePicker))
        
        
        
        
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
    
    @IBAction func dateChosen(_ sender: UIDatePicker) {
        clearAll();
        print("hambo rambo lambo")
        manager.fetchData(query: getQuesryString(sender: datePicker));
    
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
    
        return quesryString;
      //  manager.fetchData(query: quesryString);
    }
    
    @IBAction func continueChosen(_ sender: UIButton) {
        
        
        
         
        
        self.performSegue(withIdentifier: "goToMain", sender: self);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToMain"){
            let destinationvc = segue.destination as! ViewController;
           // destinationvc.wasDatePicked =
            destinationvc.queryString =  getQuesryString(sender: datePicker);
            destinationvc.dayString = dayString1;
         }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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

    @IBAction func birthPicked(_ sender: Any) {
        if Constants.birthEventArrGS.count == 0{
            manager = DataManager();
            manager.fetchData(query: getQuesryString(sender: datePicker))
            
            
        }else{
            
            self.performSegue(withIdentifier: "goToBirth", sender: self)
            
        }
        
        
        
        
    }
    @IBAction func deathPicked(_ sender: Any) {
        if Constants.deathEventArrGS.count == 0{
            
            manager.fetchData(query: getQuesryString(sender: datePicker))
            
            
        }else{
            
            self.performSegue(withIdentifier: "goToDeath", sender: self)
            
        }
        
        
    }
    @IBAction func eventPicked(_ sender: Any) {
        if Constants.eventArrGS.count == 0{
            
            manager.fetchData(query: getQuesryString(sender: datePicker))
            
        }else{
            self.performSegue(withIdentifier: "goToEvent", sender: self)
            
            
        }
        
        
        
        
    }
}
