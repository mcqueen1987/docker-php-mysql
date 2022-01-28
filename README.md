
![Screenshot](web/app/src/image/productsList.png?raw=true "homepage")

## Prerequisites

**Make sure you have `Docker` & `Docker Compose` installed.**


## Run the application

1. Start application
```
    source .env
    make docker-start 
```

2. After containers get ready (about 1 min), then import data fixture via:
```
    make db-fixtures
```

Then you can access [http://localhost:8000](http://localhost:8000/)


## Code

* Index: web/public/index.php
* API: web/public/product.php
