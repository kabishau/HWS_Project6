import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
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
        
        /*
        // using VFL - Auto Layout Visual Format Language
        let viewsDictionary = ["label1": label1, "label2": label2, "label3": label3, "label4": label4, "label5": label5]
        
        for label in viewsDictionary.keys {
            // method adds the array of constraints to VC's view
            view.addConstraints(
                // converts VFL into an array of constraints
                NSLayoutConstraint.constraints(
                    // H - horizontal, | - edge of the view, [] edges of label
                    withVisualFormat: "H:|[\(label)]|",
                    options: [],
                    metrics: nil,
                    views: viewsDictionary // key of String type \(label) is used to find the view in dictionary
                )
            )
        }
        
        let metrics = ["labelHeight": 88]
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                // "V:" - vertical,
                // "[label1(==88)]" - adds fixed height to view
                // "[label1(labelHeight)]" - uses metrics item
                // "[label2(label1)]" - makes equal height
                // "-" default 10pt
                // "-(>=10)-|" - adds at least 10pt at the bottom; the way to change default space
                // "(labelHeight@999)" - sets the priority to 999 instead of default 1000
                withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|",
                options: [],
                metrics: metrics,
                views: viewsDictionary
            )
        )
        */

        // alternative anchor approach, more readable but how it handles the landscape orientation like previous approach
        
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            //label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            //label.heightAnchor.constraint(equalToConstant: 88).isActive = true
            //label.heightAnchor.constraint(equalToConstant: (view.frame.size.height / 5) - 20).isActive = true
            label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10).isActive = true
            
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true   
            }
            
            previous = label
        }

        
    }
}

