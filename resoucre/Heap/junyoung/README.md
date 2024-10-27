# 힙(Heap)이란?
Heap이란 데이터에서 최솟값과 최댓값을 빠르게 찾기 위해 고안된 완전 이진 트리 (Complete Binary Tree)

우선순위 큐와 같이 최대 혹은 최소의 값을 자료구조에 사용되는 알고리즘입니다.

<br>

## Heap을 사용하는 이유

최솟값이나 최댓값을 찾기위해 배열을 사용한다면 시간 복잡도가 O(N)이 소요됩니다.

하지만 힙을 사용한다면 O(logN)만큼 소요되므로, 배열보다 성능이 좋은 Heap을 사용합니다.

<br>

### 우선순위 큐(Priority Queue)란?
큐는 먼저 들어오는 데이터가 먼저 나가는 선입선출 (FIFO) 형식의 자료구조지만 

우선순위 큐는 들어오는 순서에 상관 없이 우선순위가 높은 데이터가 먼저 나가는 자료구조이다.

<br>

### 왜 힙(Heap)은 우선순위 큐(Priority Queue)에 적용되는 알고리즘일까?
효율적인 삽입과 삭제 연산을 보장하기 때문입니다. 우선순위 큐는 특정 우선순위를 기준으로 가장 높은 우선순위에 해당하는 요소를 빠르게 추출해야 하는 자료구조입니다.

Heap은 최대 힙(Max-Heap)과 최소 힙(Min-Heap)이 존재하는데 각각 루트의 값이 최소 혹은 최대로 유지하기 때문에 우선순위가 높은 값을 찾는 것이 매우 빠릅니다.

<br>

## 힙(Heap)의 조건
힙은 최대힙(Max-Heap)과 최소힙(Min-Heap)으로 나누어집니다.

### 최대힙(Max-Heap)
최대힙(Max-Heap)은 자식 노드의 값보다 부모 노드의 값이 큽니다.
<img width="842" alt="image" src="https://github.com/user-attachments/assets/b3b52b9d-19c3-430f-a541-2b024a7873bb">

### 최소힙(Min-Heap)
최소힙(Min-Heap)은 부모 노드의 값보다 자식 노드의 값이 큽니다.
<img width="842" alt="image" src="https://github.com/user-attachments/assets/8699f745-f8aa-40bf-b4d6-5590888f46b9">

<br>

### 완전 이진 트리(Completed Binary Tree)의 형태를 가집니다.

완전 이진 트리(Completed Binary Tree)는 노드가 왼쪽부터 채워지는 특성을 가지고 있습니다.
<img width="1759" alt="image" src="https://github.com/user-attachments/assets/521ce432-3fae-4058-8530-3cf9431e7989">

<br>

### 중복을 허용합니다.
힙에서는 왜 중복을 허용할까요??

이유는 힙은 최솟값과 최댓값을 빠르게 찾는 것이 목적이고 정렬이 목적이 아니기 때문입니다.

그래서 부모와 자식 관계의 우선 순위관계만 유지된다면 

<img width="1748" alt="image" src="https://github.com/user-attachments/assets/657b68d0-7ed0-45d5-b29b-ccfd74a1cb17">

<br>

## 힙(Heap)의 데이터 삽입, 삭제
힙(Heap)은 완전 이진 트리(Completed Binary Tree)이기 때문에 노드 삽입은 최하단 왼쪽 노드부터 순차적으로 삽입됩니다.
<img width="1465" alt="image" src="https://github.com/user-attachments/assets/9b5128d0-426e-4e23-8754-3a26fe1e8767">

<br>

### 최대 힙(Max-Heap)에서 자식 노드를 삽입하는 과정에서 자식이 더 큰경우
자식 노드를 삽입해서 우선 완전 이진 트리를 만족한 이후에 자식과 부모를 비교해서 부모가 큰 경우에 노드를 바꿔주면서 올라갑니다.
<img width="1795" alt="image" src="https://github.com/user-attachments/assets/b72ed9ef-d756-4f4d-bb6b-40498afa8856">

<br>

## 힙(Heap)의 데이터 삭제
힙에서 데이터 삭제는 루트 노드를 삭제하고 힙을 재정렬합니다.

재정렬하기 위해서 마지막 노드를 루트로 올리는 행위를 하는데 이유는 완전 이진 트리를 유지하기 위함과 힙 정렬 특성을 복구하기 위해서 입니다.

<img width="1799" alt="image" src="https://github.com/user-attachments/assets/ca6772db-eb30-4db0-bf4f-7f554cb862bb">


