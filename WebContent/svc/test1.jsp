<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<head>
    <title>AWS S3 File Upload</title>
     <script src="${project}aws-sdk-2.897.0.min.js"></script>
     
     
</head>

<body>
    <input type="file" id="file-chooser" />
    <button id="upload-button">Upload to S3</button>
    <div id="results"></div>
    <script type="text/javascript">
    AWS.config.region = 'us-east-1'; // 1. Enter your region

    AWS.config.update({
        "accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
        "secretAccessKey": "9LogjlXLsizoYkPCOBUnc/phg3Si6SoVXPy9KPIN",
        "region": "us-east-1"
        });

    var bucketName = 'transvideo-source71e471f1-knewdmajkw29'; // Enter your bucket name
    var bucket = new AWS.S3({
        params: {
            Bucket: bucketName
        }
    });

    var fileChooser = document.getElementById('file-chooser');
    var button = document.getElementById('upload-button');
    var results = document.getElementById('results');
    button.addEventListener('click', function() {

        var file = fileChooser.files[0];

        if (file) {

            results.innerHTML = '';
            var objKey = 'assets01/' + file.name;
            var params = {
                Key: objKey,
                ContentType: file.type,
                Body: file,
                ACL: 'public-read'
            };

            bucket.putObject(params, function(err, data) {
                if (err) {
                    results.innerHTML = 'ERROR: ' + err;
                } else {
                    console.log(data);
                }
            });
        } else {
            results.innerHTML = 'Nothing to upload.';
        }
    }, false);
    // function listObjs() {
    //     var prefix = 'testing';
    //     bucket.listObjects({
    //         Prefix: prefix
    //     }, function(err, data) {
    //         if (err) {
    //             results.innerHTML = 'ERROR: ' + err;
    //         } else {
    //             var objKeys = "";
    //             data.Contents.forEach(function(obj) {
    //                 objKeys += obj.Key + "<br>";
    //             });
    //             results.innerHTML = objKeys;
    //         }
    //     });
    // }
    </script>
</body>
</html>