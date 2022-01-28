<?php

const SERVER = "mysql";
const USR = "root";
const PWD = "root";

function getConn()
{
    // Create connection
    if (empty($dbConn)) {
        $dbConn = new mysqli(SERVER, USR, PWD);
        $dbConn->query("use shoppingDB");
    }

    // Check connection
    if ($dbConn->connect_error) {
        return null;
    }

    return $dbConn;
}

function getProducts($dbConn, $searchBy, $sortBy, $filterKeyWord): array
{
    $retList = [];
    $searchableCol = ['style', 'description', 'baseunitprice'];
    $orderableCols = ['description', 'baseunitprice'];
    $safeSearchBy = $dbConn->real_escape_string($searchBy);
    $safeSortBy = $dbConn->real_escape_string($sortBy);
    $safeFilterKeyWord = $dbConn->real_escape_string($filterKeyWord);

    $baseSql = "SELECT pd.style, pd.description, pd.extdescription, 
            pc.currency, pc.baseunitprice, pc.unitprice, pc.product_id  
            FROM products pd
            INNER JOIN price pc
            ON pd.id = pc.product_id";
    // searchable on `style`, `description`, `baseunitprice` fields
    // TODO, pc.baseunitprice should searched be a rang
    $filterSql = "";
    if (
        in_array(trim($safeSearchBy), $searchableCol)
        && !empty($safeFilterKeyWord)
    ) {
        $tableShortcut = $safeSearchBy == 'baseunitprice' ? 'pc' : 'pd';
        $filterSql = " WHERE $tableShortcut.$safeSearchBy like '%$safeFilterKeyWord%' ";
    }
    // sortable on `description` and `baseunitprice` fields
    $orderSql = "";
    if (in_array($safeSortBy, $orderableCols)) {
        $tableShortcut = $safeSortBy == 'description' ? 'pd' : 'pc';
        $orderSql = " ORDER BY $tableShortcut.$safeSortBy";
    }
    $sql = $baseSql . $filterSql . $orderSql . ';';
    $queryRet = $dbConn->query($sql);
    if (empty($queryRet)) {
        return [];
    }
    while ($row = $queryRet->fetch_assoc()) {
        $retList[] = $row;
    }

    return $retList;
}


// 1. get connection
$conn = getConn();
if (empty($conn)) {
    echo json_encode(['error' => 'fail to connect to db']);
    die;
}

// 2. query
$result = getProducts($conn, $_GET['search'], $_GET['sort'], $_GET['keyword']);

if (!empty($conn)) {
    $conn->close();
}

echo json_encode($result);
