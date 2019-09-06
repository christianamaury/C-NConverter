//
//  FinanceNewsAPIObjects.swift
//  News & Currency Converter
//
//  Created by cysparrow on 8/4/19.
//  Copyright © 2019 SweetestProductionsLLC. All rights reserved.
//

import Foundation
import UIKit

/*
 "status": "ok",
 "totalResults": 38,
 -"articles": [
 -{
 -"source": {
 "id": null,
 "name": "Deadline.com"
 },
 "author": "Greg Evans, Greg Evans",
 "title": "Taylor Swift Confirms Controversial Re-Recording Plans To ‘CBS Sunday Morning’ - Deadline",
 "description": "Taylor Swift’s controversial anti-Scooter efforts to re-record her old music is apparently on track, at least as intentions go. In an interview on CBS Sunday Morning this weekend, Swift confi…",
 "url": "https://deadline.com/2019/08/taylor-swift-cbs-this-morning-confirm-re-recording-plans-1202701120/",
 "urlToImage": "https://pmcdeadline2.files.wordpress.com/2019/08/taylor-swift-cbs.jpg?w=445",
 "publishedAt": "2019-08-21T21:18:00Z",
 "content": "Taylor Swift’s controversial anti-Scooter efforts to re-record her old music is apparently on track, at least as intentions go. In an interview on CBS Sunday Morning this weekend, Swift confirms the plan to correspondent Tracy Smith.\r\nSmith asks Swift about r… [+2069 chars]"
 },
 -{
 -"source": {
 "id": null,
 "name": "Triblive.com"
 },
 "author": "",
 "title": "Editorial: Do the math on jobs numbers - TribLIVE High School Sports Network",
 "description": "When you can’t quite believe what you hear, you might want to go back to the numbers. There’s nowhere that’s more true than when you look at a government report. Some of them are straightforward. This budget accounts for so much money in and so much money out…",
 "url": "https://triblive.com/opinion/editorial-do-the-math-on-jobs-numbers/",
 "urlToImage": "https://triblive.com/wp-content/uploads/2019/08/1570599_web1_WEB-job-application.jpg",
 "publishedAt": "2019-08-21T21:01:00Z",
 "content": "You are solely responsible for your comments and by using TribLive.com you agree to our\r\nTerms of Service.\r\nWe moderate comments. Our goal is to provide substantive commentary for a general readership. By screening submissions, we provide a space where reader… [+1626 chars]"
 },
*/

struct NewsApiObject: Codable
{
    let status: String?
    let totalResults: Int?
    
    //Array
    let articles: [APISKeyObjects]
}

struct Source: Codable
{
    var id: String?
    var int: Int?
}

struct APISKeyObjects: Codable
{
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

}


