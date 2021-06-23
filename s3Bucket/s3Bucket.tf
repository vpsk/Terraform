provider "aws" {
    region = "us-west-2"
    profile = "" //  pass here your aws profile
}

resource "aws_s3_bucket" "mybucket" {
    bucket = "mybucket-tf-2106"
    acl = "private"

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}

resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = "${aws_s3_bucket.mybucket.id}"
  key    = "testfile.txt"
  source = "./Testfiles/testfile.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  etag = filemd5("./Testfiles/testfile.txt")
}
