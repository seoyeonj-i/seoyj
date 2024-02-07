# 매개변수가 존재하지 않는 함수를 생성
func_1<-function(){
  print('hello r')
}

# 생성된 함수 호출
func_1()
func_2<-function(){
  return("hello r") #hello r이라는 단어를 되돌려준다
}
func_2()

result1<-func_1()
result2<-func_2()
print(result1)

# 매개변수 존재하는 함수 생성
func_3<-function(input_x,input_y){
  result<-input_x+input_y
  print(result)
}

result3=func_3(10,3)

# 변수의 종류
# 전역 변수(전역:전체의 영역)
# 함수 내부나 외부 어디서든 사용이 가능한 변수
# 지역변수 : 함수 내부에서 생성된 변수들은 함수 내부에서만 사용이 가능
# 함수의 외부에서 지역변수를 호출하면 호출이 되지 않는다-> 지역변수를 휘발성 변수라고 부르기도함
print(result)
# 매개변수 : 함수를 생성할 때 인자 값(입력값)이 저장되는 공간
# 지역변수와 마찬가지로 함수 내부에서만 사용 가능

# 매개변수의 개수와 인자의 개수를 다르게 호출하는 경우
func_3(10) # 두개 넣어야하는데 하나만 넣었으니 에러발생
func_3(10,2,3) # 마찬가지로 세개도 에러발생

# 인자 개수가 가변인 경우의 함수를 생성 -> ...은 몇개의 인자든 받겠다 라는 뜻
func_4 <- function(...){
  print(c(...))
}
func_4()
func_4(1,2,3,4)
func_4(10,20,30,40,50,60,70)

# 함수를 이용해서 커스텀 연산자 생성
"%s%"<-function(input_x, input_y){
  result<-input_x^input_y
  return(result)
}
10%s%5

# 매개변수에 기본값을 설정하여 함수 생성
func_5<-function(input_x,input_y,input_z){
  result<-input_x+input_y-input_z
  return(result)
}
func_5(5,10,3)

# 위의 func_5(5,10,3) 호출 과정
#-> input_x=5, input_y=10, input_z=3
#-> result=5+20-3
#-> return(12)

func_5(10, input_z=1) # 다른사람이 쓴 매개변수 끌고올때 값 하나만 변경하고싶다면,,

# 매개변수가 2개인 함수 생성
# 매개변수 사이의 값들을 모두 합하여 되돌려주는 함수 생성
func_6<-function(start, end){
  # start부터 end까지의 합
  # 누적합을 할 수있는 데이터의 공간 생성(변수생성)
  result=0
  #start부터 end까지 반복을하는 반복문 생성
  for(i in start:end){
    # i에 대입되는 데이터는?-> 벡터데이터의 각 원소들이 하나씩 대입하여 반복 실행
    # result에 누적합 실행
    result=result+i
  }
  return(result)
}
func_6(1,10)
func_6(1,100)

min(5,3,8,1,10)
max(10,3,6,11,8)


# 함수 생성
# 매개변수는 2개 생성
# 첫번째 매개변수는 데이터 하나를 저장
#두번째 매개변수는 인자의 개수가 가변인 경우
func_8 <- function(val, ...){
  # 최소값을 되돌려주는 함수
  result <- val
  # result와 두번째 입력값을 비교하여 작은 값을 result에 담아준다
  # result와 세번때 입력값을 비교하여 작은값을 result에 담아준다
  for(i in c(...)){
    if (result > i){
      result <- i
    }
  }
  return(result)
} 
func_8(10, 3)
func_8(3, 4)
func_8(10,2,5,1,7)

# 평균을 구하는 함수 생성
mean(1:10)

# 매개변수가 가변인 함수 생성
# 인자값들을 모두 더한다(반복문 사용)
# 합계라는 초기 데이터를 생성하여 0을 대입
# 인자들을 벡터 데이터로 변환
# 반복문을 이용하여 모든 데이터 누적합
# 합계에 인자의 개수로 나눠준다
# 결과를 되돌려준다

calculate_average <- function(...){
  args <- list(...)  # 가변 인자들을 리스트로 변환
  total_sum <- 0  # 초기값 설정
  num_args <- length(args)  # 인자 개수 확인
  
  # 반복문을 통해 모든 인자의 합을 계산
  for(arg in args){
    total_sum <- total_sum + arg
  }
  
  # 평균 계산
  average <- total_sum / num_args
  
  return(average)
}

# 테스트
result <- calculate_average(10, 20, 30)
print(paste("평균값:", result))

# 교수님 정답
func_9<-function(...){
  result=0 #합계
  cnt=0
  for (i in c(...)){
    #print(i)
    result=result+i
    cnt=cnt+1
  }
  avg_result=result/cnt
  return(avg_result)
}
func_9(5,3,4)

# 교수님 정답=> 코드길이 줄이기
func_10<-function(...){
  result=sum(...)/length(c(...))
  return(result)
}
func_10(5,3,1)

test_sum<-function(...){
  result=0
  for (i in c(...)){
    result=result+i
  }
  return(result)
}

test_sum(5,3,1)
test_sum()

test_len<-function(value){
  cnt=0
  for (i in value){
    cnt=cnt+1
  }
  return(cnt)
}
test_len(c(1,5,3))
test_len()

# 데이터프레임 생성
# 벡터데이터들을 이용하여 데이터 프레임 생성
name<-c('A','B','C','D','E')
grade<-c(1,3,2,2,1)
data.frame(name, grade)->student

# 행렬생성
# cbind(): 열을 추가하는 함수
midturm<-c(70,80,75,60,90)
final<-c(80,90,70,75,85)
score<-cbind(midturm,final)

# 행렬과 데이터프레임 결합
data.frame(student, score)
cbind(student, score)

# 벡터데이터 생성
gender=c('m','f','f','m','f')

# 데이터프레임과 벡터데이터와 행렬을 결합
data.frame(student,gender,score)
cbind(student,gender,score)->students

test_vec=c(1,2,3,4)
# 길이가 다른 벡터데이터를 결합
cbind(students,test_vec)
data.frame(students, test_vec) #두 개 다 에러발생(길이가다른것은X)

# 파생변수를 생성
# 데이터프레임에서 새로운 컬럼을 추가하는 작업
# 기존에 있는 데이터에서 분석에서 사용할 데이터가 존재하지않을때
# 데이터를 가공하여 새로운 데이터를 생성

students
# 기존에 생성했던 벡터데이터들의 합
midturm+final
# 데이터프레임에서 특정 컬럼을 선택하여 합
students$midturm+students[['final']]->total

# cbind(),data.frame()함수를 이용하여 파생변수 생성
cbind(students, total)
data.frame(students,total)

students$total<-students$midturm+students$final
students

# students에 파생변수를 생성
# 평균성적을 생성
# 컬럼의 이름은 mean으로 지정
students$total/2->mean
data.frame(students,mean)
students$mean<-(students$midturm+students$final)/2
students

# 열 삭제하기
students<-subset(students,select=-mean.1)
students

# 새로운 학생 정보 추가
data.frame(name='F',grade=1,gender='M',midturm=80,final=70,total=150,mean=75)->new_student
# 데이터프레임 행을 추가
rbind(students,new_student)
# data.frame() 함수는 행추가 x -> 에러발생->rbind 사용
data.frame(students,new_student)

new_student2=data.frame(name='G',gender='M',midturm=80,final=70,total=150,grade=1,mean=75)
rbind(students, new_student2)
# 순서와 상관없이 컬럼이름으로 자동 입력되므로 순서는 상관없음

# 리스트형태 데이터
list_a=list(name='test',age=20)
list_a
list_a$name
list_a$loc='seoul' #데이터추가
list_a

# 리스트데이터에서 value가 벡터데이터인 경우
list_b=list(
  name=c('test','test2'),
  age=c(20,30)
)
list_b

# 리스트 2차원데이터에서 'test' 문자열 추출하려면
# 리스트에서 key값을 이용하여 데이터를 추출
list_b$name[1]
list_b['name']
list_b[['name']][1] #벡터데이터로 변환(대괄호 두개)

# 필터
# 데이터프레임명[행의조건, 열의조건]
students[1,] # 인덱스가 1과 같은 데이터만 보겠다
students[c(1,3),]
# 학년이 1학년인 학생의 정보만 출력
students$grade == 1->flag
students[flag,]
!flag
students[!flag,]

# 행과 열의 조건식으로 모두 이용하여 데이터 추출
# 여학생들의 중간, 기말 성적만 추출
# 여학생->인덱스 조건식(gender=='f')
# 중간,기말성적->컬럼 조건식(midturm, final)
students$gender=='f'->flag2
students[flag2,]
students[flag2, c("midturm","final")]

# 전체 학생중 중간성적이 80이상이고 기말성적도 80이상인 학생정보 출력
students$midturm>=80->flag3
students[flag3,]
students$final>=80->flag4
students[flag4,]
#여기까진 그냥 내가 해본거 -> 따로따로출력

(students$midturm>=80)&(students$final>=80)->flag5
students[flag5,]

# 데이터의 순서를 변경하는 함수
# 컬럼의 순서를 변경
student[c('grade','name')]
# 인덱스의 순서를 변경
students[c(3,2,1,5,4),]

# 학년을 기준으로 오름차순 정렬
# order()사용: 벡터데이터의 데이터들을 오름차순 정렬하고 위치 출력
order(students$grade)->flag6
students[flag6,]

# 기말성적을 기준으로 내림차순 정렬
# order() 함수에서 특정 매개변수의 인자값을 true로 변경하면 내림차순 정렬이됨
order(students$final) # 오름차순
order(students$final, decreasing = TRUE) # 내림차순

# 외부 패키지 설치
install.packages('dplyr')
# 패키지 로드
library(dplyr)

# 컬럼의 이름 변경
# rename(데이터프레임명, 새로운 컬럼의 이름= 변경할 컬럼의 이름)
students
rename(students, mean_score=mean)->students

# ifelse(조건식, 참인경우 출력값, 거짓인경우 출력값)
# 조건식을 이용하여 파생 변수 생성
ifelse(
  students$mean_score>=75,'pass','fail'
)->res # students 테이블에 값 추가
students$result<-res
students

# 75점 초과인 경우에는 pass
# 75점인 경우는 hold
# 75점 미만인 경우는 fail
ifelse(
  students$mean_score>75,
  'pass',
  ifelse(
    students$mean_score==75,
    'hold',
    'fail'
  )
)
