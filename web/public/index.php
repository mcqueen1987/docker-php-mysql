<?php

?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
</head>

<body>
    <div id="app">
        <div class="container mt-5 py-2">
            <h1 class="my-2">Products</h1>

            <div class="header-row">
                <div class="items">
                    <label for="sortby">Sort products by:</label>
                    <select name="sortby" v-model="sortbySelected">
                        <option v-for="item in sortby" :key="item">{{item}}</option>
                    </select>
                    <label for="searchby">Search products by:</label>
                    <select name="searchby" v-model="searchbySelected">
                        <option v-for="item in searchby" :key="item">{{item}}</option>
                    </select>
                    <input type="text" v-model="searchbyInputValue">
                    <button @click="fetchProducts" >Search</button>
                </div>
            </div>

            <div class="row">
                <div v-for="product in products" :key="product.id" class="col-sm-6 col-md-4 p-2">
                    <!-- product list -->
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">{{product.description}}</h5>
                            <h6 class="card-subtitle mb-2 text-muted">{{product.description}}</h6>
                            <p class="card-text">BaseunitPrice: <b>{{product.currency}}{{product.baseunitprice}}</b></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/vue@2/dist/vue.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.25.0/axios.min.js"></script>
<script>
    var app = new Vue({
        el: '#app',
        data() {
            return {
                products: [],
                sortby: ['description', 'baseunitprice'],
                searchby: ['style', 'description', 'baseunitprice'],
                sortbySelected: '',
                searchbySelected: '',
                searchbyInputValue: ''
            };
        },
        beforeMount() {
            this.fetchProducts()
        },
        components: {},
        methods: {
            fetchProducts() {
                let baseUrl = '/products.php?';
                let sortByUrl = !!this.sortbySelected ? 'sort=' + this.sortbySelected : '';
                let searchByUrl = !!this.searchbySelected ? '&search=' + this.searchbySelected : '';
                let searchByValUrl = !!this.searchbyInputValue ? '&keyword=' + this.searchbyInputValue : '';

                let url = baseUrl + sortByUrl + searchByUrl + searchByValUrl;
                axios
                    .get(url)
                    .then(response => (this.products = response.data))
                    .catch(error => alert(error))
            }
        }
    })
</script>

<style>
    #app {
        margin: 1em auto;
    }
    .items {
        line-height: 40px;
    }
    select {
        height: 24px;
    }
    input {
        height: 24px;
    }
    button {
        line-height: 24px;
    }
</style>

</html>