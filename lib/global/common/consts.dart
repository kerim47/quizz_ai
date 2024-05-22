const gemini_api_key = 'AIzaSyDmW1Z1m1F8Q9lH1tR3o7Z0Q5H1J0V7lXo';
const gemini_api_key2 = 'AIzaSyCE1wsccx5LDAHruzyzEluiI3pphbAk6a8';
const prompt =
    """ile ilgili 4 soru 4 şık ve cevaplarını döndür. Şu Json formatında istiyorum.
          ```json{
            "sorular": [
              {
                 "soru": "",
                 "secenekler": ["...","...","...","..."],
                 "cevap": "..."
              },
              {
                 "soru": "",
                 "secenekler": ["...","...","...","..."],
                 "cevap": "..."
              },
              {
                 "soru": "",
                 "secenekler": ["...","...","...","..."],
                 "cevap": "..."
              },
              ],
          }```""";
