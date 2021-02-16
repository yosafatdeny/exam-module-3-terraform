module "instance-ubuntu" {
  source = "github.com/yosafatdeny/exam-module3.git"

  INSTANCE_COUNT  = 1
  AMI             = "ami-09a6a7e49bd29554b"
  INSTANCE_TYPE   = "t2.micro"
  SECURITY_GROUPS = ["sg-04c31832023bb58b0","sg-0f9471248c4f58252"]
  KEYNAME         = "jcde-key"
  TAG_NAME        = "vm-ubuntu"
}

module "instance-redhat" {
  source = "github.com/yosafatdeny/exam-module3.git"

  INSTANCE_COUNT  = 1
  AMI             = "ami-0f86a70488991335e"
  INSTANCE_TYPE   = "t2.micro"
  SECURITY_GROUPS = ["sg-04c31832023bb58b0","sg-0f9471248c4f58252"]
  KEYNAME         = "jcde-key"
  TAG_NAME        = "vm-redhat"
}