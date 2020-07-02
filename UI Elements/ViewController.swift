//
//  ViewController.swift
//  UI Elements
//
//  Created by Eugene Kiselev on 02.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.value = 1

        label.text = String(slider.value)
        label.font = label.font.withSize(35)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .black
        slider.maximumTrackTintColor = .darkGray
        slider.thumbTintColor = .black
    }
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        
        label.isHidden = false
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            label.text = "The first segment"
            label.textColor = .red
        case 1:
            label.text = "The second segment"
            label.textColor = .gray
        case 2:
            label.text = "The third segment"
            label.textColor = .green
        default:
            break
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        
        label.text = String(sender.value)

        let backgroundColor = self.view.backgroundColor
        self.view.backgroundColor = backgroundColor?.withAlphaComponent(CGFloat(sender.value))
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        
        guard textField.text?.isEmpty == false else { return }
        
        if let _ = Double(textField.text!) {
            
            // Alert Controller:
            let alert = UIAlertController(title: "Wrong format", message: "Please enter your name", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            
            alert.addAction(okAction)
            present(alert, animated: true)
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
}


