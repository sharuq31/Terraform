resource "aws_instance" "my-machine" {
  # Creates two identical aws ec2 instances
  count = 2     
  
  # All four instances will have the same ami and instance_type
  ami = lookup(var.ec2_ami,var.region)
  key_name = "test-key" 
  instance_type = var.instance_type # 
  vpc_security_group_ids = [aws_security_group.test-sg.id]
  tags = {
    # The count.index allows you to launch a resource 
    # starting with the distinct index number 0 and corresponding to this instance.
    Name = "my-machine-${count.index}"
  }

}

resource "aws_security_group" "test-sg" {
  name = "test-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

