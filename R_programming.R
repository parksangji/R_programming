# 패키지 설치
# install.packages("tidyverse")
# install.packages("tidymodels")
# install.packages("rstatix")


# 라이브러리
library(tidyverse)
library(tidymodels)
library(rstatix)

# 데이터 구조

# 스칼라 값 벡터처럼 사용 가능 
c(1)

num <- c(1,2,3,4)

a <- c("t",3,"td")


# 데이터 불러오기
data("iris")

# 데이터 변수명 확인 가능
str(iris)

# 간단하게 데이터 확인 : 주로 사용
glimpse(iris)

# 데이터 차원 확인 : 주로 사용
dim(iris)

iris$Species
iris[5:10,1:3]

# 티볼 형식으로 변경
irisTibble = as_tibble(iris)
str(irisTibble)
head(iris)
head(irisTibble)


# pipe %>%

print(irisTibble,n=15,width = Inf)

irisTibble %>%
  print(n=15, width = Inf)

irisTibble %>%
  .$Species

iris_df = as.data.frame(iris)


# 외부 데이터 가져오기

# 기존 df으로 불러오기

ist_df = read.csv(file = '01.ist_num.csv',
                  header = TRUE,
                  na.strings = "."
                  )

ist_df$t_group <- factor(ist_df$t_group,
                         levels = c(1,2),
                         labels = c("A자동차","B자동차")
                         )
str(ist_df)
head(ist_df)

ist_df$t_group %>%
  table() %>%
  barplot()


# tibble로 불러오기
ist_tb <- read_csv(file = '01.ist_num.csv',
                   col_names = TRUE,
                   na = ".")
str(ist_tb)

ist_tb <- ist_tb %>%
  mutate(t_group = factor(t_group,
                          levels = c(1,2),
                          labels = c("A자동차","B자동차차")))

# tibble 형식 문자로 저장된 파일 불러오기

ist_tb_ch <- read_csv(file = "01.ist_chr.csv",
                      col_names = TRUE,
                      na = ".",
                      locale = locale("ko",encoding="euc-kr")) %>%
  mutate_if(is.character, as.factor)
head(ist_tb_ch)


# 저장하기 

write.csv(ist_tb_ch,"ist_tb_ch.csv")
