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
    var dict : [String:Int] = [:]
    var countArr : [(Int)] = [];
    var arr = Constants.birthYearArrGS;
    var aboom = Constants.birthArrGS;
     @IBOutlet weak var tableView: UITableView!
 
   
    
    
    @IBOutlet weak var textLabel: UILabel!
    func getReady(){
        
      //  print(Constants.birthPopDict)
    //    getPopularity();
        
        
        
        
        
    }
    
   
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     //   print("loaded")
      //  getReady();
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
   
    func sort(sortArr1:[String: Int],arr2:[String], arr3:[String]) -> (stringArr: [String], yearArr:[String], sortedArr:[Int]){
       
          var sortingArr : [(Int)] = []
        for name in arr2{
            
            if let index = name.index(of: ","){
               var str = String(name[..<index])
               str = str.trimmingCharacters(in: .whitespaces);
                sortingArr.append(sortArr1[str] ?? 0);
                  
                    
              
                
                
                
            } else{
                // print(name);
                 
                 
                    if let index1 = name.index(of: "("){
                     var str = String(name[..<index1])
                     str = str.trimmingCharacters(in: .whitespaces);
                        
                            sortingArr.append(sortArr1[str] ?? 0);
                  //          print(str);
                    //        print(sortArr1[index])
                      //      print("+++++++++")
                          
                       
                     
                    }else{
                        
                       
                            sortingArr.append(sortArr1[name] ?? 0);
                            
                      //      print(name);
                    //        print(sortArr1[index])
                        //    print("+++++++++")
                          
                            
                        
                       
                    }

            
            
        }
        }
       // print(sortingArr.count)
     //   print(arr2.count)
        let array1: [Int] = sortingArr
        let array2: [String] = arr2
        let array3: [String] = arr3
      //  print(array2.count)
    //    print(array1.count)
        
        //WORKING UP TO HERE!!!!!,,,,,,,,,,,,,
        // use zip to combine each (first, n.th) array pair and sort that based on the first
        let offsets = array1.enumerated().sorted { $0.element > $1.element }.map { $0.offset }
        

        let sorted1 = offsets.map { array1[$0] }
        let sorted2 = offsets.map { array2[$0] }
        let sorted3 = offsets.map { array3[$0] }
        
     //   print(sorted1)
      
        
       // print(sorted1.count)
       // print(sorted3)
        
      //  print(sorted2)
        return(sorted2, sorted3, sorted1);
    
        
    }
   


    @IBAction func onSortPressed(_ sender: Any) {
        let alertController = UIAlertController(title: "My AlertController", message: "choose your pokemon", preferredStyle: UIAlertController.Style.actionSheet)

      
        let numAscAction = UIAlertAction(title: "By Popularity", style: .default) { [self] (action: UIAlertAction) -> Void in
                    alertController.dismiss(animated: true, completion: nil)
           
            let dict = Constants.birthPopDict
//
            print(dict["Subhas Chandra Bose"])
          //  if dict.count == self.aboom.count{
            //    print("yes")
                
                      
                  
                let results = self.sort(sortArr1:dict, arr2:self.aboom, arr3:self.arr)
                  // self.countArr = results.sortedArr;
                    self.aboom = results.stringArr;
                    self.arr = results.yearArr;
                    self.tableView.reloadData()
 
 
        //    }else{
      //          print("no")
            /*
                let pG = PopularityGetter();
                pG.getBPopularity(strArr: aboom);
                testArrayInt = [];
                testArrayString = [];
                getReady();
                onSortPressed(self)
            //}
 */
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
        aboom.reverse()
        
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
            cell.yearLabel.text = String(arr[indexPath.row - 1]);
            cell.label.text = String(aboom[indexPath.row - 1])
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
    
    
    
    

