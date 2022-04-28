import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tip = 0.10
    var people = 2
    var perPerson = "0.0"
    var billTotal = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        if sender == zeroPctButton {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0
        } else if sender == tenPctButton {
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tip = 0.1
        } else {
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
            tip = 0.2
        }
        billTextField.endEditing(true)
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        people = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = (billTotal + billTotal * tip) / Double(people)
            perPerson = String(format: "%.2f", result)
    }

        self.performSegue(withIdentifier: "toResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.perPerson = perPerson
            destinationVC.people = people
            destinationVC.tip = String(Int(tip*100)) + "%"
        }
    }
}




