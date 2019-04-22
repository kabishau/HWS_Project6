import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoContstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        label1.sizeToFit() //allows label's text fit the label
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = UIColor.cyan
        label2.text = "ARE"
        label2.sizeToFit()

        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = UIColor.yellow
        label3.text = "SOME"
        label3.sizeToFit()

        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = UIColor.green
        label4.text = "AWESOME"
        label4.sizeToFit()

        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = UIColor.orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        // using VFL - Auto Layout Visual Format Language
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionary.keys {
            // method adds the array of constraints to VC's view
            view.addConstraints(
                // converts VFL into an array of constraints
                NSLayoutConstraint.constraints(
                    withVisualFormat: "H:|[\(label)]|", // H - horizontal, | - edge of the view, [] edges of label
                    options: [],
                    metrics: nil,
                    views: viewsDictionary // key of String type \(label) is used to find the view in dictionary
                )
            )
        }
        
        view.addConstraints(
            NSLayoutConstraints.constraints(
                withVisualFormat: "V:|[label1]-[label2]-[label3]-[label4]-[label5]", // V - vertical, "-" default 10pt
                options: [],
                metrics: nil,
                views: viewsDictionary
            )
        )

    }
}

