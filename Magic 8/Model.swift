//
//  Logic.swift
//  Magic 8 iPhone
//
//  Created by Jevgeni Vakker on 31.08.2022.
//

import Foundation
import UIKit

// Array of answers
let answers = [
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful",
    "It is impossible to predict now",
    "The outcome is unclear",
    "I'm not sure, ask again",
    "Focus and try again",
    "It's unlikely",
    "Better luck next time",
    "The signs point to no",
    "Highly doubtful",
    "Maybe, but unlikely",
    "The outlook is not good",
    "My sources say maybe",
    "Don't bet on it",
    "It's a long shot",
    "Try again tomorrow",
    "The answer is within you",
    "You already know the answer",
    "It's not looking good",
    "Ask a different question",
    "The stars are not aligned",
    "Ask again in a week"
]

// Output a random answer
func randomAnswer() -> String {
    let random = Int.random(in: 0...answers.count - 1)
    return answers[random].uppercased()
}

// Vibration of the phone
func vibrationSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.prepare()
    generator.notificationOccurred(.success)
}

