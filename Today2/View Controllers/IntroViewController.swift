//
//  IntroViewController.swift
//  Today2
//
//  Created by Ved Joshi on 1/18/21.
//

import UIKit

class IntroViewController: UIViewController, CountProtocol {
    func setBLabelText(count: Int) {
        birthLabel.text = String(count)
    }
    
    func setDLabelText(count: Int) {
        deathLabel.text = String(count)
    }
    
    func setELabelText(count: Int) {
        eventLabel.text = String(count);
    }
    
    var d = Day();
    var manager = DataManager()
    var dayString1 = "";
  
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    
    @IBOutlet weak var birthLabel: UILabel!
    override func viewWillAppear(_ animated: Bool) {
      //  super.viewDidLoad()
        infoLabel.text = "Select a date and explore";
      
        super.viewWillAppear(animated)
     //   clearAll();
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = DataManager()
        Constants.dayString = Int(d.getPopDate()) ?? 20210208;
        
        
        
        infoLabel.text = "Select a date and explore";
        clearAll();
        
        if !Reachability.isConnectedToNetwork(){
        //    print("Internet Connection not Available!")
            showAlert(self);
          
            
            
        }
        
        
        manager.fetchData(query: getQuesryString(sender: datePicker));
        
        
        let defaultCenter = NotificationCenter.default
           defaultCenter.addObserver(self,
                                     selector: #selector(self.handleCompleteDownload),
               name: NSNotification.Name(rawValue: "CompleteDownloadNotification"),
               object: nil)
      //  usleep(1000)
       // print("doedfsfdfsdfasfsfsa")
    //   setLabelCounts()
        
        
        
        
        
        
    }
    
    @objc func handleCompleteDownload(){
        
        setLabelCounts()
        //  print(Constants.deathEventArrGS.count)
        
    }
    
    
    func setLabelCounts (){
      
        DispatchQueue.main.async { [self] in
            
        
            deathLabel.text = String( Constants.deathEventArrGS.count)
            birthLabel.text = String(Constants.birthEventArrGS.count)
            let count = Constants.eventYearArrGS.count
            if(count == 0){
                eventLabel.text = String(Int.random(in: 40..<85))
            }else{
                
                eventLabel.text = String(count)
            }
        }
        
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
        infoLabel.text = d.getDate(dates: sender.date);
     
        manager = DataManager();
        
        manager.fetchData(query: getQuesryString(sender: datePicker))
        
        
        
     //   usleep(1000)
       // print("doedfsfdfsdfasfsfsa")
     //   setLabelCounts()
        
        
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
          //  usleep(50);
            print("gach")
            self.performSegue(withIdentifier: "goToEvent", sender: self)
        }else{
            manager = DataManager()
            manager.fetchData(query: getQuesryString(sender: datePicker));
            
        }
    }
    
    @IBAction func birthPressed(_ sender: Any) {
        
        
            if(Constants.birthEventArrGS.count != 0){
               
                self.performSegue(withIdentifier: "goToBirth", sender: self)
            }else{
                manager = DataManager()
                
                manager.fetchData(query: getQuesryString(sender: datePicker));
                
            }
        
          
    }
    @IBAction func deathPressed(_ sender: UIButton) {
        
        
        
            if(Constants.deathEventArrGS.count != 0){
               
                self.performSegue(withIdentifier: "goToDeath", sender: self)
            }else{
                manager = DataManager()
                manager.fetchData(query: getQuesryString(sender: datePicker));
                
            }
    }
    
    
   
    
    
    
    
    
    
    
}
