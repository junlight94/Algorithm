import UIKit
/*
 해시 알고리즘이 무엇인지?
 
 해시
    - 키 값 형태의 하나의 자료구조
    - 하나의 key는 하나의 value에 매핑(하나의 key는 여러개의 value를 가질 수 없다.)
    - key는 중복되지 않는다.
 
 해싱 = 주어진 데이터로 해시 함수를 활용해 해시값을 만들어 내는 과정
 해시 값(hash value) = 입력 데이터를 고정된 길이의 데이터로 변환된 값
 해시 테이블 = 데이터가 해시 함수를 거쳐 저장되는 테이블
 
 리소스를 활용해 속도를 높인다.
 
 ex) 해시 테이블
 인덱스, 키: 해시값 벨류
 1: 123
 2: 234
 3: 345
 4: 456
 
 장점: 해시 테이블을 이용하면 빠르게 접근이 가능하다.
 유저가 345를 입력하고 해당 값에 접근하고 싶은 경우 해시함수를 거쳐 345를 활용해 3을 만들어내고 3에 접근하면 데이터가 있는지 없는지 바로 확인 가능
 
 해싱 콜루젼(해시 충돌)이란?
 - 서로 다른 key들이 같은 hash를 가질 때 발생
 key1 != key2, BUT hf(key1) == hf(key2) 일 경우 발생
 
 - 발생하는 이유
    1. perfect hash function구현의 어려움.
    2. input의 사이즈는 광범위 한데 해시값의 사이즈는 제한적이다.
 
 내 서비스에 가입한 사람의 번호를 key, 그 사람의 정보를 value로 hash map에 저장한다면?
 
 해싱 콜루젼을 해결하는 방법은?
 - Separate chaining: 추가적인 공간을 활용하여 해결하는 방식
    - Linked List
        hash Table
        key value
        |0|  해당 bucket을 linked list로 묶어서 저장
        |1|  506 -> 100 -> 299
        
        - 저장할 때에는 앞에 추가
        - 검색할 때에는 순차적으로 검색
        - 시간 복잡도가 O(N) 된다.
 
 
 - Open Addressing: 충돌 발생 시 인접한 비어있는 공간(bucket)에 저장
    - Linear Probing: 고정폭으로 이동하여 빈 공간을 찾음
        hf_lp(key, i) = hf(key) + i where i: 충돌횟수
        
        key value
        |0|  100
        |1|
        
        ex)
        101 해시 결과 = 0
        0에는 이미 100이 존재
        i += 1을 해 나감(빈 공간이 나타날 때 까지)
        
        - 클러스터링이 발생할 수 있음(데이터가 모여있는 상황이 발생할 수 있음)
 
 
    - Quadratic Probing: 제곱수로 이동하여 빈 공간을 찾음
        hf_qp(key, i) = hf(key) + i^2 where i: 충돌횟수
 
    - Double Hashing: 또다른 hash function을 사용하여 빈 공간을 찾음
        hf_dh(key, i) = hf1(key) + i * hf2(key) where i: 충돌횟수
 
 그래서 해시알고리즘 시간 복잡도는?
    - 해시함수의 시간 복잡도 O(1)
    - 충돌 발생으로 인해 O(N)이 될 수 있음
*/


/*
 
 1. 비밀번호 찾기
 
 let NM = readLine()!.split(separator: " ").map { Int($0)! }
 let N = NM[0]
 let M = NM[1]

 var dic: [String: String] = [:]

 // 사이트 주소와 비밀번호가 공백으로 구분되어 주어진다.

 for _ in 0..<N {
     let namePassword = readLine()!.split(separator: " ").map { String($0) }
     let name = namePassword[0]
     let password = namePassword[1]
     dic[name, default: ""] = password
 }

 for _ in 0..<M {
     let name = readLine()!
     
     print(dic[name] ?? "")
 }
 
 시간복잡도:
    - O(N + M)
 
 */

/*
 
 2. 의상
 
동그란 안경
검정 선글라스
파란색 티셔츠
청바지
긴 코드
동그란 안경, 파란색 티셔츠
동그란 안경, 파란색 티셔츠, 청바지
동그란 안경, 파란색 티셔츠, 긴 코트
동그란 안경, 파란색 티셔츠, 청바지, 긴코트
동그란 안경, 청바지
동그란 안경, 청바지, 긴코트
동그란 안경, 긴코트
검정 선글라스, 파란색 티셔츠
검정 선글라스, 파란색 티셔츠, 청바지
검정 선글라스, 파란색 티셔츠, 긴코트
검정 선글라스, 파란색 티셔츠, 청바지, 긴코트
검정 선글라스, 청바지
검정 선글라스, 청바지, 긴코트
검정 선글라스, 긴코트
파란색 티셔츠, 청바지
파란색 티셔츠, 청바지, 긴코트
파란색 티셔츠, 긴코트
청바지, 긴코트

각 종류별로 한 개씩 선택가능
종류          이름                      경우의 수
얼굴: 동그란 안경, 검정 선글라스, 입지 않음      3
상의: 파란색 티셔츠, 입지 않음                2
하의: 청바지, 입지 않음                     2
겉옷: 긴 코드, 입지 않음                    2

(3 * 2 * 2 * 2) - 1(모두 입지 않음) = 23
 
 
 func solution(_ clothes:[[String]]) -> Int {
     
     var dic = [String: Int]()
     
     for ware in clothes {
         let name = ware[0]
         let type = ware[1]
         
         dic[type, default: 0] += 1
     }
     
     return dic.values.reduce(1) { $0 * ($1 + 1) } - 1
 }
 
 시간복잡도:
    - O(2N)
 
*/
