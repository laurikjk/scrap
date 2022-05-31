# 8
for (i in c(1:25)) {
  temp = dbinom(i, size = 25, prob = 0.6) 
  print(c(i, temp))
}

pnorm(140, mean = 130)
pnorm(120, mean = 130, lower.tail = FALSE)

pbinom(9, size = 15, prob = 0.5, lower.tail = FALSE)

res=0
for (i in c(10:15)) {
  res = res + dbinom(i, size = 15, prob = 0.5)
}
res

res=0
for (i in c(11:15)) {
  res = res + dbinom(i, size = 15, prob = 0.5)
}
res

qnorm(0.025)
qnorm(0.5)
qnorm(0.975)

q13_1 = pnorm(160, mean = 179, sd = 60)
q13_2 = pnorm(190, mean = 179, sd = 60, lower.tail = FALSE)

q13_1
q13_2
q13_1 > q13_2

qnorm(0.96, mean = 100, sd = 14.8)

1 - pnorm(2)


2*pt(2.9081, df = 8, lower.tail = FALSE)

temp = median(airquality$Temp)
temp2 = mean(airquality[airquality$Temp == temp,]$Wind)
temp2

t.test(
  airquality[airquality$Month == 5,]$Temp,
  mu=64,
  alternative="greater"
)

