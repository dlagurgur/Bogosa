var AWS = require("aws-sdk");

AWS.config.update({
  "accessKeyId": "AKIAUUHFXRLVBFMMWAY3",
  "secretAccessKey": "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",
  "region": "us-east-1"
});

var s3 = new AWS.S3();
   
    s3.getObject({
        Bucket: "transvideo-source71e471f1-knewdmajkw29", 
        Key: "jobs-manifest.json"
       }
       , function(err, data) {
        if (err) console.log(err, err.stack); // an error occurred
        else
           // console.log(data.Body.toString());           // successful response
           data = data.Body.toString();
           // console.log(a);
           data = JSON.parse(data);
           
           data = data.Jobs.filter(function(element){
               return element.InputFile == 's3://transvideo-source71e471f1-knewdmajkw29/assets01/파일명';
       
            });
           console.log(data[0].Outputs.HLS_GROUP[0]);
       });

    
    
       s3.upload({
           Bucket: 'bucket',
            Key: '업로드할 파일명'}, function(err, data) {
        console.log(err, data);
      });


//    s3.getObject(params, function(err, data) {
//      if (err) console.log(err, err.stack); // an error occurred
//      else
//         // console.log(data.Body.toString());           // successful response
//         var a = data.Body.toString();
//         // console.log(a);
//         var b = JSON.parse(a);
//         var c = b.Jobs;
//         var d = c.filter(function(element){
//             return element.InputFile == 's3://transvideo-source71e471f1-knewdmajkw29/assets01/Pexels Videos 2219383.mp4';
    
//          });
//         console.log(d[0].Outputs.HLS_GROUP[0]);
//     });
