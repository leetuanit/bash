Lập trình Shell
Các đặc tính cơ bản.
Lệnh đơn giản

Là lệnh được gọi thực hiện có tính chất đơn như dạng sau:

command <option> <arg>

Nhiều lệnh trên một dòng

Thông thường shell thông dịch từ đầu tiên như là lệnh còn các phần sau trở thành các đối số của lệnh. Có 3 ký tự đặc biệt mà khi shell thông dịch mà gặp phải sẽ hiểu sau đó là có một lệnh tiếp theo cần thực hiện đó là (;), (&), (|).

; Đợi lệnh trước hoàn thành mới thực hiện đến lệnh tiếp sau (tương đương với thực

hiện các lệnh riêng rẽ).

Ví dụ: $ who -H; df -v; ps -e

& Lệnh sau không cần phải đợi lệnh trước kết thúc thực hiện.

Ví dụ: $who -H & df -v & ps -e

| Sẽ lấy đầu ra của lệnh trước thành đầu vào của lệnh sau:

Định hướng vào ra

Khi shell thông dịch lệnh mà nhìn thấy các ký hiệu đổi hướng vào ra (<), (>). Các định hướng vào ra này được gửi tới subshell để điều khiển việc thực hiện lệnh.

Dòng lệnh dài

Trong trường hợp dòng lệnh dài muốn chia thành nhiều dòng thì kết thúc dòng phải đặt ký tự (\). Khi gặp ký tự này shell không coi dòng mới là kết thúc của đầu vào.

Ví dụ: $ echo Now is the time for all good men \_

to come to the aid of the party.

Biến trong shell

Khi shell gặp ký tự $ thì nó hiểu từ sau đó là tên biến. Shell sẽ tìm biến đ• được định nghĩa và lấy giá trị của nó. Nếu biến chưa định nghĩa thì một null string sẽ được trả lại.

Để đặt giá trị cho biến chỉ cần gán <tên biến>=giá trị

Ví dụ:

$ dir=ls

$ $dir f*

file1

file1a

Có thể thực hiện gán nhiều hơn một biến trên một dòng lệnh. Biến sẽ được gán từ phải sang trái.

Ví dụ: X=$Y Y=y

echo $X

y

Nếu muốn lấy đầu ra hoặc kết quả thực hiện một lệnh làm đối số của một lệnh khác thì có thể dùng dấu (`) để bao lấy lệnh cần thực hiện.

{ variable:-value} Gán giá trị ngầm định cho biến.

{ variable:+value} Nếu biến khác null thì sẽ lấy value.

${variable:?message} Nếu biến không đặt giá trị thì message sẽ được in ra đầu ra lỗi

chuẩn.

Ví dụ:

$ echo Hello $UNA

Hello

$ echo Hello ${UNA:-there}

Nếu không gán trị cho UNA thì sẽ hiện

Hello there

Nếu gán UNA=John

Sẽ hiện

Hello John

Khi shell gọi thực hiện một lệnh từ đầu tiên được hiểu là lệnh, các thông tin sau sẽ được hiểu là các đối số của lệnh. Đối số đầu tiên được gán tới biến $1, đối số thứ hai sẽ được gán tới biến $2 ... $9. Vị trí biến $0 luôn có chứa lệnh.

$# Chứa số đối số được gửi tới lệnh qua vị trí của biến.

$$ Chứa process ID của process hiện thời.

$? Có chứa trạng thái của lệnh cuối cùng. Mang giá trị 0 nếu lệnh thực hiện thành công,

khác không nếu có lỗi xuất hiện.

$* Có chứa tất cả positional argument được gửi tới chương trình.

Ví dụ: có một script file như sau:

# restoreany

cd $WORKDIR

cpio -i $* </dev/rmt0

$ restoreany file1 file2 file3

Các file file1 file2 file3 sẽ được restore từ thiết bị lưu trữ

Lệnh shift: Dùng để dịch biến vị trí

Ví dụ:

$1 = -r $2 = file1 $3 = file2

shift

Kết quả là:

$1 = file1 $2 = file2

Biến môi trường

Là các biến mà shell hoặc bất kỳ một chương trình nào có thể lấy và truy nhập nó. Có một số biến môi trường ngầm định trong shell như HOME, MAIL, PATH, PS1, PS2 ...

Lập trình shell
Trong Shell các biến thông thường được lưu dưới dạng character để thực hiện các tính toán toán học phaỉ dùng lệnh expr.

expr <integer operator integer>

Các toán tử là (+), (-), (*), (/).

Các phép toán trả về phần nguyên.

Ví dụ:

$ expr 5 + 7 / 3

7

Null command đại diện bởi dấu (:)

Để lấy dữ liệu trực tiếp từ người sử dụng dùng lệnh read

$ read var1 var2 var3

Hello my friend

$echo $var1 $var2 $var3

Hello my friend

Lệnh điều kiện
Lệnh true và false: True luôn trả giá trị 0, false luôn trả giá trị 1

Lệnh test: Kiểm tra điều kiện xem đúng hay sai

test condition

Testing Character Data

str1 = str2 Đúng nếu str1 giống hệt str2 (về độ dài và ký tự)

str1 != str2 Đúng nếu str1 khác str2

-n str1 Đúng nếu chiều dài str1 lớn hơn 0 (is not null)

-z str1 Đúng nếu str1 là null (chiều dài =0)

str1 Đúng nếu str1 khác null

Testing Numeric Data

int1 -eq int2 Đúng nếu int1 bằng int2

int1 -ne int2 Đúng nếu int1 khác int2

int1 -gt int2 Đúng nếu int1 lớn hơn int2

int1 -ge int2 Đúng nếu int1 lớn hơn hoặc bằng int2

int1 -lt int2 Đúng nếu int1 nhỏ hơn int2

int1 -le int2 Đúng nếu int1 nhỏ hơn hoặc bằng int2

Testing for Files

-r filenm Đúng nếu user có quyền đọc filenm

-w filenm Đúng nếu user có quyền ghi trên filenm

-x filenm Đúng nếu user có quyền thực hiện filenm

-f filenm Đúng nếu filenm là regular file

-d filenm Đúng nếu filenm là thư mục

-c filenm Đúng nếu filenm là character special file

-b filenm Đúng nếu filenm là block special file

-s filenm Đúng nếu kích thước filenm khác 0

-t fnumb Đúng nếu fnumb (1 by default) là terminal device

Shorthand Method of Doing Tests

Bởi vì lệnh test là một trong những lệnh quan trọng bậc nhất trong shell để cho shell gần với các ngôn ngữ lập trinhf khác người ta đ• thay test bằng bao đóng ([]).

Ví dụ:

$ int1=4

$ [ $int1 -gt 2 ]

$ echo $?

0

if-then

if command_1

then

command_2

command_3

fi

Nếu command_1 Thực hiện thành công thì command_2, command_3 mới được thực hiện tiếp theo.

if-then -else

if command_1

then

command_2

command_3

else

command_4

command_5

fi

if -then-elif

if command

then

command

elif command

then

command

elif command

then

command

fi

Lệnh case

case value in

pattern1)

command

command;;

pattern2)

command

command;;

...

patternn)

command;

esac

Lệnh case chỉ thực hiện một lệnh tại một thời điểm nếu giá trị phù hợp với pattern, Các lệnh tiếp sau đó sẽ được thực hiện cho đến khi gặp (;;).

Lệnh lặp
Lệnh while : Thực hiện khi điều kiện còn đúng

while command

do

command

...

command

done

Lệnh until Thực hiện cho đến chi điều kiện đúng

until command

do

command

...

command

done

Lệnh for: Thực hiện lần lượt ứng các giá trị trong arg

for variable in arg1 arg2 ... argn

do

command

...

command

done

Lệnh break: Cho phép thoát khỏi vòng lặp.

Shell Functions
funcname ()

{

command

... _

command;

}

Lệnh trap
Trong quá trình thực hiện các shell script có thể tạo ra nhiều các file tạm dùng trong quá trình thao tác dữ liệu. Tuy nhiên trong quá trình chạy không tránh khỏi các sự cố, hoặc các thao tác từ phía người sử dụng nhằm ngừng thực hiện tiến trình giữa chừng. Để có thể thực hiện việc xoá các file tạm này hoặc thực hiện các thao tác nào đó khi tiến trình bị ngừng thực hiện dùng lệnh trap.

trap command_string signals

Signal Description

0 Shell exit

1 Hangup

2 Operator Interrupt

3 Quit

9 Kill

15 Software Termination (kill signal)

Ví dụ:

trap "rm $TEMPDIR/*$$; exit" 1 2 15

Thực hiện lệnh điều kiện với cấu trúc AND(&&) và OR (||)
Thông thường để thực hiện các lệnh theo điều kiện ta có thể sử dụng các lệnh trong lập trình shell để thực hiện. Tuy nhiên Shell cung cấp tổ hợp lệnh thực hiện điều kiện là && và ||.

command1&&command2

Trong tổ hợp lệnh này thì lệnh đầu tiên được thực hiện trước nếu quá trình thực hiện kết thúc hoàn thành (trả giá trị 0) thì lệnh tiếp sau đó mới được thực hiện. Tổ hợp trả giá trị đúng (0) khi các lệnh đều trả giá trị đúng (0)

command1||command2

Trong tổ hợp lệnh này thì lệnh đầu được thực hiện trước và nếu nó kết thúc có lỗi (khác 0) thì lệnh tiếp sau đó mới được thực hiện. Tổ hợp trả giá trị sai khi tất cả các lệnh đều trả giá trị sai (khác 0)

Debugging Shell Programs

Để lần bước theo các lệnh trong chường trình shell dùng lệnh.

sh -x <shell file>

Lệnh sẽ thực hiện từng lệnh trong file và hiện nó lên màn hình.