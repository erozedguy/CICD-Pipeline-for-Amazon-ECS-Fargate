resource "aws_lb" "app-lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg2.id]
  subnets            = [ "${aws_subnet.pub-subnets[0].id}", "${aws_subnet.pub-subnets[1].id}" ]

}

resource "aws_lb_target_group" "tg-group" {
  name     = "tg-group"
  port     = "5000"
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.ecs-vpc.id}"
  target_type = "ip"
    
}

# resource "aws_lb_target_group_attachment" "attach-instance" {
#   count             = 2
#   target_group_arn  = aws_lb_target_group.tg-group.arn
#   target_id         = "${element(split(",", join(",", aws_instance.my_instances[*].id)), count.index)}"
#   port              = "5000"
# }

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = "${aws_lb.app-lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-group.arn}"
  }
}