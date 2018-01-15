curl -XPOST http://localhost:9200/test/articles/1 -d '{
    "content": "The quick brown fox"
}'
curl -XPOST http://localhost:9200/test/articles/2 -d '{
    "content": "What does the fox say?"
}'
curl -XPOST http://localhost:9200/test/articles/3 -d '{
    "content": "The quick brown fox jumped over the lazy dog"
}'
curl -XPOST http://localhost:9200/test/articles/4 -d '{
    "content": "The quick lazy brown fox did not jump."
}'

