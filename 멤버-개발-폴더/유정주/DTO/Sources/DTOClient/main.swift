import Foundation
import DTO

@DTO
struct TopicList {
    
    @Key("topicResponses") let topics: [Topic]
}

@DTO
struct Topic {
    
    @Key("topicIdx") let id: Int
    let title: String
    let sequence: Int
    @Key("subTopicResponses") let subTopics: [SubTopic]
}

@DTO
struct SubTopic {
    
    @Key("topicIdx") let id: Int
    @Key("parentTopic") let parentTopicID: Int
    let title: String
    let sequence: Int
}

let json = """
{
  "topicResponses": [
    {
      "topicIdx": 1,
      "title": "家族（かぞく）",
      "sequence": 1,
      "subTopicResponses": [
        {
          "topicIdx": 2,
          "title": "💪身体（からだ）",
          "sequence": 1,
          "parentTopic": 1
        },
        {
          "topicIdx": 3,
          "title": "🚮掃除（そうじ）",
          "sequence": 2,
          "parentTopic": 1
        },
        {
          "topicIdx": 4,
          "title": "💝家族（かぞく）",
          "sequence": 3,
          "parentTopic": 1
        }
      ]
    },
    {
      "topicIdx": 13,
      "title": "Emotions",
      "sequence": 2,
      "subTopicResponses": [
        {
          "topicIdx": 14,
          "title": "🚵問題（もんだい）",
          "sequence": 1,
          "parentTopic": 13
        },
        {
          "topicIdx": 15,
          "title": "💣危険（きけん）",
          "sequence": 2,
          "parentTopic": 13
        },
        {
          "topicIdx": 16,
          "title": "😄人の気持ち（ひとのきもち）",
          "sequence": 3,
          "parentTopic": 13
        }
      ]
    },
    {
      "topicIdx": 23,
      "title": "動物（どうぶつ）",
      "sequence": 3,
      "subTopicResponses": [
        {
          "topicIdx": 24,
          "title": "🐯動物（どうぶつ）",
          "sequence": 1,
          "parentTopic": 23
        },
        {
          "topicIdx": 25,
          "title": "🐱猫（ねこ）",
          "sequence": 2,
          "parentTopic": 23
        },
        {
          "topicIdx": 26,
          "title": "🐶犬（いぬ）",
          "sequence": 3,
          "parentTopic": 23
        },
        {
          "topicIdx": 27,
          "title": "🐾ペット",
          "sequence": 4,
          "parentTopic": 23
        }
      ]
    }
  ]
}
""".data(using: .utf8)!

do {
    let decodedData = try JSONDecoder().decode(TopicList.self, from: json)
    print("success decoding\n\(decodedData)")
} catch {
    print("failed decoding: \(error)")
}
