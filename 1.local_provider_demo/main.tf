resource "local_file" "demo_file" {
  content  = "Demo 1."
  filename = "${path.module}/demo.txt"
}