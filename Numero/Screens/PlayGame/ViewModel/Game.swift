
import Foundation

//MARK: - MaxGameValues

enum GameMaxValues {
    static let attemptsAllowed = 10
    static let numberToGenerate = 4000
}

class Game {
    var score: Int = 0
    var attempt: Int = 0
    var numbersToConvert: [Int] = []
    var answersToDisplay: [String] = []
    var isCorrectConversion: [Bool] = []
    
    var converter: Converter
    //MARK: - Initializer
    init() {
        converter = Converter()
        generatePlays()
    }
    
    // MARK: Public Methods
    func play(_ guess: Bool) -> (correct: Bool, score: Int)? {
        if done() {
            return nil
        }
        if isCorrectConversion[attempt] == guess {
            score = score + 1
            attempt = attempt + 1
            return (true, score)
        } else {
            attempt = attempt + 1
            return (false, score)
        }
    }
    
    func showNextPlay() -> (question: Int, answer: String) {
        return (numbersToConvert[attempt], answersToDisplay[attempt])
    }
    
    func done() -> Bool {
        return attempt >= GameMaxValues.attemptsAllowed
    }
    
    func reset() {
        score = 0
        attempt = 0
        numbersToConvert.removeAll()
        answersToDisplay.removeAll()
        isCorrectConversion.removeAll()
        generatePlays()
    }
}

// MARK: - Private methods
private extension Game {
    func generatePlays() {
        numbersToConvert = (1...GameMaxValues.attemptsAllowed).map{_ in
            Int(arc4random_uniform(UInt32(GameMaxValues.numberToGenerate))) + 1
        }
        answersToDisplay = numbersToConvert.enumerated().map{ (index, numberToConvert) in
            generateAnswers(index, number: numberToConvert)
        }
    }
    
    func showWrongConversion() -> Bool {
        return arc4random_uniform(2) == 0
    }
    
    func generateAnswers(_ index: Int, number: Int) -> String {
            let correctAnswer = converter.convert(number)
        if showWrongConversion() {
            isCorrectConversion.append(false)
            return correctAnswer.garbled()
        } else {
            isCorrectConversion.append(true)
            return correctAnswer
        }
    }
}
