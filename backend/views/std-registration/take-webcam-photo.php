<?php

namespace common\models;

use Yii;
use yii\helpers\Url;

?>
<!DOCTYPE html>
<html>
<head>
    <title>Capture webcam image with php and jquery - ItSolutionStuff.com</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/webcamjs/1.0.25/webcam.min.js"></script>
    <style type="text/css">
        #results { 
            padding:10px; 
            background: #ECF0F5; 
        }
    </style>
</head>
<body>
  
<div class="container" style="margin-top: -30px">
    <h1 class="text-center">Capture Webcam Image</h1>
   
    <form method="POST" action="std-registration">
        <div class="row">
            <div class="col-md-5">
                <h3 align="center">Webcam Photo</h3>
                <div id="my_camera"></div>
                <br/>
                <input type="button" class="btn btn-primary fa-image" value="Take Snapshot" onClick="take_snapshot()">
                <input type="hidden" name="image" class="image-tag">
            </div>
            <div class="col-md-5 col-md-offset-1" style="margin-top: -10px">
                <h3 align="center">Captured Photo</h3>
                <div id="results" class="text-center">Your captured image will appear here...</div>
                <button class="btn btn-success" type="submit" name="save_photo" style="position: absolute; top: 415px; right: 30px">Save Photo</button>
            </div>
        </div>
    </form>
</div>
  
<!-- Configure a few settings and attach camera -->
<script language="JavaScript">
    Webcam.set({
        width: 430,
        height: 330,
        image_format: 'jpeg',
        jpeg_quality: 90
    });
  
    Webcam.attach( '#my_camera' );
  
    function take_snapshot() {
        Webcam.snap( function(data_uri) {
            $(".image-tag").val(data_uri);
            document.getElementById('results').innerHTML = '<img src="'+data_uri+'"/>';
        });
    }
</script>
 
</body>
</html>

<?php
//     if (isset($_POST['image'])) {
//         $img = $_POST['image'];
//         //var_dump($img);
//         //$folderPath = "upload/"; 
//         //$folderPath = \yii\helpers\Url::to("std-registration/upload");

// //        $url = \yii\helpers\Url::to("fee-transaction-detail/fetch-students");
        

//         $folderPath = Url::to('uploads/');

//         // $relativeBaseUrl = Url::base();
//         // $absoluteBaseUrl = Url::base(true);
//         // $httpsAbsoluteBaseUrl = Url::base('https');

//         //$folderPath = Url::isRelative('C:/Users/MRCOM/Pictures/photos/');

//         $image_parts = explode(";base64,", $img);
//         $image_type_aux = explode("image/", $image_parts[0]);
//         $image_type = $image_type_aux[1];
      
//         $image_base64 = base64_decode($image_parts[1]);
//         $fileName = uniqid() . '.png';
      
//         $file = $folderPath . $fileName;
//         file_put_contents($file, $image_base64);

//         print_r($fileName);
//     }
    
?>