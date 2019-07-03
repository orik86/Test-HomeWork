//
//  Quest.swift
//  Test-HomeWork
//
//  Created by Aleksandr Gazizov on 03/07/2019.
//  Copyright © 2019 Aleksandr Gazizov. All rights reserved.
//

struct Questions {
    var quest: String
    var type: ResponseType
    var answers: [Answer]
    static var all: [Questions] {
        return [
            Questions(quest:
                """
                Какие числа выведет этот код:
                      for i in 1…7 {
                      if i % 3 == 0 {
                continue
                }
                print (“\\(i)”)
                }
                """,
                 type: .single, answers: [
                Answer(text: "1, 2, 4, 5, 7", answerTrue: true),
                Answer(text: "1, 2, 3, 4, 5, 7", answerTrue: false),
                Answer(text: "1, 2, 4, 5, 6, 7", answerTrue: false),
                Answer(text: "Нет правильного ответа", answerTrue: false),
            ]),
            Questions(quest: "Где правильно создан массив со строками:", type: .single, answers: [
                Answer(text: "var words = [](String)", answerTrue: false),
                Answer(text: "var words = [String]()", answerTrue: true),
                Answer(text: "var words : String = ()", answerTrue: false),
                Answer(text: "Нет правильного ответа", answerTrue: false),
                ]),
            Questions(quest: "Где правильно создана переменная:", type: .multiple, answers: [
                Answer(text: "x = 2.56", answerTrue: false),
                Answer(text: "var x = 2.56 : Float", answerTrue: false),
                Answer(text: "var x : Float = 2.56", answerTrue: true),
                Answer(text: "var x = 2.56", answerTrue: true),
                ]),
            Questions(quest: "Сколько циклов существует в Swift?", type: .single, answers: [
                Answer(text: "1", answerTrue: false),
                Answer(text: "2", answerTrue: false),
                Answer(text: "3", answerTrue: true),
                Answer(text: "4", answerTrue: false),
                ]),
            Questions(quest:
                """
                Где правильно добавляются элементы в массив?
                var digits = [Float]()
                """,
                type: .multiple, answers: [
                Answer(text: "digits.append(24.5)", answerTrue: true),
                Answer(text: "digits += [8.23, 5, 2.96]", answerTrue: true),
                Answer(text: "digits.insert (9.4, at: 1)", answerTrue: true),
                Answer(text: "digits[0] = 0.5", answerTrue: true),
                ])
        ]
    }
}
