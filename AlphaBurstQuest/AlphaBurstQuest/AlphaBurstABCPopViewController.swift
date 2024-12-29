//
//  ABCPopVC.swift
//  AlphaBurstQuest
//
//  Created by AlphaBurst Quest on 2024/12/29.
//


import UIKit

class AlphaBurstABCPopViewController: UIViewController {

    // UI Components
    let backgroundImageView = UIImageView()
    var balloons: [UIButton] = [] // To hold the balloon buttons
    var correctLetter: Character = "A"
    var gameFinished = false
    let gameTitleLabel = UILabel()
    let backButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        if val == 1 {
            correctLetter = "A"
        } else if val == 2 {
            correctLetter = "A"
        } else {
            correctLetter = "a"
        }
        setupUI()
    }

    // MARK: - Setup UI
    func setupUI() {
        // Background Image
        backgroundImageView.image = UIImage(named: "blue-wall-with-yellow") // Add a background image to Assets
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.isUserInteractionEnabled = false
        view.addSubview(backgroundImageView)
        
        gameTitleLabel.text = "AlphaBurst Quest Game"
                gameTitleLabel.font = UIFont.boldSystemFont(ofSize: 24)
                gameTitleLabel.textColor = .black
                gameTitleLabel.textAlignment = .center
                gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(gameTitleLabel)
        
        backButton.setImage(UIImage.init(named: "back_img"), for: .normal) // Add a back arrow image
                backButton.tintColor = .white
                backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
                backButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(backButton)

        // Constraints for background image
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            gameTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                       gameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

                       backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
                       backButton.centerYAnchor.constraint(equalTo: gameTitleLabel.centerYAnchor)
        ])

        // Start the game by generating the balloons
        generateBalloons()
    }

    // MARK: - Generate Balloons with Letters
    func generateBalloons() {
        // Clear previous balloons
        for balloon in balloons {
            balloon.removeFromSuperview()
        }
        balloons.removeAll()
        
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        
        if val == 1 {
            for unicodeValue in Unicode.Scalar("A").value...Unicode.Scalar("K").value {
                let letter = Character(Unicode.Scalar(unicodeValue)!)
                
                let balloonButton = UIButton(type: .custom) // Use .custom to avoid system button styles
                balloonButton.setTitle(String(letter), for: .normal)
                balloonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
                balloonButton.setTitleColor(.white, for: .normal)
                balloonButton.setBackgroundImage(UIImage(named: "baloon"), for: .normal) // Set balloon image
                balloonButton.layer.cornerRadius = 40 // For rounded shape
                balloonButton.clipsToBounds = true
                balloonButton.frame.size = CGSize(width: 80, height: 80)
                balloonButton.addTarget(self, action: #selector(balloonTapped(_:)), for: .touchUpInside)
                balloonButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(balloonButton)
                
                // Random positions for the balloons
                let randomX = CGFloat.random(in: 0...(view.bounds.width - 80))
                let randomY = CGFloat.random(in: 100...(view.bounds.height - 100))
                
                NSLayoutConstraint.activate([
                    balloonButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: randomX),
                    balloonButton.topAnchor.constraint(equalTo: view.topAnchor, constant: randomY),
                    balloonButton.widthAnchor.constraint(equalToConstant: 80),
                    balloonButton.heightAnchor.constraint(equalToConstant: 80)
                ])
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
                        balloonButton.addGestureRecognizer(panGesture)

                balloons.append(balloonButton)
            }
        } else if val == 2 {
            for unicodeValue in Unicode.Scalar("A").value...Unicode.Scalar("Z").value {
                let letter = Character(Unicode.Scalar(unicodeValue)!)
                
                let balloonButton = UIButton(type: .custom) // Use .custom to avoid system button styles
                balloonButton.setTitle(String(letter), for: .normal)
                balloonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
                balloonButton.setTitleColor(.white, for: .normal)
                balloonButton.setBackgroundImage(UIImage(named: "baloon"), for: .normal) // Set balloon image
                balloonButton.layer.cornerRadius = 40 // For rounded shape
                balloonButton.clipsToBounds = true
                balloonButton.frame.size = CGSize(width: 80, height: 80)
                balloonButton.addTarget(self, action: #selector(balloonTapped(_:)), for: .touchUpInside)
                balloonButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(balloonButton)
                
                // Random positions for the balloons
                let randomX = CGFloat.random(in: 0...(view.bounds.width - 80))
                let randomY = CGFloat.random(in: 100...(view.bounds.height - 100))
                
                NSLayoutConstraint.activate([
                    balloonButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: randomX),
                    balloonButton.topAnchor.constraint(equalTo: view.topAnchor, constant: randomY),
                    balloonButton.widthAnchor.constraint(equalToConstant: 80),
                    balloonButton.heightAnchor.constraint(equalToConstant: 80)
                ])
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
                        balloonButton.addGestureRecognizer(panGesture)

                balloons.append(balloonButton)
            }
        } else {
            for unicodeValue in Unicode.Scalar("a").value...Unicode.Scalar("z").value {
                let letter = Character(Unicode.Scalar(unicodeValue)!)
                
                let balloonButton = UIButton(type: .custom) // Use .custom to avoid system button styles
                balloonButton.setTitle(String(letter), for: .normal)
                balloonButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
                balloonButton.setTitleColor(.white, for: .normal)
                balloonButton.setBackgroundImage(UIImage(named: "baloon"), for: .normal) // Set balloon image
                balloonButton.layer.cornerRadius = 40 // For rounded shape
                balloonButton.clipsToBounds = true
                balloonButton.frame.size = CGSize(width: 80, height: 80)
                balloonButton.addTarget(self, action: #selector(balloonTapped(_:)), for: .touchUpInside)
                balloonButton.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(balloonButton)
                
                // Random positions for the balloons
                let randomX = CGFloat.random(in: 0...(view.bounds.width - 80))
                let randomY = CGFloat.random(in: 100...(view.bounds.height - 100))
                
                NSLayoutConstraint.activate([
                    balloonButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: randomX),
                    balloonButton.topAnchor.constraint(equalTo: view.topAnchor, constant: randomY),
                    balloonButton.widthAnchor.constraint(equalToConstant: 80),
                    balloonButton.heightAnchor.constraint(equalToConstant: 80)
                ])
                
                let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
                        balloonButton.addGestureRecognizer(panGesture)

                balloons.append(balloonButton)
            }
        }
        
        // Create balloons with letters A to Z
        
    }

    @objc func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        guard let draggedView = sender.view else { return }
        
        let translation = sender.translation(in: view)
        draggedView.center = CGPoint(x: draggedView.center.x + translation.x, y: draggedView.center.y + translation.y)
        sender.setTranslation(.zero, in: view)

        // Optional: Add boundary restrictions
        draggedView.center.x = max(40, min(view.bounds.width - 40, draggedView.center.x))
        draggedView.center.y = max(100, min(view.bounds.height - 40, draggedView.center.y))
    }
    // MARK: - Handle Balloon Tap
    @objc func balloonTapped(_ sender: UIButton) {
        guard let letter = sender.title(for: .normal) else { return }

        // Check if the tapped letter matches the current correct letter
        if letter.first == correctLetter {
            // Correct letter, pop the balloon (remove it)
            sender.isHidden = true
            correctLetter = nextLetter(after: correctLetter)
            
            let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
            if val == 1 {
                if correctLetter == "K" {
                    let alert = UIAlertController(title: "Congratulations!", message: "You've popped all the balloons!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { restart in
                        self.gameFinished = false
                        self.generateBalloons()
                        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
                        if val == 1 || val == 2 {
                            UserDefaults.standard.setValue(val + 1, forKey: "level")
                            UserDefaults.standard.synchronize()
                        }
                    }))
                    alert.addAction(UIAlertAction.init(title: "Quit Game", style: .cancel, handler: { quite in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    present(alert, animated: true)
                    gameFinished = true
                }
            } else if val == 2 {
                if correctLetter == "Z" {
                    let alert = UIAlertController(title: "Congratulations!", message: "You've popped all the balloons!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { restart in
                        self.gameFinished = false
                        self.generateBalloons()
                        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
                        if val == 1 || val == 2 {
                            UserDefaults.standard.setValue(val + 1, forKey: "level")
                            UserDefaults.standard.synchronize()
                        }
                    }))
                    
                    alert.addAction(UIAlertAction.init(title: "Quit Game", style: .cancel, handler: { quite in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    present(alert, animated: true)
                    gameFinished = true
                }
            } else {
                if correctLetter == "z" {
                    let alert = UIAlertController(title: "Congratulations!", message: "You've popped all the balloons!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { restart in
                        self.gameFinished = false
                        self.generateBalloons()
                        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
                        if val == 1 || val == 2 {
                            UserDefaults.standard.setValue(val + 1, forKey: "level")
                            UserDefaults.standard.synchronize()
                        }
                    }))
                    alert.addAction(UIAlertAction.init(title: "Quit Game", style: .cancel, handler: { quite in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    present(alert, animated: true)
                    gameFinished = true
                }
            }

            // If all balloons are popped, the game is finished
            
        } else {
            // Incorrect letter, show a message
            let alert = UIAlertController(title: "Try Again!", message: "Oops! You select wrong alphabet.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

    // MARK: - Get the Next Letter
    func nextLetter(after letter: Character) -> Character {
        // Return the next letter in the alphabet
        var alphabet = ""
        let val = UserDefaults.standard.value(forKey: "level") as? Int ?? 1
        if val == 1 {
            alphabet = "ABCDEFGHIJK"
        } else if val == 2 {
            alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        } else {
            alphabet = "abcdefghijklmnopqrstuvwxyz"
        }
        if let currentIndex = alphabet.firstIndex(of: letter) {
            let nextIndex = alphabet.index(after: currentIndex)
            if nextIndex < alphabet.endIndex {
                return alphabet[nextIndex]
            }
        }
        return letter // If no next letter, return current (game finished)
    }

   
    @objc func backButtonTapped() {
            // Dismiss the view controller or navigate back
        navigationController?.popViewController(animated: true)
        }
}
