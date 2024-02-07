# ifelse 함수를 생성
# ifelse(조건식(벡터데이터), 참인경우 값, 거짓인 경우 값)
# ifelse함수의 결과 값의 데이터타입->벡터데이터
a<-c(TRUE,FALSE,TRUE,FALSE,FALSE)
ifelse(a,'T','F')

# ifelse 함수는 벡터데이터를 리턴
# ifelse 함수 안에는 비어있는 벡터 데이터에 데이터를 추가

# 벡터데이터에 데이터를 추가
result<-c() # 빈 벡터의 길이는 0이다
length(result)
# 1부터 10까지 반복을 하는 반복문 생성
for (i in 1:10){
  #print(i)
  if (i%%2==0){
    #print(i)
    result[length(result)+1]<-i # 빈 벡터 0의 다음자리에 새로운값 추가
  }
}
result

vector_a<-c(5,4,3,2,1)
# 벡터데이터에서 특정 위치의 데이터를 출력
vector_a[2]<-10
vector_a
# 벡터데이터에 새로운 값 추가
vector_a[6]<-11
vector_a
length(vector_a)

# ifelse 함수를 생성
# 매개변수 3개
iftest<-function(vector_bool, t, f){
  #되돌려주는 데이터는 벡터데이터->빈 벡터를 생성
  result<-c()
  # vector_bool의 데이터 타입은 벡터
  # 벡터의 길이만큼 반복하는 반복문을 생성
  # while 문에서 사용할 초기값을 지정
  i<-1
  
  # while 조건식
  while (i<=length(vector_bool)){
    # i가 의미하는 것은? 벡터데이터의 위치
    # vector_bool의 i번째 데이터가 참일때
    if(vector_bool[i]){
      #result에 t인자값(2번째 매개변수)을 추가
      result[i]<-t
    }else{
      # vector_bool의 i번째 데이터가 거짓인 경우
      # result에 f 인자값(3번째 매개변수)을 추가
      result[i]<-f
    }
    i<-i+1
  }
  return(result)
}
iftest(
  c(TRUE,TRUE,FALSE,FALSE),
  'T',
  'F'
)

# 결측치 데이터의 처리
c1=c(1,2,NA,4,5)
c2=c(1,2,3,4,5)
c3=c(NA,NA,3,4,5)

df=data.frame(c1,c2,c3)
df

str(df)

# 결측치의 존재 유무
is.na(df)

# 결측치의 개수확인
# TRUE의 개수를 확인
table(is.na(df))

# is.na 함수를 이용하여 데이터 필터링
is.na(df$c1)->flag
df[flag,] # 인덱스의 조건일때 콤마(,)
df[!flag,] #결측치가 아닌데이터만 출력

# 결측치가 포함된 컬럼 데이터는 연산이 제대로 이루어지지 않는다.
mean(df$c1)
mean(df$c2)
min(df$c1) #최솟값, 최댓값은 결측치가있다면 결측치 나와버림
max(df$c1, na.rm=T) # 결측치 제외하고 연산 시작하겠다

# 외부의 데이터 파일을 로드(csv)
exam=read.csv("../csv/csv_exam.csv")
str(exam)
# 결측치의 개수를 확인
table(is.na(exam))
# 결측치를 강제로 입력
exam[c(2,5),'math']<-NA
table(is.na(exam))

exam$math
library(dplyr)

# 수학 성적에서 결측치를 제거하고 그룹화 연산
exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math, ha.rm=T)) #결측치 존재하기 때문에 연산불가

exam %>%
  filter(!is.na(math)) %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math))
# omit은 잘 사용하지 않게됨

# 결측치에 특정한 데이터를 대입
# ifelse()+is.na()
is.na(exam$math)
ifelse(is.na(exam$math),mean(exam$math,na.rm=T),exam$math)
ifelse(is.na(exam$math),0,exam$math)

# 극단치
library(ggplot2)

mpg<-ggplot2::mpg        
str(mpg)
View(mpg)
# 고속도로 연비 데이터에서 극단치를 확인
boxplot(mpg$hwy)$stats
# 결측치 확인
table(is.na(mpg$hwy))

# 극단치인 데이터를 결측치로 대체
mpg$hwy<12 | mpg$hwy>37->flag
table(flag)

ifelse(flag,NA,mpg$hwy)->mpg$hwy
table(is.na(mpg))

# 컬럼의 이름을 변경
# manufacturer->제조사
# hwy->고속도로
# cty-> 시내
# class-> 차종
# drv-> 구동방식
mpg %>% 
  rename(
    제조사=manufacturer,
    고속도로=hwy,
    시내=cty,
    차종=class,
    구동방식=drv
  )->mpg

# 제조사별 고속도로의 평균 연비가 어떠한 제조사가 가장 좋은가?
# 제조사, 고속도로 컬럼 선택
# 제조사로 그룹화
# 그룹화 연산->고속도로 평균값
# 고속도로 데이터를 가지고 내림차순 정렬
# 상위 5개 출력
mpg %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비=mean(고속도로)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)

# 결측치 제거 방법1
mpg %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비=mean(고속도로,na.rm=T)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)

# 결측치 제거 방법2
mpg %>%
  filter(!is.na(고속도로)) %>% 
  select(제조사, 고속도로) %>% 
  group_by(제조사) %>% 
  summarise(평균연비=mean(고속도로)) %>% 
  arrange(desc(평균연비)) %>% 
  head(5)
