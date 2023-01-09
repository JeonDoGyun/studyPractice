# RxSwift
## Step1

- 비동기처리

main thread 이외에 다른 thread를 같이 이용해서(MultiThread) 원하는 작업을 동시에 처리할 수 있도록 하는 처리 방식

- Escaping이 필요한 이유

본체 함수 내의 작업이 완료된 시점에 Completion 안의 작업이 끝나지 않았음에도 리턴되는 에러를 해결하고자 사용

@escaping을 명시해서 끝난 뒤에도 해야 될 작업이 있다는 것을 명시

Completion 작업이 Optional인 경우엔 default가 nil이라서 명시 안해도 상관 없음

- 비동기처리의 단점

여러 작업을 처리해야될 때 코드의 양이 많아지고 가독성이 떨어짐

코드를 유지보수 하기에 어려움

## Completion 말고 Return 값으로 받아올 수는 없을까? → 고안된 것이 Promise, Bolt, RxSwift

나중에생기는데이터 → Observable

나중에오면할일 → Subscribe / event가 오게 됨
(event의 종류 : .next, .completed, .error)

일을주고받을때 → onNext() / next()

1. 비동기로 생기는 데이터를 Observable로 감싸서 Return하는 방법

- Observable.create() {data}
- data.onNext()로 데이터 전달 → 이 데이터는 .subscribe의 event로 들어감
- data.onCompleted()로 끝났음을 명시
- Disposables.create()를 return해서 create()를 통해 받은 데이터를 내려가게 만듦

 - URLSession을 사용하는 Observable.create()

```swift
func downloadJson(_ url: String) -> Observable<String?> {
        // 1. 비동기로 생기는 데이터를 Observable로 감싸서 Return하는 방법
        return Observable<Any>.create() { emitter in
            let url = URL(string: url)!
            let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
                guard err == nil else {
                    emitter.onError(err!)
                    return
                }
                if let dat = data, let json = String(data: dat, encoding: .utf8) {
                    emitter.onNext(json) // 값을 여러 개 전달 가능
                }
                emitter.onCompleted() // 끝나는 시점
            }
            
            task.resume()
            
            return Disposables.create() {
                task.cancel()
            }
        }
```

- Observable의 생명주기

<진행>

create

→ subscribe(실행되는 시점, Observable을 만들기만 한다고 해서 create()의 내용이 실행되지는 않는다는 말)

→ onNext / onError(이 경우 바로 끝남)

---

<끝>

→ onComplete

→ Disposed(한 번 끝낸 subscribe에 대해 그 이후의 코드에서 처리할 수 없고, 다시 subscribe를 해줘야 다룰 수 있음. 이 때의 subscribe는 이전의 subscribe와 별개의 것임)

49:38

2. Observable로 오는 데이터를 받아서 처리하는 방법
