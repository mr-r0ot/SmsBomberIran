use reqwest::blocking::Client;
use serde_json::json;
use std::process;

fn clear_screen() {
    if cfg!(target_os = "windows") {
        let _ = std::process::Command::new("cmd").arg("/c").arg("cls").status();
    } else {
        let _ = std::process::Command::new("sh").arg("-c").arg("clear").status();
    }
}

fn sms(url: &str, header: reqwest::header::HeaderMap) {
    std::thread::sleep(std::time::Duration::from_secs(3));
    let client = Client::new();
    let body = json!(header);
    
    match client.post(url)
        .header(reqwest::header::CONTENT_TYPE, "application/json")
        .body(body.to_string())
        .send() {
        Ok(resp) => {
            if resp.status() == 200 {
                println!("[+] Sended");
            } else {
                println!("[!] Error !");
            }
        },
        Err(_) => {
            println!("[!] Error !");
        }
    }
}

fn main() {
    clear_screen();
    println!("Coded By NICOLA(Telegram: @black_nicola)\nGitHub: mr-r0ot
");

    let mut input = String::new();
    println!("Enter phone 09xxxxxxxxxx: ");
    std::io::stdin().read_line(&mut input).unwrap();
    let phone = input.trim();

    let mut input = String::new();
    println!("Enter Number sms and call: ");
    std::io::stdin().read_line(&mut input).unwrap();
    let repeat_count: usize = input.trim().parse().unwrap();

    let urls = vec![
        "https://example.com/api/endpoint1",
        "https://example.com/api/endpoint2",
        // Add more URLs here...
    ];

    let mut headers = vec![
        reqwest::header::HeaderMap::new(),
        reqwest::header::HeaderMap::new(),
        // Add more headers here...
    ];

    for i in 0..repeat_count {
        for (url, header) in urls.iter().zip(headers.iter()) {
            let url = url.to_string();
            let header = header.clone();
            let t = std::thread::spawn(move || {
                sms(&url, header);
            });
            t.join().unwrap();
        }
    }
}

fn main() {
    // Handle errors
    if let Err(e) = main() {
        eprintln!("Error: {}", e);
        process::exit(1);
    }
}
