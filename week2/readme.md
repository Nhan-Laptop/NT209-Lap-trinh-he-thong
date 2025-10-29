# WEEK2 - Lap trinh he thong 

## Bai1. 
In ra length của một chuỗi: 
```go
rs: 
    .string "..."
rs_len = . -rs
```
## Bai2: 
Tính kết quả của các số được 

nhập: 

```go
result = (a + b + c + d ) / 4
```

Nhập thì chỉ cần: 
```go
%eax = 3 // read  
%ebx = 0 // fd = 0 (sdtin)
```

## bai3 
Kiem tra 1 chữ có phải là hoa thường: 

```go
if input_user > 'a': 
    chu thuong
else: chu hoa
```

## bai4

Xem 1 chuỗi số có tăng dần không:
```go
left   = (%eax)
middle = 1(%eax)
right  = 2(%eax)
if left > middle: khong tang dan
if right < middle: khong tang dan
-> tang dan
```