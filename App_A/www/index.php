<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
//Piyawat Loawthong
?>

<html>
<head>
<link href="https://unpkg.com/tabulator-tables@5.2.3/dist/css/tabulator_midnight.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://unpkg.com/tabulator-tables@5.2.3/dist/js/tabulator.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body>
    
    <title>Piyawat Loawthong 645162010022</title>
    <?php 
        $sql = "SELECT * FROM Hero;";
        $db = u_mysqli_connect();
        $res = $db->query($sql);
        $dataset = array();
        $count=0;
        while ($row = $res->fetch_assoc()) {
            $count++;
            $row['id'] = $count;
            $dataset[] = $row;
        }
        // n_print($dataset);
    ?>
    <div id="example-table"></div>
    <script>
        var tableData = <?php
         echo json_encode($dataset);
        ?>;
        var table = new Tabulator("#example-table", {
            height:"80%",
            layout:"fitColumns",
            data:tableData,
            progressiveLoad:"scroll",
            paginationSize:20,
            placeholder:"No Data Set",
            columns:[
                {formatter:"image", field:"Picture_link", formatterParams:{width:"200px", height:"200px"} ,width:"210",
                hozAlign:"center", cellClick:function(e, cell){
                    url = "http://localhost/hero.php?id=" + cell.getRow().getData().Hero_id
                    window.open(url, '_blank').focus()
                }},
                {title:"Name", field:"Name", vertAlign:"middle", formatter:function(cell, formatterParams){
                var value = cell.getValue();
                return "<span style='color:#FFF; font-weight:bold; font-size:300%; font-family:Tahoma;'>" + value + "</span>";
                }, cellClick:function(e, cell){
                    url = "http://localhost/hero.php?id=" + cell.getRow().getData().Hero_id
                    window.open(url, '_blank').focus()
                }},
            ],
        });
    </script>
    <h3>Developed by : <a href="http://localhost:9922/index.html" class="btn btn-sm-info"> Piyawat Loawthong </a></h3>
</body>
</html>


<?php //function
    function u_mysqli_connect(){
        $host     = 'sv_db';
        $db       = '0022_Lab_Exam';
        $user     = 'piyawat.lo.user';
        $password = 'piyawat.lo.passw0rd';
        $port     = 3306;
        $charset  = 'utf8mb4';
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        $db = new mysqli($host, $user, $password, $db, $port);
        $db->set_charset($charset);
        $db->options(MYSQLI_OPT_INT_AND_FLOAT_NATIVE, 1);
        return $db;
    }
    function n_print($ar){
        echo "<pre>";
        print_r($ar);
        echo "</pre>";
    }
?>