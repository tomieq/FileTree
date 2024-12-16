import Foundation

public class FileTree {
    
    private let fileManager = FileManager.default
    private let url: URL
    
    public init(_ url: URL) {
        self.url = url
    }
    
    public convenience init() {
        self.init(Documents.url)
    }
    
    public convenience init(_ path: String) {
        self.init(URL(fileURLWithPath: path))
    }
    
    public func tree(getInfo: @escaping (URL, Bool) -> String) -> String {
        url.relativePath + "\n" + self.crawl(url: url, prefix: "", getInfo: getInfo)
    }
    
    public var tree: String {
        url.relativePath + "\n" + self.crawl(url: url, prefix: "")
    }
    
    private func crawl(url: URL, prefix: String, getInfo: ((URL, Bool) -> String)? = nil) -> String {
        let files = (try? self.fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: [])) ?? []
        var output = ""
        files.enumerated().forEach { index, fileUrl in
            let isDir = (try? fileUrl.resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory ?? false
            let isLast = index == files.count - 1
            let graphic = isLast ? "└──" : "├──"
            let filename = fileUrl.pathComponents.last ?? "nil"
            let fileUrl = url.appendingPathComponent(filename)
            output.append("\(prefix)\(graphic) \(filename) \(getInfo?(fileUrl, isDir) ?? "")\n")
            if isDir {
                let newPrefix = prefix + (isLast ? "    " : "│   ")
                output.append(self.crawl(url: fileUrl, prefix: newPrefix, getInfo: getInfo))
            }
        }
        return output
    }
}
