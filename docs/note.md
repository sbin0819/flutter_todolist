## 21-12-02

기본 셋업을 하고 플러터 기본 사용법을 숙지 중임

## 21-12-03

생각보다 기초가 부족해서 작업시간이 더뎠다.
Column/Row 내부에서 ListView가 적용이 잘 되지 않는다.

## 21-12-04

정말 어렵게 라우팅에 argument들을 넘길 수 있었다.
작업에 속도가 안 나오는 이유는 아직 dart 라는 언어와 flutter라는 프레임워크가
익숙하지 않은 탓인 거 같다. 타입 체크가 너무 생소하다.

[Pass arguments to a named route](https://flutter-ko.dev/docs/cookbook/navigation/navigate-with-arguments)
[Named Routing을 이용한 Navigation](https://seizemymoment.tistory.com/51)


## 21-12-05
- Theme 적용
- TextFormField 적용
- font 적용
* firebase 연결을 준비해야 할 거 같음

[form](https://docs.flutter.dev/cookbook/forms/validation)

## 21-12-06

파이어베이스 기본 셋업을 했다.

[flutter - firebase](https://firebase.flutter.dev/)
[crud](https://medium.com/flutter-community/flutter-crud-operations-using-firebase-cloud-firestore-a7ef38bbf027)


## 21-12-07

cloud database 읽기 스펙 확인
[flutter tip](https://dev.to/chektek/11-beginner-tips-for-google-s-flutter-ood)


## 21-12-12
- write_todo_screen
- firebase 연결 카테고리


`firebase 퓨처연결 초기 형태`
```dart
 final CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('api/user1/todos');
  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();
    final response = querySnapshot.docs.map((doc) => doc.data()).toList();
    setState(() => _todolist = response);
  }
```

문제 
- collection path를 할당 된 변수로 넣었을 떄 문제가 발생한다. 임시 조치를 했는데 플러터 내부 동작원리랑 관련된 문제라 학습이 필요할 거 같다.
- initState 및 플러터의 생명주기 학습
- model 활용법


[async data 할당하기](https://www.codegrepper.com/code-examples/dart/how+to+put+value+from+async+function+as+parameter+flutter)
[class 생성](https://app.quicktype.io/)

- 할 일
  [] spec
    [] 투두리스트 작성 가능
    [] 투두리스트 카테고리 등록가능
    [] 수정, 삭제 가능
  [] 유저
  [] screen
    [x] route 등록
    [] 페이지 구성
  [] 스타일w
    [] theme 활용
  [] 데이터
    [] todo model
    [] category model
  [] list view 적용
    [x] 기본 적용
    [] ListView.build 적용
