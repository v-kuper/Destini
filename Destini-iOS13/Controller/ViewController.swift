//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Vitali Kupratsevich on 17.02.25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !storyBrain.story.isEmpty {
            updateUI()
        }
        setupStyles()
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        guard !storyBrain.story.isEmpty else { return }
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.setQuestionText()
        choice1Button.setTitle(storyBrain.setChoice1Text(), for: .normal)
        choice2Button.setTitle(storyBrain.setChoice2Text(), for: .normal)
    }
    
    // MARK: - Настройка стилей UI
    func setupStyles() {
        setupButton(choice1Button)
        setupButton(choice2Button)
    }
    
    func setupButton(_ button: UIButton) {
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        button.titleLabel?.textAlignment = .center
    }
}

