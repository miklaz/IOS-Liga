//
//  TableViewData.swift
//  Lesson_7
//
//  Created by Михаил Зайцев on 19.03.2022.
//

import UIKit

let rock: [ModelSong] = [
    ModelSong(nameSinger: "Artist-1", cover: UIImage(systemName: "music.note"), rating: 3),
    ModelSong(nameSinger: "Artist-2", cover: UIImage(systemName: "music.quarternote.3"), rating: 2),
    ModelSong(nameSinger: "Artist-3", cover: UIImage(systemName: "music.note.list"), rating: 1)
]

let pop: [ModelSong] = [
    ModelSong(nameSinger: "Artist-4", cover: UIImage(systemName: "music.mic"), rating: 0),
    ModelSong(nameSinger: "Artist-5", cover: UIImage(systemName: "music.quarternote.3"), rating: 1),
    ModelSong(nameSinger: "Artist-6", cover: UIImage(systemName: "music.note"), rating: 2),
    ModelSong(nameSinger: "Artist-7", cover: UIImage(systemName: "music.note.list"), rating: 3),
]

let jazz: [ModelSong] = [
    ModelSong(nameSinger: "Artist-8", cover: UIImage(systemName: "music.note.list"), rating: 2),
    ModelSong(nameSinger: "Artist-9", cover: UIImage(systemName: "music.quarternote.3"), rating: 2),
    ModelSong(nameSinger: "Artist-10", cover: UIImage(systemName: "music.mic"), rating: 3),
]

var modelSelection: [ModelSelection] = [
    ModelSelection(open: true, data: rock, title: "Post-Grunge"),
    ModelSelection(open: true, data: pop, title: "Pop"),
    ModelSelection(open: true, data: jazz, title: "Hip-Hop")
]
