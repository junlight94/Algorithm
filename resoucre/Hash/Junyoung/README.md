# 해시(Hash)
해시는 데이터를 고정된 크기의 값으로 변환하는 과정이며, 주로 해시 함수(Hash Function)를 통해 수행됩니다.

해시는 효율적인 데이터 검색 및 저장에 사용되며, 이를 통해 데이터를 빠르게 조회하거나 무결성을 검증할 수 있습니다.

- 해시값(Hash Value): 해시 함수의 출력값으로, 입력된 데이터의 고유한 식별자 역할을 합니다.
- 해싱(Hashing): 주어진 Key로부터 Value를 찾아내는 과정을 의미합니다. 즉, 데이터를 효율적으로 다루기 위한 프로세스입니다.

### 장점
- 해시 테이블을 이용하면 평균적으로 O(1)의 시간복잡도로 데이터를 검색할 수 있습니다.
- 파일이나 데이터를 해시값으로 비교하여 변조 여부를 쉽게 확인할 수 있습니다. (Check Sum)

### 단점
- 해시는 고정된 길이의 해시값으로 변환하기 때문에 완벽한 해시는 존재할 수 없으며 이로 인하여 해시충돌이 발생할 수 있습니다.

<br>

### 해시 함수(Hash Function)
특정 데이터를 입력으로 받아 고정된 크기의 해시값을 출력하는 함수입니다. 해시 함수는 주어진 입력에 대해 항상 동일한 결과를 반환하며, 이는 입력 데이터의 고유한 식별자로 사용됩니다.

주로 데이터를 고정된 크기의 값으로 변환하여, 검색 및 저장에 용이하게 하거나, 데이터 무결성을 검증하는 데 사용됩니다.

<br>

### 해시 알고리즘(Hash Algorithm)
해시 함수를 생성하는 구체적인 절차 또는 방법입니다. 해시 알고리즘은 해시값을 계산하는 데 필요한 모든 단계와 수학적 규칙을 정의합니다.

유명한 해시 알고리즘으로는 MD5, SHA-1, SHA-256 등이 있습니다.

- MD5: 128비트 해시 값을 생성하는 알고리즘
- SHA-1: 160비트의 해시 값을 생성하는 알고리즘
- SHA-256: 256비트 해시 값을 생성하는 알고리즘

<br>

### 해시 테이블(Hash Table)
해시 테이블(Hash Table)은 키(Key)와 값(Value) 쌍을 저장하는 자료 구조로, 데이터를 매우 빠르게 검색, 삽입, 삭제할 수 있는 효율적인 방법을 제공합니다.

해시 함수(Hash Function)를 이용해 키를 해시값으로 변환하고, 이 해시값을 기반으로 데이터를 저장하거나 검색하는 방식으로 동작합니다.

여기서 실제 값이 저장되는 장소를 버킷 또는 슬롯이라고 한다.

<br>

### 버킷(Bucket)
해시 테이블에서 데이터를 저장하고 관리하기 위해 사용하는 개념입니다.

버킷은 해시 테이블의 값을 저장하기 위한 기본 구조로 활용되기도 하지만, 충돌을 처리하기 위한 방법으로도 활용됩니다.

해시 테이블에서 해시 함수는 주어진 키를 기반으로 특정 인덱스를 계산하여 그 위치에 값을 저장합니다. 

이때 여러 데이터가 같은 인덱스에 할당될 경우 충돌을 해결하는 방식을 활용하여서 데이터를 저장하게 됩니다.

<br>

# 해시 충돌(Hash Collision)

해시 함수가 서로 다른 입력값에 대해서 같은 해시 값을 반환할 때 발생하는 현상입니다.

이런 현상이 일어나는 이유는 고정된 값을 출력하는 해시에서 입력 값이 무한할 수 있기 때문에 다른 입력에 대해서 같은 결과가 나올 경우 충돌이 생길 수 밖에 없습니다.

해시 충돌이 발생하는 원리는 비둘기집 원리(Pigeonhole Principle)로 설명을 많이 합니다.

비둘기집 원리는 수학에서 자주 사용되는 기본적인 원리로, 간단하게 말하면 "n+1마리의 비둘기를 n개의 비둘기집에 넣으면, 적어도 하나의 비둘기집에는 두 마리 이상의 비둘기가 들어간다"는 개념입니다.

<br>

## 해시 충돌을 해결하는 방법

### 체이닝(Chaining)
<img width="1005" alt="스크린샷 2024-10-06 오후 11 12 01" src="https://github.com/user-attachments/assets/ff491bbe-fa8b-4567-82d6-adb35760495a">

해시 충돌이 발생했을 때, 동일한 해시값을 가진 데이터들을 연결 리스트(Linked List)로 묶어 저장하는 방식입니다.

이 방법은 해시 충돌 문제를 간단하게 해결할 수 있으나 빈번한 충돌이 일어나는 경우 리스트를 탐색해야 되기 때문에 시간 복잡도가 O(N)으로 증가합니다.

<br>

### 개방 주소법(Open Addressing)
<img width="821" alt="스크린샷 2024-10-06 오후 11 12 06" src="https://github.com/user-attachments/assets/80e2e6ed-554a-4d4c-907c-953def77bbdb">

충돌이 발생했을 때 빈 버킷을 찾아 데이터를 저장하는 방식입니다. 체이닝과 달리, 충돌이 발생하면 해시 테이블 내에서 빈 슬롯을 찾는 방식으로 문제를 해결합니다.

주요 기법으로 linear probing, quadratic probing, double hashing이 있습니다.

<br>

# 프로그래머스 의상 문제
[코드](https://github.com/junlight94/Algorithm/blob/main/resoucre/Hash/Junyoung/clothes.swift)

<br>

### 문제
![스크린샷 2024-10-07 오후 8 11 41](https://github.com/user-attachments/assets/ed939faf-f4ed-40e1-a064-54301bbb72a1)


### 풀이
의상의 카테고리와 해당 카테고리에 포함된 의상이 몇개 인지 for문을 돌려서 dictonary에 추가합니다.

의상의 종류는 Key값으로 그리고 수량은 key가 중복되면 value를 1 증가시킵니다.

```swift
var categoryCount: [String: Int] = [:]
    
    clothes.forEach { cloth in
        let category = cloth[1]
        categoryCount[category, default: 0] += 1
    }
```

<br>

계산하는 방법은 의상의 카테고리 종류를 곱하여서 총 입을 수 있는 경우의 수를 구하는데 여기서 몇가지 조건을 추가합니다.

1. 해당 의상을 안 입을 경우를 생각해서 각 카테고리에 안 입는 경우를 추가합니다. (x+1) * (y+1)
2. 그리고 아무것도 안 입는 경우는 없다는 조건이 있기 때문에 전체 계산된 식에서 1을 빼줍니다. (x+1) * (y+1) - 1

```swift
var combinations = 1

for count in categoryCount.values {
    combinations *= (count + 1)
}
    
return combinations - 1
```

### 논의점
프로그래머스 제일 따봉이 많은 풀이 방법입니다.

이건 시간 복잡도가 O(N^2)일까요?? 해시 문제인데 해시로 접근한 것 같지 않은 풀이 방법입니다.

```swift
func solution(_ clothes:[[String]]) -> Int {
    let types = clothes.compactMap({ $0.last })
    let typeSet = Set(types)
    let categories = Array(typeSet)

    let counts = categories.map({ category in
        return clothes.filter({ $0.last == category }).count + 1
    })

    return counts.reduce(1,  { $0 * $1 }) - 1
}
```
