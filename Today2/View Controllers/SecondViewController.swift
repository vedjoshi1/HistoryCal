//
//  SecondViewController.swift
//  today
//
//  Created by Ved Joshi on 9/20/20.
//  Copyright © 2020 Ved Joshi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var testArrayInt : [(Int)] = [];
    var testArrayString : [(String)] = [];
    var backgroundColor : UIColor?;
    var month : UIColor?;
    let dayte = Day();
   
    var arr = Constants.birthEventArrGS;
    
     @IBOutlet weak var tableView: UITableView!
 
   
    
    
    @IBOutlet weak var textLabel: UILabel!
    func getReady(){
        
      //  print(Constants.birthPopDict)
    //    getPopularity();
        
        
        
        
        
    }
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self;
       // print("this is good")
        
        
         
  //      dict["abooder"] = 56
        tableView.delegate = self
        tableView.register(UINib(nibName: "SadCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
  //THIS IS WHERE IT CRASHES
           //   countArr.append(counter)
       // cell.count = counter;
     
        
        
        
        /*
        self.view.backgroundColor = month!;
        rgbgetter.getRGB(color: month!);
        if(isBright(red: rgbgetter.getRed(), green: rgbgetter.getGreen(), blue: rgbgetter.getBlue(), alpha: 4) < 110){
            
          
            textLabel.textColor = UIColor.white;
            }
       print("alpha")
   */
    
    }
    
    
    
    
    
    @IBAction func onReturn( sender: UIButton) {
        
      dismiss(animated: true, completion:nil)
    }
     
     
    // Given three sequences, return a sequence of 3-tuples
   
    func sort(sortArr:[Event]) -> ([Event]){
       
        let descendingStrings = sortArr.sorted { $0.count > $1.count }
        
        return descendingStrings
    
        
    }
   


    @IBAction func onSortPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "My AlertController", message: "choose your pokemon", preferredStyle: UIAlertController.Style.actionSheet)

      
        let numAscAction = UIAlertAction(title: "By Popularity", style: .default) { [self] (action: UIAlertAction) -> Void in
                    alertController.dismiss(animated: true, completion: nil)
               
          
            arr = sort(sortArr: arr);
            tableView.reloadData();
            print("am here")
 
        //
            
     //   }else{
          //  self.onSortPressed(self)
           // let pG = PopularityGetter()
       //     pG.getBPopularity(strArr: aboom)
         
         //   }
 
            }
        let numDesAction = UIAlertAction(title: "Reverse Order", style: .default) { (action: UIAlertAction) -> Void in
                    
            self.descendSort();
                alertController.dismiss(animated: true, completion: nil)
            }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) -> Void in
                alertController.dismiss(animated: true, completion: nil)
            }
       
            alertController.addAction(numAscAction)
        
        alertController.addAction(numDesAction)
        
            alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    
      
    
    
    func descendSort(){
        arr.reverse()
       
        
        tableView.reloadData();
    }
    
    
}

extension SecondViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count + 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
            as! SadCell
        
        if(indexPath.row == 0){
            
            cell.yearLabel.text = "Year:";
                cell.label.text = "Person who was born";
            cell.label.textColor = UIColor.black
            cell.label.attributedText = NSAttributedString(string: cell.label.text!)

            // print("ok coomer")
            return cell;
         //   return cell;
        }else{
            cell.yearLabel.text = String(arr[indexPath.row - 1].year);
            cell.label.text = String(arr[indexPath.row - 1].description)
            cell.label.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            cell.label.attributedText = NSAttributedString(string: cell.label.text!, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
               return cell;
            
        }
        
    }
    
    
    
    
    
}







extension SecondViewController:UITableViewDelegate{
    func tableView(_ tableView1: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            return
            
        }
        let cell = tableView1.cellForRow(at: indexPath) as! SadCell
        var nameString = cell.label.text
        
        if let index = nameString?.firstIndex(of: ","){
            
            nameString = String(nameString![..<index])
        }
        
        if let index = nameString?.firstIndex(of: "("){
            
            nameString = String(nameString![..<index])
        }
        var name = nameString!;
        
        name = (name.trimmingCharacters(in: .whitespaces));
        name = name.replacingOccurrences(of: " ", with: "_")
    //    print(name)
      //  print("-------------------")
        
        
       
        name = name.folding(options: .diacriticInsensitive,
                                                     locale: Locale.current)
     //   print(formattedString)
        
        if let url = URL(string: "https://en.wikipedia.org/wiki/\(name)") {
            UIApplication.shared.open(url)
        }else{
            print("cannot")
        }
        
        
        
    }
        
        
}
    
    
    
    

