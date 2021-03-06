//
//  RealmExt.swift
//  Boilerplate-iOS
//
//  Created by Tang Tuan on 3/15/22.
//

import RealmSwift

extension Object {
    static func build<O: Object>(_ builder: (O) -> Void ) -> O {
        let object = O()
        builder(object)
        return object
    }
}

extension Realm {
    
    func writeAsync<T : ThreadConfined>(realm: Realm, obj: T, errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }, block: @escaping ((T?) -> Void)) {
        do {
            try realm.write {
                block(obj)
            }
        } catch {
            errorHandler(error)
        }
    }
    
    func writeAsync<T : ThreadConfined>(realm: Realm, objects: [T], errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }, block: @escaping (([T]?) -> Void)) {
        do {
            try realm.write {
                block(objects)
            }
        } catch {
            errorHandler(error)
        }
    }
}
