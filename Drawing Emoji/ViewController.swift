//
//  ViewController.swift
//  Drawing Emoji
//
//  Created by Jube on 2022/9/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var shapeSegment: UISegmentedControl!
    @IBOutlet weak var sliderNumberLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emojiLabel.text = "š½š½\nš½š½\n"
    }
    @IBAction func slider(_ sender: UISlider) {
        sender.value = sender.value.rounded()
        let number = Int(sender.value)
        sliderNumberLabel.text = "\(number)"
        var content = ""
        if shapeSegment.selectedSegmentIndex == 0 {
            for _ in 1...number {
                for _ in 1...number {
                    content += "š½"
                }
                content += "\n"
            }
        } else if shapeSegment.selectedSegmentIndex == 1 {
            for i in 1...number {
                for _ in 1...i {
                    content += "š½"
                }
                content += "\n"
            }
        } else if shapeSegment.selectedSegmentIndex == 2 {
            for i in 1...number {
                for _ in i..<number {
                        content += "š·"
                    }
                for _ in 1...(2 * i - 1) {
                    content += "š½"
                }
                content += "\n"
            }
        } else {
            for i in 1...(number * 2 - 1) {
                if number > i {
                    for _ in i...(number-1) {
                        content += "š·"
                    }
                    for _ in 1...(2 * i - 1) {
                        content += "š½"
                    }
                } else if number < i{
                    for _ in 1...(i - number){
                        content += "š·"
                    }
                    for _ in 1...(4 * number - 2 * i - 1) {
                        content += "š½"
                    }
                } else {
                    for _ in 1...(2 * i - 1) {
                        content += "š½"
                    }
                }
                
                content += "\n"
            }
        }
        
        emojiLabel.text = content
    }
    
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        slider.setValue(2, animated: true)
        sliderNumberLabel.text = "\(Int(slider.value))"
        if sender.selectedSegmentIndex == 0 {
            emojiLabel.text = "š½š½\nš½š½\n"
        } else if sender.selectedSegmentIndex == 1 {
            emojiLabel.text = "š½\nš½š½\n"
        } else if sender.selectedSegmentIndex == 2 {
            emojiLabel.text = "š·š½\nš½š½š½\n"
        } else if sender.selectedSegmentIndex == 3 {
            emojiLabel.text = "š·š½\nš½š½š½\nš·š½\n"
        }
    }
    
}

