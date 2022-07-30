import UIKit

func isBalanced(s: String) -> String {
    var st = [Character]()
    
    for c in s {
        switch c {
        case "{", "(", "[":
            st.append(c)
        case "}":
            if (st.isEmpty || (st.last != "{")) {
                return "NO"
            }
            st.popLast()
        case ")":
            if (st.isEmpty || (st.last != "(")) {
                return "NO"
            }
            st.popLast()
        case "]":
            if (st.isEmpty || (st.last != "[")) {
                return "NO"
            }
            st.popLast()
        default: print("breaking \(c)")
        }
    }
    
    return st.isEmpty ? "YES" : "NO"
}

isBalanced(s: "{[()]}")
isBalanced(s: "[()]}")
isBalanced(s: "}{{}})((}}})(}}}())}()(()})}(()})}({)}({")
