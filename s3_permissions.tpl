{
  "Version": "2012-10-17",
  "Id": "Policy1415115909152",
  "Statement": [
    {
      "Sid": "Access-to-specific-VPCE-only",
      "Action": "s3:*",
      "Effect": "Allow",
      "Principal": "*",
      "Resource": [
        "arn:aws:s3:::terraform-stuff",
        "arn:aws:s3:::terraform-stuff/*"
      ],
      "Condition": {
        "StringEquals": {
          "aws:sourceVpce": "${vpce}"
        }
      }
    },
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::terraform-stuff",
        "arn:aws:s3:::terraform-stuff/*"
      ],
      "Principal": {
        "AWS": ""
      }
    }
  ]
}
