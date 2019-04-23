//
// Created by Qin Guan on 2019-03-18.
// Copyright (c) 2019 masterapp. All rights reserved.
//

import Foundation

public enum Login: String {
  case GIDSUCCESS = "GIDSUCCESS"
  case GIDLOGINERROR = "GIDLOGINERROR"
  case SIGNEDIN = "SIGNEDIN"
}

public func getURL(_ path: String) -> URL {
  let p = "http://localhost:8080" + path
  return URL(string: p)!
}
