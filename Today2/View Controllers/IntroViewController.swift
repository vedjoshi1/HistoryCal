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
       // print("erere")
     //   datePicked = false;
        // Do any additional setup after loading the view.
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
      /*
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        var string = formatter.string(from: sender.date)
        string = String(string.suffix(4))
        let day = string.suffix(2);
        let mon = Int(string.prefix(2)) ?? 0;
        
          let quesryString = ("\(d.getMonth(month: mon))%20\(day)");
    //    datePicked = true;
        print(quesryString)
    */
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

}
