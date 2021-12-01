//
//  ViewController.swift
//  BudgetFriend
//
//  Created by Ronan Tennant on 11/4/21.
//

import UIKit
import SwiftUI


struct Login: View {
    
    @ObservedObject private var viewModel = userViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.users) { user in
                VStack(alignment: .leading) {
                    Text(user.id).font(.title)
                    Text(user.bank_accounts).font(.subheadline)
                }
            }.navigationBarTitle("Users")
            .onAppear() {
                self.viewModel.fetchData()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}


class ViewController: UIViewController {
    
    
   
  
    
    @IBOutlet weak var accountBalance: UITextField!
    
    @IBOutlet weak var monthlyIncome: UITextField!
    
    @IBOutlet weak var lastBills: UITextField!
    
    @IBOutlet weak var percentSaving: UITextField!
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var midLabel: UILabel!
    
    @IBOutlet weak var bottomLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateBudget(_ sender: UIButton) {
        
        [let balance = (accountBalance.text! as NSString).floatValue]
        let income = (monthlyIncome.text! as NSString).floatValue
        let billTotal = (lastBills.text! as NSString).floatValue
        let savings = (percentSaving.text! as NSString).floatValue
        //print("Account Balance:", balance )
        //print("Income:", income )
        //print("Bill Total", billTotal )
        //print("Savings %", savings )
        let postBills = income - (billTotal*1.10)
        
        let amountToSavings = postBills*(savings/100)
        //print("Amount transferred to Savings: $", amountToSavings)
        
        let newAccountBalance = balance + income - (billTotal*1.10)-amountToSavings
        //print("Checking Balance After re-allocating funds: $", newAccountBalance)
        
        let spending = income - (billTotal*1.10) - amountToSavings
        //print("Safe Spending Amount: $", spending)
        
        topLabel.text = "Amount to Savings:  \(amountToSavings)"
        
        midLabel.text = "Safe Spending Amount: \(spending)"
        
        bottomLabel.text = "Checking Balance after re-allocating funds: \(newAccountBalance)"
    
        
        
    }
    
}

