//
//  ViewController.swift
//  today
//
//  Created by Ved Joshi on 9/12/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var queryString = "";
     @IBOutlet weak var popularityTableView: UITableView!
    var dayString = "";
    var dictionary : [String: Int] = [:];
    var isOpenToMove = false;
  
    @IBOutlet weak var dateLabel: UILabel!
    var d = Day();
    var manager = DataManager();
   //  @IBOutlet weak var datePicker: UIPickerView!
    var wasDatePicked = true;
    
    
    
    
    
  //  override prepare
    @IBOutlet weak var datePicker: UIDatePicker!
    //   @IBOutlet weak var alertButton: UIButton!
    override func viewDidLoad() {
        
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //   let date = d.getDate();
        //  print(arr)
        manager.fetchData(query: queryString);
      
        
        dayString = String(dayString.suffix(4));
        
        let mon = Int(dayString.prefix(2)) ?? 0;
        
        let monthString = d.getMonth(month: mon)
        
        var day = dayString.suffix(2);
        day += d.getSuffix(day: Int(day) ?? 0);
        
        dateLabel.text = "";
        
        let str = "You have chosen the " + day + " of " + monthString;
        
        var index = 0.0
        for char in str{
            Timer.scheduledTimer(withTimeInterval: 0.09*index, repeats: false) { (timer) in
                self.dateLabel.text?.append(char);
             //   if(self.dateLabel.text == str){
                    
               //     self.isOpenToMove = true;
                //}
            }
            
            index+=1;
        }
       
        if !Reachability.isConnectedToNetwork(){
        //    print("Internet Connection not Available!")
            showAlert(self);
          
            
            
        }else{
          //   print("Internet Connection Available!")
        }
        
      
         //   dateLabel.text = ;
    }

    
    @IBAction func birthSegueInitiated(_ sender: UIButton) {
     //   if(isOpenToMove){
            self.performSegue(withIdentifier: "birthSegue", sender: self)
        usleep(50);
      //  }
    }
    
    @IBAction func deathSegueInitiated(_ sender: UIButton) {
     //   if(isOpenToMove){
            
            self.performSegue(withIdentifier: "deathSegue", sender: self)
        usleep(50)
     //   }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "birthSegue"){
            let vc = segue.destination as! SecondViewController;
            vc.getReady();
            
            
        }
    }
   
    
    
    
    
    
    
    @IBAction func showAlert(_ sender: Any) {
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
    
}





