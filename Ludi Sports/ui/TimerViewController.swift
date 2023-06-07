//
//  TimerViewController.swift
//  Ludi Sports
//
//  Created by Michael Zanaty on 6/5/23.
//
import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var timer: Timer?
    var startTime: Date?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer?.invalidate()
        timer = nil
    }

    @objc func updateTimer() {
        if let startTime = startTime {
            let currentTime = Date().timeIntervalSince(startTime)
            let minutes = Int(currentTime / 60)
            let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
            let milliseconds = Int((currentTime * 100).truncatingRemainder(dividingBy: 100))

            let timeString = String(format: "%02d:%02d.%02d", minutes, seconds, milliseconds)
            timeLabel.text = timeString
        }
    }
}
