<!DOCTYPE html>
<html>
<head>
    <title>Capture Webcam Image</title>
    <script type="text/javascript" src="js/webcamjs/jquery.min.js"></script>
    <script type="text/javascript" src="js/webcamjs/webcam.min.js"></script>
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
                <h3 align="center">Webcam Image</h3>
                <div id="my_camera"></div>
                <br/>
                <input type="button" class="btn btn-primary fa-image" value="Take Snapshot" onClick="take_snapshot()">
                <input type="hidden" name="image" class="image-tag">
            </div>
            <div class="col-md-5 col-md-offset-1" style="margin-top: -10px">
                <h3 align="center">Captured Image</h3>
                <div id="results" class="text-center">Your captured image will appear here...!</div>
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