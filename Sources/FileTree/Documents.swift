//
//  Documents.swift
//  FileTree
//
//  Created by Tomasz on 16/12/2024.
//
import Foundation

public enum Documents {
    public static var url: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
